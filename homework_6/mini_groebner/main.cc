#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <cstdint>
#include <string>
#include <deque>
#include <algorithm>
#include <chrono>
#include <cstdlib>
#include <omp.h>  // openmp头文件
#include <arm_neon.h>  // NEON指令集头文件

struct row
{
    std::vector<uint64_t> num;
    int size;
    int pivot;

    row(const std::string& str, int N)
    {
        size = N;
        num.resize((N + 63) / 64, 0ULL);
        std::istringstream iss(str);
        int col;
        bool is_pivot = true;
        while (iss >> col)
        {
            num[col / 64] = num[col / 64] | (1ULL << (col % 64));
            if (is_pivot)
            {
                pivot = col;
                is_pivot = false;
            }
        }
    }

    bool isZero() const
    {
        return (pivot == -1);
    }

    void findPivot()
    {
        int start = pivot;
        pivot = -1;
        if (start < 0 || (start / 64) >= (int) num.size())
            start = (int)num.size() * 64 - 1;
        for (int i = start / 64; i >= 0; i--)
        {
            if (num[i] != 0)
            {
                pivot = (63 - __builtin_clzll(num[i]) + i * 64);
                break;
            }
        }
    }

    void xorRow(const row& r)
    {
        for (int i = 0; i < num.size(); i++)
        {
            num[i] = num[i] ^ r.num[i];
        }

        findPivot();
    }

    void xorRowSIMD(const row& r)
    {
        bool is_changed;
        int i = 0;
        for (; i + 1 < num.size(); i += 2)
        {
            uint64x2_t n = vld1q_u64(&num[i]);
            uint64x2_t nr = vld1q_u64(&r.num[i]);
            n = veorq_u64(n, nr);
            vst1q_u64(&num[i], n);
        }

        for (; i < num.size(); i++)
        {
            num[i] = num[i] ^ r.num[i];
        }

        findPivot();
    }

    std::string rowToString()
    {
        std::ostringstream oss;
        for (int i = (int) num.size() - 1; i >= 0; i--)
        {
            uint64_t w = num[i];
            while (w != 0)
            {
                oss << (63 - __builtin_clzll(w) + i * 64) << ' ';
                w = w & ~(1ULL << (63 - __builtin_clzll(w)));
            }
        }

        return oss.str();
    }
};

struct ElimIndex
{
    std::vector<row *> index;
    std::deque<row> elims;

    ElimIndex(int N): index(N, nullptr) {}

    bool exist(int p) const
    {
        return (p >= 0 && p < (int) index.size() && index[p] != nullptr);
    }

    row* get(int p)
    {
        return index[p];
    }

    void insert(row r)
    {
        int p = r.pivot;
        elims.push_back(std::move(r));
        index[p] = &elims.back();
    }
};

void gaussGroebnerSerial(const std::string& elim_file, const std::string& reducer_file, const std::string& result_file, int N, int elim_batch_size, int reducer_batch_size)
{
    std::ifstream efin(elim_file);
    if (!efin)
    {
        std::cerr << "Can't open: " << elim_file << std::endl;
        return;
    }
    std::ifstream rfin(reducer_file);
    if (!rfin)
    {
        std::cerr << "Can't open: " << reducer_file << std::endl;
        return;
    }
    std::ofstream rfout(result_file);
    if (!rfout)
    {
        std::cerr << "Can't open: " << result_file << std::endl;
        return;
    }

    ElimIndex elim_index(N);
    std::vector<row> remain;
    int used_pivot = N;
    bool is_e_done = false, is_r_done = false;

    while (!is_e_done || !is_r_done)
    {
        std::string line;

        if (!is_e_done)
        {
            for (int k = 0; k < elim_batch_size; k++)
            {
                if (!std::getline(efin, line))
                {
                    is_e_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                row r(line, N);
                if (!elim_index.exist(r.pivot))
                {
                    used_pivot = std::min(used_pivot, r.pivot);
                    elim_index.insert(std::move(r));
                }
            }
        }

        std::vector<row> batch = std::move(remain);
        remain.clear();

        if (!is_r_done)
        {
            for (int k = 0; k < reducer_batch_size; k++)
            {
                if (!std::getline(rfin, line))
                {
                    is_r_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                batch.emplace_back(line, N);
            }
        }

        if (batch.empty())
            continue;

        for (auto& r: batch)
        {
            while (!r.isZero() && elim_index.exist(r.pivot))
                r.xorRow(*elim_index.get(r.pivot));

            if (r.isZero())
                continue;

            if (r.pivot >= used_pivot)
            {
                elim_index.insert(r);
                rfout << r.rowToString() << "\r\n";
            }
            else
            {
                remain.push_back(std::move(r));
            }
        }
    }

    for (auto& r: remain)
    {
        if (!r.isZero())
            rfout << r.rowToString() << "\r\n";
    }
}

void gaussGroebnerSIMD(const std::string& elim_file, const std::string& reducer_file, const std::string& result_file, int N, int elim_batch_size, int reducer_batch_size)
{
    std::ifstream efin(elim_file);
    if (!efin)
    {
        std::cerr << "Can't open: " << elim_file << std::endl;
        return;
    }
    std::ifstream rfin(reducer_file);
    if (!rfin)
    {
        std::cerr << "Can't open: " << reducer_file << std::endl;
        return;
    }
    std::ofstream rfout(result_file);
    if (!rfout)
    {
        std::cerr << "Can't open: " << result_file << std::endl;
        return;
    }

    ElimIndex elim_index(N);
    std::vector<row> remain;
    int used_pivot = N;
    bool is_e_done = false, is_r_done = false;

    while (!is_e_done || !is_r_done)
    {
        std::string line;

        if (!is_e_done)
        {
            for (int k = 0; k < elim_batch_size; k++)
            {
                if (!std::getline(efin, line))
                {
                    is_e_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                row r(line, N);
                if (!elim_index.exist(r.pivot))
                {
                    used_pivot = std::min(used_pivot, r.pivot);
                    elim_index.insert(std::move(r));
                }
            }
        }

        std::vector<row> batch = std::move(remain);
        remain.clear();

        if (!is_r_done)
        {
            for (int k = 0; k < reducer_batch_size; k++)
            {
                if (!std::getline(rfin, line))
                {
                    is_r_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                batch.emplace_back(line, N);
            }
        }

        if (batch.empty())
            continue;

        for (auto& r: batch)
        {
            while (!r.isZero() && elim_index.exist(r.pivot))
                r.xorRowSIMD(*elim_index.get(r.pivot));

            if (r.isZero())
                continue;

            if (r.pivot >= used_pivot)
            {
                elim_index.insert(r);
                rfout << r.rowToString() << "\r\n";
            }
            else
            {
                remain.push_back(std::move(r));
            }
        }
    }

    for (auto& r: remain)
    {
        if (!r.isZero())
            rfout << r.rowToString() << "\r\n";
    }
}

void gaussGroebnerOpenMP(const std::string& elim_file, const std::string& reducer_file, const std::string& result_file, int N, int elim_batch_size, int reducer_batch_size, int thread_num)
{
    std::ifstream efin(elim_file);
    if (!efin)
    {
        std::cerr << "Can't open: " << elim_file << std::endl;
        return;
    }
    std::ifstream rfin(reducer_file);
    if (!rfin)
    {
        std::cerr << "Can't open: " << reducer_file << std::endl;
        return;
    }
    std::ofstream rfout(result_file);
    if (!rfout)
    {
        std::cerr << "Can't open: " << result_file << std::endl;
        return;
    }

    ElimIndex elim_index(N);
    std::vector<row> remain;
    int used_pivot = N;
    bool is_e_done = false, is_r_done = false;

    while (!is_e_done || !is_r_done)
    {
        std::string line;

        if (!is_e_done)
        {
            for (int k = 0; k < elim_batch_size; k++)
            {
                if (!std::getline(efin, line))
                {
                    is_e_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                row r(line, N);
                if (!elim_index.exist(r.pivot))
                {
                    used_pivot = std::min(used_pivot, r.pivot);
                    elim_index.insert(std::move(r));
                }
            }
        }

        std::vector<row> batch = std::move(remain);
        remain.clear();

        if (!is_r_done)
        {
            for (int k = 0; k < reducer_batch_size; k++)
            {
                if (!std::getline(rfin, line))
                {
                    is_r_done = true;
                    break;
                }

                if (line.find_first_not_of(" \t\r\n") == std::string::npos)
                {
                    k--;
                    continue;
                }

                batch.emplace_back(line, N);
            }
        }

        if (batch.empty())
            continue;

        #pragma omp parallel for if (batch.size() > 512) num_threads(thread_num) schedule(static)
        for (int i = 0; i < batch.size(); i++)
        {
            row& r = batch[i];
            while (!r.isZero() && elim_index.exist(r.pivot))
                r.xorRowSIMD(*elim_index.get(r.pivot));
        }

        for (int i = 0; i < batch.size(); i++)
        {
            row& r = batch[i];
            if (r.isZero())
                continue;
                
            if (r.pivot >= used_pivot)
            {
                elim_index.insert(r);
                #pragma omp parallel for if (batch.size() - i - 1 > 512) num_threads(thread_num) schedule(dynamic)
                for (int j = i + 1; j < batch.size(); j++)
                {
                    row& rj = batch[j];
                    while (!rj.isZero() && elim_index.exist(rj.pivot))
                        rj.xorRowSIMD(*elim_index.get(rj.pivot));
                }
                rfout << r.rowToString() << "\r\n";
            }
            else
            {
                remain.push_back(std::move(r));
            }
        }
    }

    #pragma omp parallel for if (remain.size() > 512) num_threads(thread_num) schedule(static)
    for (int i = 0; i < remain.size(); i++)
    {
        row& r = remain[i];
        while (!r.isZero() && elim_index.exist(r.pivot))
            r.xorRowSIMD(*elim_index.get(r.pivot));
    }

    for (int i = 0; i < remain.size(); i++)
    {
        row& r = remain[i];

        if (r.isZero())
            continue;
        else
            rfout << r.rowToString() << "\r\n";
    }
}

bool compareFile(const std::string& out_file, const std::string& resu_file)
{
    std::ifstream ofin(out_file);
    if (!ofin)
    {
        std::cerr << "Can't open: " << out_file << std::endl;
        return false;
    }
    std::ifstream rfin(resu_file);
    if (!rfin)
    {
        std::cerr << "Can't open: " << resu_file << std::endl;
        return false;
    }

    std::string temp_out, temp_resu;
    std::vector<std::string> out, resu;
    while (std::getline(ofin, temp_out))
    {
        if (!temp_out.empty() && temp_out.back() == '\r')
            temp_out.pop_back();

        if (temp_out.find_first_not_of(" \t\r\n") == std::string::npos)
            continue; 

        out.push_back(temp_out);
    }
    std::sort(out.begin(), out.end());

    while (std::getline(rfin, temp_resu))
    {
        if (!temp_resu.empty() && temp_resu.back() == '\r')
            temp_resu.pop_back();

        if (temp_resu.find_first_not_of(" \t\r\n") == std::string::npos)
            continue; 

        resu.push_back(temp_resu);
    }
    std::sort(resu.begin(), resu.end());

    return (out == resu);
}

struct param
{
    std::string name;
    int N;
};

int main(int argc, char *argv[])
{
    param params[7] = {
        {"1_130_22_8", 130},
        {"2_254_106_53", 254},
        {"3_562_170_53", 562},
        {"4_1011_539_263", 1011},
        {"5_2362_1226_453", 2362},
        {"6_3799_2759_1953", 3799},
        {"7_8399_6375_4535", 8399}
    };
    int elim_batch_size = 512;
    int reducer_batch_size = 512;
    int thread_num = 8;

    for (int i = 0; i < 7; i++)
    {
        std::ofstream ifout("mini_groebner/" + params[i].name + "/info.txt");
        if (!ifout)
        {
            std::cerr << "Can't open: mini_groebner/" << params[i].name << "/info.txt" << std::endl;
            return 1;
        }
        std::chrono::duration<double, std::milli> elapsed;
        std::chrono::high_resolution_clock::time_point Start, End;

        Start = std::chrono::high_resolution_clock::now();
        gaussGroebnerSerial("mini_groebner/" + params[i].name + "/elim.txt", "mini_groebner/" + params[i].name + "/redu.txt", "mini_groebner/" + params[i].name + "/out_se.txt", params[i].N, elim_batch_size, reducer_batch_size);
        End = std::chrono::high_resolution_clock::now();
        elapsed = End - Start;
        ifout << "serial elapsed: " << elapsed.count() << " (ms)" << "\r\n";

        Start = std::chrono::high_resolution_clock::now();
        gaussGroebnerSIMD("mini_groebner/" + params[i].name + "/elim.txt", "mini_groebner/" + params[i].name + "/redu.txt", "mini_groebner/" + params[i].name + "/out_si.txt", params[i].N, elim_batch_size, reducer_batch_size);
        End = std::chrono::high_resolution_clock::now();
        elapsed = End - Start;
        ifout << "simd elapsed: " << elapsed.count() << " (ms)" << "\r\n";

        Start = std::chrono::high_resolution_clock::now();
        gaussGroebnerOpenMP("mini_groebner/" + params[i].name + "/elim.txt", "mini_groebner/" + params[i].name + "/redu.txt", "mini_groebner/" + params[i].name + "/out_op.txt", params[i].N, elim_batch_size, reducer_batch_size, thread_num);
        End = std::chrono::high_resolution_clock::now();
        elapsed = End - Start;
        ifout << "openmp elapsed: " << elapsed.count() << " (ms)" << "\r\n";

        bool result_se = compareFile("mini_groebner/" + params[i].name + "/out_se.txt", "mini_groebner/" + params[i].name + "/resu.txt");
        ifout << "serial: " << (result_se ? "equal" : "not equal") << "\r\n";
        bool result_si = compareFile("mini_groebner/" + params[i].name + "/out_si.txt", "mini_groebner/" + params[i].name + "/resu.txt");
        ifout << "simd: " << (result_si ? "equal" : "not equal") << "\r\n";
        bool result_op = compareFile("mini_groebner/" + params[i].name + "/out_op.txt", "mini_groebner/" + params[i].name + "/resu.txt");
        ifout << "openmp: " << (result_op ? "equal" : "not equal") << "\r\n";
    }

    return 0;
}