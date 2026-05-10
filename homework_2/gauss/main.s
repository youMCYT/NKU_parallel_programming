
main:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000400c50 <_init>:
  400c50:	d503201f 	nop
  400c54:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400c58:	910003fd 	mov	x29, sp
  400c5c:	940001fa 	bl	401444 <call_weak_fn>
  400c60:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400c64:	d65f03c0 	ret

Disassembly of section .plt:

0000000000400c70 <.plt>:
  400c70:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
  400c74:	f00000f0 	adrp	x16, 41f000 <__FRAME_END__+0x1c8a0>
  400c78:	f947fe11 	ldr	x17, [x16, #4088]
  400c7c:	913fe210 	add	x16, x16, #0xff8
  400c80:	d61f0220 	br	x17
  400c84:	d503201f 	nop
  400c88:	d503201f 	nop
  400c8c:	d503201f 	nop

0000000000400c90 <_ZNSo3putEc@plt>:
  400c90:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400c94:	f9400211 	ldr	x17, [x16]
  400c98:	91000210 	add	x16, x16, #0x0
  400c9c:	d61f0220 	br	x17

0000000000400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>:
  400ca0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400ca4:	f9400611 	ldr	x17, [x16, #8]
  400ca8:	91002210 	add	x16, x16, #0x8
  400cac:	d61f0220 	br	x17

0000000000400cb0 <memcpy@plt>:
  400cb0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400cb4:	f9400a11 	ldr	x17, [x16, #16]
  400cb8:	91004210 	add	x16, x16, #0x10
  400cbc:	d61f0220 	br	x17

0000000000400cc0 <_ZNSo5flushEv@plt>:
  400cc0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400cc4:	f9400e11 	ldr	x17, [x16, #24]
  400cc8:	91006210 	add	x16, x16, #0x18
  400ccc:	d61f0220 	br	x17

0000000000400cd0 <__libc_start_main@plt>:
  400cd0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400cd4:	f9401211 	ldr	x17, [x16, #32]
  400cd8:	91008210 	add	x16, x16, #0x20
  400cdc:	d61f0220 	br	x17

0000000000400ce0 <_ZNSt13random_device7_M_finiEv@plt>:
  400ce0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400ce4:	f9401611 	ldr	x17, [x16, #40]
  400ce8:	9100a210 	add	x16, x16, #0x28
  400cec:	d61f0220 	br	x17

0000000000400cf0 <_ZdlPvm@plt>:
  400cf0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400cf4:	f9401a11 	ldr	x17, [x16, #48]
  400cf8:	9100c210 	add	x16, x16, #0x30
  400cfc:	d61f0220 	br	x17

0000000000400d00 <__cxa_atexit@plt>:
  400d00:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d04:	f9401e11 	ldr	x17, [x16, #56]
  400d08:	9100e210 	add	x16, x16, #0x38
  400d0c:	d61f0220 	br	x17

0000000000400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
  400d10:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d14:	f9402211 	ldr	x17, [x16, #64]
  400d18:	91010210 	add	x16, x16, #0x40
  400d1c:	d61f0220 	br	x17

0000000000400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>:
  400d20:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d24:	f9402611 	ldr	x17, [x16, #72]
  400d28:	91012210 	add	x16, x16, #0x48
  400d2c:	d61f0220 	br	x17

0000000000400d30 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>:
  400d30:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d34:	f9402a11 	ldr	x17, [x16, #80]
  400d38:	91014210 	add	x16, x16, #0x50
  400d3c:	d61f0220 	br	x17

0000000000400d40 <_ZSt16__throw_bad_castv@plt>:
  400d40:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d44:	f9402e11 	ldr	x17, [x16, #88]
  400d48:	91016210 	add	x16, x16, #0x58
  400d4c:	d61f0220 	br	x17

0000000000400d50 <_ZNSt13random_device9_M_getvalEv@plt>:
  400d50:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d54:	f9403211 	ldr	x17, [x16, #96]
  400d58:	91018210 	add	x16, x16, #0x60
  400d5c:	d61f0220 	br	x17

0000000000400d60 <_ZNSt8ios_base4InitC1Ev@plt>:
  400d60:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d64:	f9403611 	ldr	x17, [x16, #104]
  400d68:	9101a210 	add	x16, x16, #0x68
  400d6c:	d61f0220 	br	x17

0000000000400d70 <abort@plt>:
  400d70:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d74:	f9403a11 	ldr	x17, [x16, #112]
  400d78:	9101c210 	add	x16, x16, #0x70
  400d7c:	d61f0220 	br	x17

0000000000400d80 <_ZNSo9_M_insertIdEERSoT_@plt>:
  400d80:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d84:	f9403e11 	ldr	x17, [x16, #120]
  400d88:	9101e210 	add	x16, x16, #0x78
  400d8c:	d61f0220 	br	x17

0000000000400d90 <__gxx_personality_v0@plt>:
  400d90:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400d94:	f9404211 	ldr	x17, [x16, #128]
  400d98:	91020210 	add	x16, x16, #0x80
  400d9c:	d61f0220 	br	x17

0000000000400da0 <_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@plt>:
  400da0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400da4:	f9404611 	ldr	x17, [x16, #136]
  400da8:	91022210 	add	x16, x16, #0x88
  400dac:	d61f0220 	br	x17

0000000000400db0 <_ZNSolsEi@plt>:
  400db0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400db4:	f9404a11 	ldr	x17, [x16, #144]
  400db8:	91024210 	add	x16, x16, #0x90
  400dbc:	d61f0220 	br	x17

0000000000400dc0 <_Unwind_Resume@plt>:
  400dc0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400dc4:	f9404e11 	ldr	x17, [x16, #152]
  400dc8:	91026210 	add	x16, x16, #0x98
  400dcc:	d61f0220 	br	x17

0000000000400dd0 <__gmon_start__@plt>:
  400dd0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400dd4:	f9405211 	ldr	x17, [x16, #160]
  400dd8:	91028210 	add	x16, x16, #0xa0
  400ddc:	d61f0220 	br	x17

0000000000400de0 <_ZNSt8ios_base4InitD1Ev@plt>:
  400de0:	90000110 	adrp	x16, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400de4:	f9405611 	ldr	x17, [x16, #168]
  400de8:	9102a210 	add	x16, x16, #0xa8
  400dec:	d61f0220 	br	x17

Disassembly of section .text:

0000000000400e00 <main>:

    return result;
}

int main(int argc, char *argv[])
{
  400e00:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
	  static constexpr _ToDur
	  __cast(const duration<_Rep, _Period>& __d)
	  {
	    typedef typename _ToDur::rep			__to_rep;
	    return _ToDur(static_cast<__to_rep>(
	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
  400e04:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
  400e08:	f2e825c0 	movk	x0, #0x412e, lsl #48
  400e0c:	910003fd 	mov	x29, sp
  400e10:	6d0627e8 	stp	d8, d9, [sp, #96]
    std::chrono::duration<double, std::milli> elapsed1(0.0), elapsed2(0.0), elapsed3(0.0), elapsed4(0.0);
  400e14:	2f00e409 	movi	d9, #0x0
  400e18:	9e670008 	fmov	d8, x0
{
  400e1c:	fd002fec 	str	d12, [sp, #88]
  400e20:	6d072fea 	stp	d10, d11, [sp, #112]
    std::chrono::duration<double, std::milli> elapsed1(0.0), elapsed2(0.0), elapsed3(0.0), elapsed4(0.0);
  400e24:	1e60412c 	fmov	d12, d9
  400e28:	1e60412b 	fmov	d11, d9
  400e2c:	1e60412a 	fmov	d10, d9
{
  400e30:	a9025bf5 	stp	x21, x22, [sp, #32]
  400e34:	90000116 	adrp	x22, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  400e38:	910342d6 	add	x22, x22, #0xd0
  400e3c:	a90363f7 	stp	x23, x24, [sp, #48]
  400e40:	d0000017 	adrp	x23, 402000 <_Z7m_reseti+0xd0>
  400e44:	910682f7 	add	x23, x23, #0x1a0
  400e48:	a9046bf9 	stp	x25, x26, [sp, #64]
  400e4c:	d000001a 	adrp	x26, 402000 <_Z7m_reseti+0xd0>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  400e50:	d0000019 	adrp	x25, 402000 <_Z7m_reseti+0xd0>
  400e54:	910ca35a 	add	x26, x26, #0x328
  400e58:	910cc339 	add	x25, x25, #0x330
  400e5c:	52800158 	mov	w24, #0xa                   	// #10
  400e60:	a90153f3 	stp	x19, x20, [sp, #16]
    std::chrono::high_resolution_clock::time_point Start, End;
    for (int n = 4; n <= size; n *= 2)
  400e64:	52800094 	mov	w20, #0x4                   	// #4
{
  400e68:	f9002bfb 	str	x27, [sp, #80]
  400e6c:	d503201f 	nop
  400e70:	d28000c2 	mov	x2, #0x6                   	// #6
  400e74:	aa1a03e1 	mov	x1, x26
  400e78:	aa1603e0 	mov	x0, x22
  400e7c:	97ffffa5 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    {
        std::cout << "size: " << n << std::endl;
  400e80:	2a1403e1 	mov	w1, w20
  400e84:	aa1603e0 	mov	x0, x22
  400e88:	97ffffca 	bl	400db0 <_ZNSolsEi@plt>
  400e8c:	aa0003f3 	mov	x19, x0
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
  400e90:	f9400000 	ldr	x0, [x0]
  400e94:	f85e8000 	ldur	x0, [x0, #-24]
  400e98:	8b000260 	add	x0, x19, x0
  400e9c:	f9407815 	ldr	x21, [x0, #240]

  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
  400ea0:	b4002275 	cbz	x21, 4012ec <main+0x4ec>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
  400ea4:	3940e2a0 	ldrb	w0, [x21, #56]
  400ea8:	340019e0 	cbz	w0, 4011e4 <main+0x3e4>
	  return _M_widen[static_cast<unsigned char>(__c)];
  400eac:	39410ea1 	ldrb	w1, [x21, #67]
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
  400eb0:	5280029b 	mov	w27, #0x14                  	// #20
    { return flush(__os.put(__os.widen('\n'))); }
  400eb4:	aa1303e0 	mov	x0, x19
        int unequal_count = renum;
  400eb8:	2a1b03f5 	mov	w21, w27
  400ebc:	97ffff75 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  400ec0:	97ffff80 	bl	400cc0 <_ZNSo5flushEv@plt>
        for (int i = 0; i < renum; i++)
  400ec4:	d503201f 	nop
        {
            m_reset(n);
  400ec8:	2a1403e0 	mov	w0, w20
  400ecc:	94000419 	bl	401f30 <_Z7m_reseti>
            Start = std::chrono::high_resolution_clock::now();
  400ed0:	97ffff74 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
  400ed4:	aa0003f3 	mov	x19, x0
            gauss_serial(n);
  400ed8:	2a1403e0 	mov	w0, w20
  400edc:	9400018d 	bl	401510 <_Z12gauss_seriali>
            End = std::chrono::high_resolution_clock::now();
  400ee0:	97ffff70 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
		const duration<_Rep2, _Period2>& __rhs)
      {
	typedef duration<_Rep1, _Period1>			__dur1;
	typedef duration<_Rep2, _Period2>			__dur2;
	typedef typename common_type<__dur1,__dur2>::type	__cd;
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
  400ee4:	cb130000 	sub	x0, x0, x19
	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
  400ee8:	9e620000 	scvtf	d0, x0
  400eec:	1e681800 	fdiv	d0, d0, d8
	  __r += __d.count();
  400ef0:	1e60298c 	fadd	d12, d12, d0
            elapsed1 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
  400ef4:	97ffff6b 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
  400ef8:	aa0003f3 	mov	x19, x0
            gauss_simd(n);
  400efc:	2a1403e0 	mov	w0, w20
  400f00:	940001c4 	bl	401610 <_Z10gauss_simdi>
            End = std::chrono::high_resolution_clock::now();
  400f04:	97ffff67 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
  400f08:	cb130000 	sub	x0, x0, x19
	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
  400f0c:	9e620000 	scvtf	d0, x0
  400f10:	1e681800 	fdiv	d0, d0, d8
	  __r += __d.count();
  400f14:	1e60294a 	fadd	d10, d10, d0
            elapsed2 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
  400f18:	97ffff62 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
  400f1c:	aa0003f3 	mov	x19, x0
            gauss_simd_cache(n);
  400f20:	2a1403e0 	mov	w0, w20
  400f24:	94000243 	bl	401830 <_Z16gauss_simd_cachei>
            End = std::chrono::high_resolution_clock::now();
  400f28:	97ffff5e 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
  400f2c:	cb130000 	sub	x0, x0, x19
	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
  400f30:	9e620000 	scvtf	d0, x0
  400f34:	1e681800 	fdiv	d0, d0, d8
	  __r += __d.count();
  400f38:	1e602929 	fadd	d9, d9, d0
            elapsed3 += End - Start;

            Start = std::chrono::high_resolution_clock::now();
  400f3c:	97ffff59 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
  400f40:	aa0003f3 	mov	x19, x0
            gauss_simd_align(n);
  400f44:	2a1403e0 	mov	w0, w20
  400f48:	94000306 	bl	401b60 <_Z16gauss_simd_aligni>
            End = std::chrono::high_resolution_clock::now();
  400f4c:	97ffff55 	bl	400ca0 <_ZNSt6chrono3_V212system_clock3nowEv@plt>
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
  400f50:	cb130001 	sub	x1, x0, x19
            elapsed4 += End - Start;

            if (m_cmp(n))
  400f54:	2a1403e0 	mov	w0, w20
	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
  400f58:	9e620020 	scvtf	d0, x1
  400f5c:	1e681800 	fdiv	d0, d0, d8
	  __r += __d.count();
  400f60:	1e60296b 	fadd	d11, d11, d0
  400f64:	940003b3 	bl	401e30 <_Z5m_cmpi>
                --unequal_count;
  400f68:	72001c1f 	tst	w0, #0xff
  400f6c:	1a9f07e0 	cset	w0, ne  // ne = any
        for (int i = 0; i < renum; i++)
  400f70:	7100077b 	subs	w27, w27, #0x1
                --unequal_count;
  400f74:	4b0002b5 	sub	w21, w21, w0
        for (int i = 0; i < renum; i++)
  400f78:	54fffa81 	b.ne	400ec8 <main+0xc8>  // b.any
	__ostream_insert(__out, __s,
  400f7c:	d28001e2 	mov	x2, #0xf                   	// #15
  400f80:	aa1903e1 	mov	x1, x25
  400f84:	aa1603e0 	mov	x0, x22
  400f88:	97ffff62 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
        }
        std::cout << "unequal count: " << unequal_count << std::endl;
  400f8c:	2a1503e1 	mov	w1, w21
  400f90:	aa1603e0 	mov	x0, x22
  400f94:	97ffff87 	bl	400db0 <_ZNSolsEi@plt>
  400f98:	aa0003f3 	mov	x19, x0
    { return flush(__os.put(__os.widen('\n'))); }
  400f9c:	f9400000 	ldr	x0, [x0]
  400fa0:	f85e8000 	ldur	x0, [x0, #-24]
  400fa4:	8b000260 	add	x0, x19, x0
  400fa8:	f9407815 	ldr	x21, [x0, #240]
  400fac:	b4001a15 	cbz	x21, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  400fb0:	3940e2a0 	ldrb	w0, [x21, #56]
  400fb4:	34001020 	cbz	w0, 4011b8 <main+0x3b8>
	  return _M_widen[static_cast<unsigned char>(__c)];
  400fb8:	39410ea1 	ldrb	w1, [x21, #67]
  400fbc:	aa1303e0 	mov	x0, x19
  400fc0:	97ffff34 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  400fc4:	97ffff3f 	bl	400cc0 <_ZNSo5flushEv@plt>
	__ostream_insert(__out, __s,
  400fc8:	d0000013 	adrp	x19, 402000 <_Z7m_reseti+0xd0>
  400fcc:	d28002a2 	mov	x2, #0x15                  	// #21
  400fd0:	aa1603e0 	mov	x0, x22
  400fd4:	d0000001 	adrp	x1, 402000 <_Z7m_reseti+0xd0>
  400fd8:	910d0021 	add	x1, x1, #0x340
  400fdc:	97ffff4d 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
  400fe0:	910d6273 	add	x19, x19, #0x358
        std::cout << "serial average time: " << elapsed1.count() / renum << " (ms)" << std::endl;
  400fe4:	1e669000 	fmov	d0, #2.000000000000000000e+01
      { return _M_insert(__f); }
  400fe8:	aa1603e0 	mov	x0, x22
  400fec:	1e601980 	fdiv	d0, d12, d0
  400ff0:	97ffff64 	bl	400d80 <_ZNSo9_M_insertIdEERSoT_@plt>
  400ff4:	aa0003f5 	mov	x21, x0
	__ostream_insert(__out, __s,
  400ff8:	aa1303e1 	mov	x1, x19
  400ffc:	d28000a2 	mov	x2, #0x5                   	// #5
  401000:	97ffff44 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    { return flush(__os.put(__os.widen('\n'))); }
  401004:	f94002a0 	ldr	x0, [x21]
  401008:	f85e8000 	ldur	x0, [x0, #-24]
  40100c:	8b0002a0 	add	x0, x21, x0
  401010:	f940781b 	ldr	x27, [x0, #240]
  401014:	b40016db 	cbz	x27, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  401018:	3940e360 	ldrb	w0, [x27, #56]
  40101c:	34001520 	cbz	w0, 4012c0 <main+0x4c0>
	  return _M_widen[static_cast<unsigned char>(__c)];
  401020:	39410f61 	ldrb	w1, [x27, #67]
  401024:	aa1503e0 	mov	x0, x21
  401028:	97ffff1a 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  40102c:	97ffff25 	bl	400cc0 <_ZNSo5flushEv@plt>
	__ostream_insert(__out, __s,
  401030:	d2800262 	mov	x2, #0x13                  	// #19
  401034:	aa1603e0 	mov	x0, x22
  401038:	b0000001 	adrp	x1, 402000 <_Z7m_reseti+0xd0>
  40103c:	910d8021 	add	x1, x1, #0x360
  401040:	97ffff34 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
        std::cout << "simd average time: " << elapsed2.count() / renum << " (ms)" << std::endl;
  401044:	1e669000 	fmov	d0, #2.000000000000000000e+01
      { return _M_insert(__f); }
  401048:	aa1603e0 	mov	x0, x22
  40104c:	1e601940 	fdiv	d0, d10, d0
  401050:	97ffff4c 	bl	400d80 <_ZNSo9_M_insertIdEERSoT_@plt>
  401054:	aa0003f5 	mov	x21, x0
	__ostream_insert(__out, __s,
  401058:	aa1303e1 	mov	x1, x19
  40105c:	d28000a2 	mov	x2, #0x5                   	// #5
  401060:	97ffff2c 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    { return flush(__os.put(__os.widen('\n'))); }
  401064:	f94002a0 	ldr	x0, [x21]
  401068:	f85e8000 	ldur	x0, [x0, #-24]
  40106c:	8b0002a0 	add	x0, x21, x0
  401070:	f940781b 	ldr	x27, [x0, #240]
  401074:	b40013db 	cbz	x27, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  401078:	3940e360 	ldrb	w0, [x27, #56]
  40107c:	340010c0 	cbz	w0, 401294 <main+0x494>
	  return _M_widen[static_cast<unsigned char>(__c)];
  401080:	39410f61 	ldrb	w1, [x27, #67]
  401084:	aa1503e0 	mov	x0, x21
  401088:	97ffff02 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  40108c:	97ffff0d 	bl	400cc0 <_ZNSo5flushEv@plt>
	__ostream_insert(__out, __s,
  401090:	d2800282 	mov	x2, #0x14                  	// #20
  401094:	aa1603e0 	mov	x0, x22
  401098:	b0000001 	adrp	x1, 402000 <_Z7m_reseti+0xd0>
  40109c:	910de021 	add	x1, x1, #0x378
  4010a0:	97ffff1c 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
        std::cout << "cache average time: " << elapsed3.count() / renum << " (ms)" << std::endl;
  4010a4:	1e669000 	fmov	d0, #2.000000000000000000e+01
      { return _M_insert(__f); }
  4010a8:	aa1603e0 	mov	x0, x22
  4010ac:	1e601920 	fdiv	d0, d9, d0
  4010b0:	97ffff34 	bl	400d80 <_ZNSo9_M_insertIdEERSoT_@plt>
  4010b4:	aa0003f5 	mov	x21, x0
	__ostream_insert(__out, __s,
  4010b8:	aa1303e1 	mov	x1, x19
  4010bc:	d28000a2 	mov	x2, #0x5                   	// #5
  4010c0:	97ffff14 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    { return flush(__os.put(__os.widen('\n'))); }
  4010c4:	f94002a0 	ldr	x0, [x21]
  4010c8:	f85e8000 	ldur	x0, [x0, #-24]
  4010cc:	8b0002a0 	add	x0, x21, x0
  4010d0:	f940781b 	ldr	x27, [x0, #240]
  4010d4:	b40010db 	cbz	x27, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  4010d8:	3940e360 	ldrb	w0, [x27, #56]
  4010dc:	34000c60 	cbz	w0, 401268 <main+0x468>
	  return _M_widen[static_cast<unsigned char>(__c)];
  4010e0:	39410f61 	ldrb	w1, [x27, #67]
  4010e4:	aa1503e0 	mov	x0, x21
  4010e8:	97fffeea 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  4010ec:	97fffef5 	bl	400cc0 <_ZNSo5flushEv@plt>
	__ostream_insert(__out, __s,
  4010f0:	d2800302 	mov	x2, #0x18                  	// #24
  4010f4:	aa1603e0 	mov	x0, x22
  4010f8:	b0000001 	adrp	x1, 402000 <_Z7m_reseti+0xd0>
  4010fc:	910e4021 	add	x1, x1, #0x390
  401100:	97ffff04 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
        std::cout << "alignment average time: " << elapsed4.count() / renum << " (ms)" << std::endl << std::endl;
  401104:	1e669000 	fmov	d0, #2.000000000000000000e+01
      { return _M_insert(__f); }
  401108:	aa1603e0 	mov	x0, x22
  40110c:	1e601960 	fdiv	d0, d11, d0
  401110:	97ffff1c 	bl	400d80 <_ZNSo9_M_insertIdEERSoT_@plt>
  401114:	aa0003f5 	mov	x21, x0
	__ostream_insert(__out, __s,
  401118:	aa1303e1 	mov	x1, x19
  40111c:	d28000a2 	mov	x2, #0x5                   	// #5
  401120:	97fffefc 	bl	400d10 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    { return flush(__os.put(__os.widen('\n'))); }
  401124:	f94002a0 	ldr	x0, [x21]
  401128:	f85e8000 	ldur	x0, [x0, #-24]
  40112c:	8b0002a0 	add	x0, x21, x0
  401130:	f9407813 	ldr	x19, [x0, #240]
  401134:	b4000dd3 	cbz	x19, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  401138:	3940e260 	ldrb	w0, [x19, #56]
  40113c:	34000800 	cbz	w0, 40123c <main+0x43c>
	  return _M_widen[static_cast<unsigned char>(__c)];
  401140:	39410e61 	ldrb	w1, [x19, #67]
  401144:	aa1503e0 	mov	x0, x21
  401148:	97fffed2 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  40114c:	97fffedd 	bl	400cc0 <_ZNSo5flushEv@plt>
  401150:	aa0003f3 	mov	x19, x0
    { return flush(__os.put(__os.widen('\n'))); }
  401154:	f9400000 	ldr	x0, [x0]
  401158:	f85e8000 	ldur	x0, [x0, #-24]
  40115c:	8b000260 	add	x0, x19, x0
  401160:	f9407815 	ldr	x21, [x0, #240]
  401164:	b4000c55 	cbz	x21, 4012ec <main+0x4ec>
	if (_M_widen_ok)
  401168:	3940e2a0 	ldrb	w0, [x21, #56]
  40116c:	34000520 	cbz	w0, 401210 <main+0x410>
	  return _M_widen[static_cast<unsigned char>(__c)];
  401170:	39410ea1 	ldrb	w1, [x21, #67]
  401174:	aa1303e0 	mov	x0, x19
  401178:	97fffec6 	bl	400c90 <_ZNSo3putEc@plt>
    { return __os.flush(); }
  40117c:	97fffed1 	bl	400cc0 <_ZNSo5flushEv@plt>
    for (int n = 4; n <= size; n *= 2)
  401180:	531f7a94 	lsl	w20, w20, #1
  401184:	71000718 	subs	w24, w24, #0x1
  401188:	54ffe741 	b.ne	400e70 <main+0x70>  // b.any
        elapsed2.zero();
        elapsed3.zero();
        elapsed4.zero();
    }
    return 0;
}
  40118c:	52800000 	mov	w0, #0x0                   	// #0
  401190:	fd402fec 	ldr	d12, [sp, #88]
  401194:	a94153f3 	ldp	x19, x20, [sp, #16]
  401198:	a9425bf5 	ldp	x21, x22, [sp, #32]
  40119c:	a94363f7 	ldp	x23, x24, [sp, #48]
  4011a0:	a9446bf9 	ldp	x25, x26, [sp, #64]
  4011a4:	f9402bfb 	ldr	x27, [sp, #80]
  4011a8:	6d4627e8 	ldp	d8, d9, [sp, #96]
  4011ac:	6d472fea 	ldp	d10, d11, [sp, #112]
  4011b0:	a8c87bfd 	ldp	x29, x30, [sp], #128
  4011b4:	d65f03c0 	ret
	this->_M_widen_init();
  4011b8:	aa1503e0 	mov	x0, x21
  4011bc:	97fffed9 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  4011c0:	f94002a0 	ldr	x0, [x21]
  4011c4:	52800141 	mov	w1, #0xa                   	// #10
  4011c8:	f9401802 	ldr	x2, [x0, #48]
  4011cc:	eb17005f 	cmp	x2, x23
  4011d0:	54ffef60 	b.eq	400fbc <main+0x1bc>  // b.none
  4011d4:	aa1503e0 	mov	x0, x21
  4011d8:	d63f0040 	blr	x2
  4011dc:	12001c01 	and	w1, w0, #0xff
  4011e0:	17ffff77 	b	400fbc <main+0x1bc>
	this->_M_widen_init();
  4011e4:	aa1503e0 	mov	x0, x21
  4011e8:	97fffece 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  4011ec:	f94002a0 	ldr	x0, [x21]
  4011f0:	52800141 	mov	w1, #0xa                   	// #10
  4011f4:	f9401802 	ldr	x2, [x0, #48]
  4011f8:	eb17005f 	cmp	x2, x23
  4011fc:	54ffe5a0 	b.eq	400eb0 <main+0xb0>  // b.none
  401200:	aa1503e0 	mov	x0, x21
  401204:	d63f0040 	blr	x2
  401208:	12001c01 	and	w1, w0, #0xff
  40120c:	17ffff29 	b	400eb0 <main+0xb0>
	this->_M_widen_init();
  401210:	aa1503e0 	mov	x0, x21
  401214:	97fffec3 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  401218:	f94002a0 	ldr	x0, [x21]
  40121c:	52800141 	mov	w1, #0xa                   	// #10
  401220:	f9401802 	ldr	x2, [x0, #48]
  401224:	eb17005f 	cmp	x2, x23
  401228:	54fffa60 	b.eq	401174 <main+0x374>  // b.none
  40122c:	aa1503e0 	mov	x0, x21
  401230:	d63f0040 	blr	x2
  401234:	12001c01 	and	w1, w0, #0xff
  401238:	17ffffcf 	b	401174 <main+0x374>
	this->_M_widen_init();
  40123c:	aa1303e0 	mov	x0, x19
  401240:	97fffeb8 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  401244:	f9400260 	ldr	x0, [x19]
  401248:	52800141 	mov	w1, #0xa                   	// #10
  40124c:	f9401802 	ldr	x2, [x0, #48]
  401250:	eb17005f 	cmp	x2, x23
  401254:	54fff780 	b.eq	401144 <main+0x344>  // b.none
  401258:	aa1303e0 	mov	x0, x19
  40125c:	d63f0040 	blr	x2
  401260:	12001c01 	and	w1, w0, #0xff
  401264:	17ffffb8 	b	401144 <main+0x344>
	this->_M_widen_init();
  401268:	aa1b03e0 	mov	x0, x27
  40126c:	97fffead 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  401270:	f9400360 	ldr	x0, [x27]
  401274:	52800141 	mov	w1, #0xa                   	// #10
  401278:	f9401802 	ldr	x2, [x0, #48]
  40127c:	eb17005f 	cmp	x2, x23
  401280:	54fff320 	b.eq	4010e4 <main+0x2e4>  // b.none
  401284:	aa1b03e0 	mov	x0, x27
  401288:	d63f0040 	blr	x2
  40128c:	12001c01 	and	w1, w0, #0xff
  401290:	17ffff95 	b	4010e4 <main+0x2e4>
	this->_M_widen_init();
  401294:	aa1b03e0 	mov	x0, x27
  401298:	97fffea2 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  40129c:	f9400360 	ldr	x0, [x27]
  4012a0:	52800141 	mov	w1, #0xa                   	// #10
  4012a4:	f9401802 	ldr	x2, [x0, #48]
  4012a8:	eb17005f 	cmp	x2, x23
  4012ac:	54ffeec0 	b.eq	401084 <main+0x284>  // b.none
  4012b0:	aa1b03e0 	mov	x0, x27
  4012b4:	d63f0040 	blr	x2
  4012b8:	12001c01 	and	w1, w0, #0xff
  4012bc:	17ffff72 	b	401084 <main+0x284>
	this->_M_widen_init();
  4012c0:	aa1b03e0 	mov	x0, x27
  4012c4:	97fffe97 	bl	400d20 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
	return this->do_widen(__c);
  4012c8:	f9400360 	ldr	x0, [x27]
  4012cc:	52800141 	mov	w1, #0xa                   	// #10
  4012d0:	f9401802 	ldr	x2, [x0, #48]
  4012d4:	eb17005f 	cmp	x2, x23
  4012d8:	54ffea60 	b.eq	401024 <main+0x224>  // b.none
  4012dc:	aa1b03e0 	mov	x0, x27
  4012e0:	d63f0040 	blr	x2
  4012e4:	12001c01 	and	w1, w0, #0xff
  4012e8:	17ffff4f 	b	401024 <main+0x224>
	__throw_bad_cast();
  4012ec:	97fffe95 	bl	400d40 <_ZSt16__throw_bad_castv@plt>

00000000004012f0 <_GLOBAL__sub_I_m0>:
  4012f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  4012f4:	910003fd 	mov	x29, sp
  4012f8:	a90153f3 	stp	x19, x20, [sp, #16]
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
  4012fc:	f00000f4 	adrp	x20, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  401300:	9102e294 	add	x20, x20, #0xb8
  401304:	f90013f5 	str	x21, [sp, #32]
  401308:	f00000f5 	adrp	x21, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  40130c:	9107c2b3 	add	x19, x21, #0x1f0
  401310:	91002273 	add	x19, x19, #0x8
  401314:	aa1303e0 	mov	x0, x19
  401318:	97fffe92 	bl	400d60 <_ZNSt8ios_base4InitC1Ev@plt>
  40131c:	aa1303e1 	mov	x1, x19
  401320:	aa1403e2 	mov	x2, x20
  401324:	f0ffffe0 	adrp	x0, 400000 <__abi_tag-0x278>
std::random_device rd;
  401328:	90000113 	adrp	x19, 421000 <gen+0xe00>
  40132c:	91378000 	add	x0, x0, #0xde0
  401330:	91162273 	add	x19, x19, #0x588
  401334:	97fffe73 	bl	400d00 <__cxa_atexit@plt>
  401338:	aa1303e0 	mov	x0, x19
  40133c:	940003a5 	bl	4021d0 <_ZNSt13random_deviceC1Ev>
  401340:	aa1403e2 	mov	x2, x20
  401344:	aa1303e1 	mov	x1, x19
  401348:	b0000000 	adrp	x0, 402000 <_Z7m_reseti+0xd0>
  40134c:	9106c000 	add	x0, x0, #0x1b0
  401350:	97fffe6c 	bl	400d00 <__cxa_atexit@plt>
#endif
    }

    result_type
    operator()()
    { return this->_M_getval(); }
  401354:	aa1303e0 	mov	x0, x19
  401358:	97fffe7e 	bl	400d50 <_ZNSt13random_device9_M_getvalEv@plt>
    void
    mersenne_twister_engine<_UIntType, __w, __n, __m, __r, __a, __u, __d,
			    __s, __b, __t, __c, __l, __f>::
    seed(result_type __sd)
    {
      _M_x[0] = __detail::__mod<_UIntType,
  40135c:	f00000e2 	adrp	x2, 420000 <_ZNSo3putEc@GLIBCXX_3.4>

      for (size_t __i = 1; __i < state_size; ++__i)
	{
	  _UIntType __x = _M_x[__i - 1];
	  __x ^= __x >> (__w - 2);
	  __x *= __f;
  401360:	d2912ca5 	mov	x5, #0x8965                	// #35173
  401364:	91080043 	add	x3, x2, #0x200
std::mt19937 gen(rd());
  401368:	2a0003e0 	mov	w0, w0
	  _UIntType __x = _M_x[__i - 1];
  40136c:	f00000e4 	adrp	x4, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
      _M_x[0] = __detail::__mod<_UIntType,
  401370:	f9010040 	str	x0, [x2, #512]
	  _UIntType __x = _M_x[__i - 1];
  401374:	9107e084 	add	x4, x4, #0x1f8
      for (size_t __i = 1; __i < state_size; ++__i)
  401378:	d2800021 	mov	x1, #0x1                   	// #1
  40137c:	d2800102 	mov	x2, #0x8                   	// #8
	  __x *= __f;
  401380:	f2ad80e5 	movk	x5, #0x6c07, lsl #16
  401384:	14000003 	b	401390 <_GLOBAL__sub_I_m0+0xa0>
	  _UIntType __x = _M_x[__i - 1];
  401388:	f8617880 	ldr	x0, [x4, x1, lsl #3]
  40138c:	d37df022 	lsl	x2, x1, #3
	  __x ^= __x >> (__w - 2);
  401390:	ca407800 	eor	x0, x0, x0, lsr #30
	    __res %= __m;
  401394:	1b050400 	madd	w0, w0, w5, w1
      for (size_t __i = 1; __i < state_size; ++__i)
  401398:	91000421 	add	x1, x1, #0x1
	  __x += __detail::__mod<_UIntType, __n>(__i);
	  _M_x[__i] = __detail::__mod<_UIntType,
  40139c:	f8226860 	str	x0, [x3, x2]
      for (size_t __i = 1; __i < state_size; ++__i)
  4013a0:	f109c03f 	cmp	x1, #0x270
  4013a4:	54ffff21 	b.ne	401388 <_GLOBAL__sub_I_m0+0x98>  // b.any
	typedef uniform_real_distribution<_RealType> distribution_type;

	param_type() : param_type(0) { }

	explicit
	param_type(_RealType __a, _RealType __b = _RealType(1))
  4013a8:	d2e7f000 	mov	x0, #0x3f80000000000000    	// #4575657221408423936
  4013ac:	f900faa0 	str	x0, [x21, #496]
}
  4013b0:	a94153f3 	ldp	x19, x20, [sp, #16]
  4013b4:	f94013f5 	ldr	x21, [sp, #32]
	    __detail::_Shift<_UIntType, __w>::__value>(__x);
	}
      _M_p = state_size;
  4013b8:	f909c061 	str	x1, [x3, #4992]
  4013bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
  4013c0:	d65f03c0 	ret
  4013c4:	d503201f 	nop
  4013c8:	d503201f 	nop
  4013cc:	d503201f 	nop
  4013d0:	d503201f 	nop
  4013d4:	d503201f 	nop
  4013d8:	d503201f 	nop
  4013dc:	d503201f 	nop
  4013e0:	d503201f 	nop
  4013e4:	d503201f 	nop
  4013e8:	d503201f 	nop
  4013ec:	d503201f 	nop
  4013f0:	d503201f 	nop
  4013f4:	d503201f 	nop
  4013f8:	d503201f 	nop
  4013fc:	d503201f 	nop

0000000000401400 <_start>:
  401400:	d503201f 	nop
  401404:	d280001d 	mov	x29, #0x0                   	// #0
  401408:	d280001e 	mov	x30, #0x0                   	// #0
  40140c:	aa0003e5 	mov	x5, x0
  401410:	f94003e1 	ldr	x1, [sp]
  401414:	910023e2 	add	x2, sp, #0x8
  401418:	910003e6 	mov	x6, sp
  40141c:	90000000 	adrp	x0, 401000 <main+0x200>
  401420:	9110d000 	add	x0, x0, #0x434
  401424:	d2800003 	mov	x3, #0x0                   	// #0
  401428:	d2800004 	mov	x4, #0x0                   	// #0
  40142c:	97fffe29 	bl	400cd0 <__libc_start_main@plt>
  401430:	97fffe50 	bl	400d70 <abort@plt>

0000000000401434 <__wrap_main>:
  401434:	d503201f 	nop
  401438:	17fffe72 	b	400e00 <main>
  40143c:	d503201f 	nop

0000000000401440 <_dl_relocate_static_pie>:
  401440:	d65f03c0 	ret

0000000000401444 <call_weak_fn>:
  401444:	d00000e0 	adrp	x0, 41f000 <__FRAME_END__+0x1c8a0>
  401448:	f947ec00 	ldr	x0, [x0, #4056]
  40144c:	b4000040 	cbz	x0, 401454 <call_weak_fn+0x10>
  401450:	17fffe60 	b	400dd0 <__gmon_start__@plt>
  401454:	d65f03c0 	ret
  401458:	d503201f 	nop
  40145c:	d503201f 	nop

0000000000401460 <deregister_tm_clones>:
  401460:	f00000e0 	adrp	x0, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  401464:	91032000 	add	x0, x0, #0xc8
  401468:	f00000e1 	adrp	x1, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  40146c:	91032021 	add	x1, x1, #0xc8
  401470:	eb00003f 	cmp	x1, x0
  401474:	540000c0 	b.eq	40148c <deregister_tm_clones+0x2c>  // b.none
  401478:	d00000e1 	adrp	x1, 41f000 <__FRAME_END__+0x1c8a0>
  40147c:	f947e821 	ldr	x1, [x1, #4048]
  401480:	b4000061 	cbz	x1, 40148c <deregister_tm_clones+0x2c>
  401484:	aa0103f0 	mov	x16, x1
  401488:	d61f0200 	br	x16
  40148c:	d65f03c0 	ret

0000000000401490 <register_tm_clones>:
  401490:	f00000e0 	adrp	x0, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  401494:	91032000 	add	x0, x0, #0xc8
  401498:	f00000e1 	adrp	x1, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  40149c:	91032021 	add	x1, x1, #0xc8
  4014a0:	cb000021 	sub	x1, x1, x0
  4014a4:	d37ffc22 	lsr	x2, x1, #63
  4014a8:	8b810c41 	add	x1, x2, x1, asr #3
  4014ac:	9341fc21 	asr	x1, x1, #1
  4014b0:	b40000c1 	cbz	x1, 4014c8 <register_tm_clones+0x38>
  4014b4:	d00000e2 	adrp	x2, 41f000 <__FRAME_END__+0x1c8a0>
  4014b8:	f947f042 	ldr	x2, [x2, #4064]
  4014bc:	b4000062 	cbz	x2, 4014c8 <register_tm_clones+0x38>
  4014c0:	aa0203f0 	mov	x16, x2
  4014c4:	d61f0200 	br	x16
  4014c8:	d65f03c0 	ret
  4014cc:	d503201f 	nop

00000000004014d0 <__do_global_dtors_aux>:
  4014d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4014d4:	910003fd 	mov	x29, sp
  4014d8:	f9000bf3 	str	x19, [sp, #16]
  4014dc:	f00000f3 	adrp	x19, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  4014e0:	39478260 	ldrb	w0, [x19, #480]
  4014e4:	35000080 	cbnz	w0, 4014f4 <__do_global_dtors_aux+0x24>
  4014e8:	97ffffde 	bl	401460 <deregister_tm_clones>
  4014ec:	52800020 	mov	w0, #0x1                   	// #1
  4014f0:	39078260 	strb	w0, [x19, #480]
  4014f4:	f9400bf3 	ldr	x19, [sp, #16]
  4014f8:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4014fc:	d65f03c0 	ret

0000000000401500 <frame_dummy>:
  401500:	17ffffe4 	b	401490 <register_tm_clones>
  401504:	d503201f 	nop
  401508:	d503201f 	nop
  40150c:	d503201f 	nop

0000000000401510 <_Z12gauss_seriali>:
    for (int k = 0; k < N; k++)
  401510:	7100001f 	cmp	w0, #0x0
  401514:	540007cd 	b.le	40160c <_Z12gauss_seriali+0xfc>
  401518:	b0018111 	adrp	x17, 3422000 <m2+0xfff6f0>
  40151c:	51000808 	sub	w8, w0, #0x2
  401520:	91244231 	add	x17, x17, #0x910
  401524:	51000410 	sub	w16, w0, #0x1
  401528:	aa1103e6 	mov	x6, x17
  40152c:	9100122f 	add	x15, x17, #0x4
  401530:	9100222e 	add	x14, x17, #0x8
  401534:	d2810009 	mov	x9, #0x800                 	// #2048
  401538:	d2800005 	mov	x5, #0x0                   	// #0
        m1[k][k] = 1.0;
  40153c:	1e2e1003 	fmov	s3, #1.000000000000000000e+00
  401540:	d284008d 	mov	x13, #0x2004                	// #8196
  401544:	9283ffec 	mov	x12, #0xffffffffffffe000    	// #-8192
  401548:	9287ffeb 	mov	x11, #0xffffffffffffc000    	// #-16384
  40154c:	5284000a 	mov	w10, #0x2000                	// #8192
        for (int j = k + 1; j < N; j++)
  401550:	3100051f 	cmn	w8, #0x1
  401554:	54000540 	b.eq	4015fc <_Z12gauss_seriali+0xec>  // b.none
  401558:	2a0803e0 	mov	w0, w8
  40155c:	d1200122 	sub	x2, x9, #0x800
  401560:	8b000042 	add	x2, x2, x0
  401564:	aa0603e1 	mov	x1, x6
  401568:	8b0209e2 	add	x2, x15, x2, lsl #2
  40156c:	d503201f 	nop
            m1[k][j] = m1[k][j] / m1[k][k];  // 除法（归一化）部分，可并行
  401570:	bd4000c1 	ldr	s1, [x6]
  401574:	bd400420 	ldr	s0, [x1, #4]
  401578:	1e211800 	fdiv	s0, s0, s1
  40157c:	bc004c20 	str	s0, [x1, #4]!
        for (int j = k + 1; j < N; j++)
  401580:	eb02003f 	cmp	x1, x2
  401584:	54ffff61 	b.ne	401570 <_Z12gauss_seriali+0x60>  // b.any
        m1[k][k] = 1.0;
  401588:	cb050167 	sub	x7, x11, x5
  40158c:	8b090000 	add	x0, x0, x9
  401590:	bd0000c3 	str	s3, [x6]
        for (int i = k + 1; i < N; i++)  // 消去部分，可并行
  401594:	8b0d00c6 	add	x6, x6, x13
  401598:	8b0009c4 	add	x4, x14, x0, lsl #2
  40159c:	cb050183 	sub	x3, x12, x5
  4015a0:	9baa9d07 	umsubl	x7, w8, w10, x7
        m1[k][k] = 1.0;
  4015a4:	aa0603e2 	mov	x2, x6
  4015a8:	aa0203e0 	mov	x0, x2
  4015ac:	d503201f 	nop
                m1[i][j] = m1[i][j] - m1[i][k] * m1[k][j];
  4015b0:	8b030001 	add	x1, x0, x3
  4015b4:	bc5fc042 	ldur	s2, [x2, #-4]
  4015b8:	bd400000 	ldr	s0, [x0]
  4015bc:	bc656821 	ldr	s1, [x1, x5]
  4015c0:	1f018040 	fmsub	s0, s2, s1, s0
  4015c4:	bc004400 	str	s0, [x0], #4
            for (int j = k + 1; j < N; j++)
  4015c8:	eb04001f 	cmp	x0, x4
  4015cc:	54ffff21 	b.ne	4015b0 <_Z12gauss_seriali+0xa0>  // b.any
        for (int i = k + 1; i < N; i++)  // 消去部分，可并行
  4015d0:	d1400863 	sub	x3, x3, #0x2, lsl #12
            m1[i][k] = 0;
  4015d4:	b81fc05f 	stur	wzr, [x2, #-4]
        for (int i = k + 1; i < N; i++)  // 消去部分，可并行
  4015d8:	91400804 	add	x4, x0, #0x2, lsl #12
  4015dc:	91400842 	add	x2, x2, #0x2, lsl #12
  4015e0:	eb07007f 	cmp	x3, x7
  4015e4:	54fffe21 	b.ne	4015a8 <_Z12gauss_seriali+0x98>  // b.any
  4015e8:	51000508 	sub	w8, w8, #0x1
  4015ec:	914008a5 	add	x5, x5, #0x2, lsl #12
  4015f0:	91200529 	add	x9, x9, #0x801
        for (int j = k + 1; j < N; j++)
  4015f4:	3100051f 	cmn	w8, #0x1
  4015f8:	54fffb01 	b.ne	401558 <_Z12gauss_seriali+0x48>  // b.any
        m1[k][k] = 1.0;
  4015fc:	93757e00 	sbfiz	x0, x16, #11, #32
  401600:	1e2e1000 	fmov	s0, #1.000000000000000000e+00
  401604:	8b30c000 	add	x0, x0, w16, sxtw
  401608:	bc207a20 	str	s0, [x17, x0, lsl #2]
}
  40160c:	d65f03c0 	ret

0000000000401610 <_Z10gauss_simdi>:
    for (int k = 0; k < N; k++)
  401610:	7100001f 	cmp	w0, #0x0
  401614:	5400108d 	b.le	401824 <_Z10gauss_simdi+0x214>
  401618:	b001010a 	adrp	x10, 2422000 <m3+0xfff6f0>
  40161c:	9124514a 	add	x10, x10, #0x914
{
  401620:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  401624:	b001010c 	adrp	x12, 2422000 <m3+0xfff6f0>
  401628:	2a0003e6 	mov	w6, w0
  40162c:	910003fd 	mov	x29, sp
        float32x4_t vt = vdupq_n_f32(m2[k][k]);  // 加载4个m2[k][k]到向量寄存器
  401630:	bc5fc141 	ldur	s1, [x10, #-4]
  401634:	9124418c 	add	x12, x12, #0x910
{
  401638:	a90153f3 	stp	x19, x20, [sp, #16]
    for (int k = 0; k < N; k++)
  40163c:	d280000d 	mov	x13, #0x0                   	// #0
  401640:	9100519e 	add	x30, x12, #0x14
{
  401644:	a9025bf5 	stp	x21, x22, [sp, #32]
  401648:	5100140e 	sub	w14, w0, #0x5
  40164c:	51000413 	sub	w19, w0, #0x1
  401650:	f9001bf7 	str	x23, [sp, #48]
  401654:	110005b2 	add	w18, w13, #0x1

__extension__ extern __inline float32x4_t
__attribute__ ((__always_inline__, __gnu_inline__, __artificial__))
vdupq_n_f32 (float32_t __a)
{
  return (float32x4_t) {__a, __a, __a, __a};
  401658:	4e040421 	dup	v1.4s, v1.s[0]
    for (int k = 0; k < N; k++)
  40165c:	d2800011 	mov	x17, #0x0                   	// #0
  401660:	d2810010 	mov	x16, #0x800                 	// #2048
  401664:	d2800009 	mov	x9, #0x0                   	// #0
  401668:	528000af 	mov	w15, #0x5                   	// #5
  40166c:	5280008b 	mov	w11, #0x4                   	// #4
        m2[k][k] = 1.0;
  401670:	1e2e1003 	fmov	s3, #1.000000000000000000e+00
  401674:	9283fff5 	mov	x21, #0xffffffffffffe000    	// #-8192
  401678:	d2840094 	mov	x20, #0x2004                	// #8196
        for (; j0 + 4 <= N; j0 += 4)  // 处理每4个数，不处理余数
  40167c:	6b0b00df 	cmp	w6, w11
  401680:	54000c0d 	b.le	401800 <_Z10gauss_simdi+0x1f0>
  401684:	d503201f 	nop
  401688:	53027dc1 	lsr	w1, w14, #2
  40168c:	aa0a03e0 	mov	x0, x10
  401690:	8b214a22 	add	x2, x17, w1, uxtw #2
  401694:	8b020bc2 	add	x2, x30, x2, lsl #2

__extension__ extern __inline float32x4_t
__attribute__ ((__always_inline__, __gnu_inline__, __artificial__))
vld1q_f32 (const float32_t *__a)
{
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401698:	3dc00000 	ldr	q0, [x0]
  return __a / __b;
  40169c:	6e21fc00 	fdiv	v0.4s, v0.4s, v1.4s

__extension__ extern __inline void
__attribute__ ((__always_inline__, __gnu_inline__, __artificial__))
vst1q_f32 (float32_t *__a, float32x4_t __b)
{
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  4016a0:	3c810400 	str	q0, [x0], #16
  4016a4:	eb02001f 	cmp	x0, x2
  4016a8:	54ffff81 	b.ne	401698 <_Z10gauss_simdi+0x88>  // b.any
  4016ac:	0b0109e0 	add	w0, w15, w1, lsl #2
        for (int j = j0; j < N; j++)
  4016b0:	6b0000df 	cmp	w6, w0
  4016b4:	5400014d 	b.le	4016dc <_Z10gauss_simdi+0xcc>
  4016b8:	93407c00 	sxtw	x0, w0
  4016bc:	8b0d3581 	add	x1, x12, x13, lsl #13
            m2[k][j] = m2[k][j] / m2[k][k];  // 按串行方式处理余数
  4016c0:	bc5fc141 	ldur	s1, [x10, #-4]
  4016c4:	bc607820 	ldr	s0, [x1, x0, lsl #2]
  4016c8:	1e211800 	fdiv	s0, s0, s1
  4016cc:	bc207820 	str	s0, [x1, x0, lsl #2]
        for (int j = j0; j < N; j++)
  4016d0:	91000400 	add	x0, x0, #0x1
  4016d4:	6b0000df 	cmp	w6, w0
  4016d8:	54ffff4c 	b.gt	4016c0 <_Z10gauss_simdi+0xb0>
        m2[k][k] = 1.0;
  4016dc:	bc1fc143 	stur	s3, [x10, #-4]
        for (int i = k + 1; i < N; i++)
  4016e0:	eb1301bf 	cmp	x13, x19
  4016e4:	54000960 	b.eq	401810 <_Z10gauss_simdi+0x200>  // b.none
  4016e8:	53027dd6 	lsr	w22, w14, #2
  4016ec:	910009b7 	add	x23, x13, #0x2
  4016f0:	11000dc0 	add	w0, w14, #0x3
  4016f4:	cb0d2e01 	sub	x1, x16, x13, lsl #11
  4016f8:	8b364a23 	add	x3, x17, w22, uxtw #2
  4016fc:	8b0002f7 	add	x23, x23, x0
            for (; j1 + 4 <= N; j1 += 4)  // 处理每4个数，不处理余数
  401700:	0b1609f6 	add	w22, w15, w22, lsl #2
  401704:	d37ef421 	lsl	x1, x1, #2
  401708:	8b030bc3 	add	x3, x30, x3, lsl #2
  40170c:	d375d2f7 	lsl	x23, x23, #11
  401710:	d1001144 	sub	x4, x10, #0x4
  401714:	cb0902a7 	sub	x7, x21, x9
  401718:	aa1003e8 	mov	x8, x16
  40171c:	d503201f 	nop
            float32x4_t vaik = vdupq_n_f32(m2[i][k]);  // 加载4个m2[i][k]到向量寄存器
  401720:	bd600081 	ldr	s1, [x4, #8192]
  return (float32x4_t) {__a, __a, __a, __a};
  401724:	4e040422 	dup	v2.4s, v1.s[0]
            for (; j1 + 4 <= N; j1 += 4)  // 处理每4个数，不处理余数
  401728:	6b0b00df 	cmp	w6, w11
  40172c:	540006ed 	b.le	401808 <_Z10gauss_simdi+0x1f8>
  401730:	aa0a03e0 	mov	x0, x10
  401734:	d503201f 	nop
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401738:	3ce16800 	ldr	q0, [x0, x1]
  40173c:	3dc00001 	ldr	q1, [x0]
  return __a - __b;
  401740:	4ea1cc40 	fmls	v0.4s, v2.4s, v1.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  401744:	3ca16800 	str	q0, [x0, x1]
  401748:	91004000 	add	x0, x0, #0x10
  40174c:	eb03001f 	cmp	x0, x3
  401750:	54ffff41 	b.ne	401738 <_Z10gauss_simdi+0x128>  // b.any
            for (int j = j1; j < N; j++)
  401754:	6b1600df 	cmp	w6, w22
  401758:	540002cd 	b.le	4017b0 <_Z10gauss_simdi+0x1a0>
                m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];  // 按串行方式处理余数
  40175c:	2a1603e2 	mov	w2, w22
  401760:	bd600081 	ldr	s1, [x4, #8192]
  401764:	8b22c100 	add	x0, x8, w2, sxtw
            for (int j = j1; j < N; j++)
  401768:	11000442 	add	w2, w2, #0x1
  40176c:	8b000980 	add	x0, x12, x0, lsl #2
                m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];  // 按串行方式处理余数
  401770:	8b070005 	add	x5, x0, x7
  401774:	bd400000 	ldr	s0, [x0]
  401778:	bc6968a2 	ldr	s2, [x5, x9]
  40177c:	1f018040 	fmsub	s0, s2, s1, s0
  401780:	bc004400 	str	s0, [x0], #4
            for (int j = j1; j < N; j++)
  401784:	6b0200df 	cmp	w6, w2
  401788:	5400014d 	b.le	4017b0 <_Z10gauss_simdi+0x1a0>
                m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];  // 按串行方式处理余数
  40178c:	8b070005 	add	x5, x0, x7
  401790:	bd600081 	ldr	s1, [x4, #8192]
  401794:	bd400000 	ldr	s0, [x0]
            for (int j = j1; j < N; j++)
  401798:	11000442 	add	w2, w2, #0x1
                m2[i][j] = m2[i][j] - m2[i][k] * m2[k][j];  // 按串行方式处理余数
  40179c:	bc6968a2 	ldr	s2, [x5, x9]
  4017a0:	1f018040 	fmsub	s0, s2, s1, s0
  4017a4:	bc004400 	str	s0, [x0], #4
            for (int j = j1; j < N; j++)
  4017a8:	6b0200df 	cmp	w6, w2
  4017ac:	54ffff0c 	b.gt	40178c <_Z10gauss_simdi+0x17c>
        for (int i = k + 1; i < N; i++)
  4017b0:	91200108 	add	x8, x8, #0x800
            m2[i][k] = 0;
  4017b4:	b920009f 	str	wzr, [x4, #8192]
        for (int i = k + 1; i < N; i++)
  4017b8:	d14008e7 	sub	x7, x7, #0x2, lsl #12
  4017bc:	91400884 	add	x4, x4, #0x2, lsl #12
  4017c0:	91400821 	add	x1, x1, #0x2, lsl #12
  4017c4:	eb17011f 	cmp	x8, x23
  4017c8:	54fffac1 	b.ne	401720 <_Z10gauss_simdi+0x110>  // b.any
  4017cc:	8b14014a 	add	x10, x10, x20
  4017d0:	910005ad 	add	x13, x13, #0x1
  4017d4:	1100056b 	add	w11, w11, #0x1
  4017d8:	510005ce 	sub	w14, w14, #0x1
  4017dc:	110005ef 	add	w15, w15, #0x1
  4017e0:	91400929 	add	x9, x9, #0x2, lsl #12
        float32x4_t vt = vdupq_n_f32(m2[k][k]);  // 加载4个m2[k][k]到向量寄存器
  4017e4:	bc5fc141 	ldur	s1, [x10, #-4]
  4017e8:	91200210 	add	x16, x16, #0x800
  4017ec:	91200631 	add	x17, x17, #0x801
  return (float32x4_t) {__a, __a, __a, __a};
  4017f0:	110005b2 	add	w18, w13, #0x1
  4017f4:	4e040421 	dup	v1.4s, v1.s[0]
        for (; j0 + 4 <= N; j0 += 4)  // 处理每4个数，不处理余数
  4017f8:	6b0b00df 	cmp	w6, w11
  4017fc:	54fff46c 	b.gt	401688 <_Z10gauss_simdi+0x78>
        int j0 = k + 1;
  401800:	2a1203e0 	mov	w0, w18
  401804:	17ffffab 	b	4016b0 <_Z10gauss_simdi+0xa0>
            int j1 = k + 1;
  401808:	2a1203e2 	mov	w2, w18
  40180c:	17ffffd6 	b	401764 <_Z10gauss_simdi+0x154>
}
  401810:	a94153f3 	ldp	x19, x20, [sp, #16]
  401814:	a9425bf5 	ldp	x21, x22, [sp, #32]
  401818:	f9401bf7 	ldr	x23, [sp, #48]
  40181c:	a8c47bfd 	ldp	x29, x30, [sp], #64
  401820:	d65f03c0 	ret
  401824:	d65f03c0 	ret
  401828:	d503201f 	nop
  40182c:	d503201f 	nop

0000000000401830 <_Z16gauss_simd_cachei>:
    for (int k = 0; k < N; k++)
  401830:	7100001f 	cmp	w0, #0x0
  401834:	5400192d 	b.le	401b58 <_Z16gauss_simd_cachei+0x328>
{
  401838:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
  40183c:	b000810f 	adrp	x15, 1422000 <m4+0xfff6f0>
  401840:	912441ef 	add	x15, x15, #0x910
  401844:	910003fd 	mov	x29, sp
  401848:	b000810d 	adrp	x13, 1422000 <m4+0xfff6f0>
    for (int k = 0; k < N; k++)
  40184c:	aa0f03e6 	mov	x6, x15
  401850:	912451ad 	add	x13, x13, #0x914
{
  401854:	a9046bf9 	stp	x25, x26, [sp, #64]
  401858:	910051fa 	add	x26, x15, #0x14
  40185c:	2a0003e5 	mov	w5, w0
    for (int k = 0; k < N; k++)
  401860:	52800419 	mov	w25, #0x20                  	// #32
  401864:	d2800011 	mov	x17, #0x0                   	// #0
  401868:	d2800008 	mov	x8, #0x0                   	// #0
  40186c:	5280008e 	mov	w14, #0x4                   	// #4
        m3[k][k] = 1.0;
  401870:	1e2e1003 	fmov	s3, #1.000000000000000000e+00
{
  401874:	a90153f3 	stp	x19, x20, [sp, #16]
  401878:	51001414 	sub	w20, w0, #0x5
  40187c:	51000400 	sub	w0, w0, #0x1
  401880:	a9025bf5 	stp	x21, x22, [sp, #32]
    for (int k = 0; k < N; k++)
  401884:	528000b6 	mov	w22, #0x5                   	// #5
  401888:	d2800015 	mov	x21, #0x0                   	// #0
{
  40188c:	a90363f7 	stp	x23, x24, [sp, #48]
    for (int k = 0; k < N; k++)
  401890:	d2800018 	mov	x24, #0x0                   	// #0
{
  401894:	a90573fb 	stp	x27, x28, [sp, #80]
  401898:	b9006fe0 	str	w0, [sp, #108]
  40189c:	4d40c8c1 	ld1r	{v1.4s}, [x6]
        int j0 = k + 1;
  4018a0:	51000dd3 	sub	w19, w14, #0x3
        for (; j0 + 4 <= N; j0 += 4)
  4018a4:	6b0e00bf 	cmp	w5, w14
  4018a8:	5400154d 	b.le	401b50 <_Z16gauss_simd_cachei+0x320>
  4018ac:	53027e80 	lsr	w0, w20, #2
  4018b0:	aa0d03e1 	mov	x1, x13
  4018b4:	8b204b02 	add	x2, x24, w0, uxtw #2
  4018b8:	8b020b42 	add	x2, x26, x2, lsl #2
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  4018bc:	3dc00020 	ldr	q0, [x1]
  return __a / __b;
  4018c0:	6e21fc00 	fdiv	v0.4s, v0.4s, v1.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  4018c4:	3c810420 	str	q0, [x1], #16
  4018c8:	eb02003f 	cmp	x1, x2
  4018cc:	54ffff81 	b.ne	4018bc <_Z16gauss_simd_cachei+0x8c>  // b.any
  4018d0:	0b000ac0 	add	w0, w22, w0, lsl #2
        for (int j = j0; j < N; j++)
  4018d4:	6b0000bf 	cmp	w5, w0
  4018d8:	5400014d 	b.le	401900 <_Z16gauss_simd_cachei+0xd0>
  4018dc:	93407c00 	sxtw	x0, w0
  4018e0:	8b1535e1 	add	x1, x15, x21, lsl #13
            m3[k][j] = m3[k][j] / m3[k][k];
  4018e4:	bc607820 	ldr	s0, [x1, x0, lsl #2]
  4018e8:	bd4000c1 	ldr	s1, [x6]
  4018ec:	1e211800 	fdiv	s0, s0, s1
  4018f0:	bc207820 	str	s0, [x1, x0, lsl #2]
        for (int j = j0; j < N; j++)
  4018f4:	91000400 	add	x0, x0, #0x1
  4018f8:	6b0000bf 	cmp	w5, w0
  4018fc:	54ffff4c 	b.gt	4018e4 <_Z16gauss_simd_cachei+0xb4>
        m3[k][k] = 1.0;
  401900:	bd0000c3 	str	s3, [x6]
        for (; ii + tile <= N; ii += tile)
  401904:	2a1903ea 	mov	w10, w25
  401908:	6b1900bf 	cmp	w5, w25
  40190c:	540011cd 	b.le	401b44 <_Z16gauss_simd_cachei+0x314>
  401910:	53027e80 	lsr	w0, w20, #2
  401914:	6b0e00bf 	cmp	w5, w14
  401918:	91200237 	add	x23, x17, #0x800
  40191c:	9283ffe1 	mov	x1, #0xffffffffffffe000    	// #-8192
                for (; j1 + 4 <= N; j1 += 4)
  401920:	0b000ac9 	add	w9, w22, w0, lsl #2
  401924:	8b204b00 	add	x0, x24, w0, uxtw #2
  401928:	1a93c129 	csel	w9, w9, w19, gt
  40192c:	cb080030 	sub	x16, x1, x8
  401930:	aa1703f2 	mov	x18, x23
  401934:	8b000b42 	add	x2, x26, x0, lsl #2
  401938:	cb1537fb 	neg	x27, x21, lsl #13
  40193c:	93407d2b 	sxtw	x11, w9
        int ii = k + 1;
  401940:	2a1303ec 	mov	w12, w19
            for (int i = ii; i < ii + tile; i++)
  401944:	6b0c015f 	cmp	w10, w12
  401948:	5400050b 	b.lt	4019e8 <_Z16gauss_simd_cachei+0x1b8>  // b.tstop
  40194c:	cb100361 	sub	x1, x27, x16
  401950:	aa1203e7 	mov	x7, x18
  401954:	aa1003e3 	mov	x3, x16
  401958:	2a0c03e4 	mov	w4, w12
  40195c:	d503201f 	nop
                float32x4_t vaik = vdupq_n_f32(m3[i][k]);
  401960:	bc6168c2 	ldr	s2, [x6, x1]
                for (; j1 + 4 <= N; j1 += 4)
  401964:	aa0d03e0 	mov	x0, x13
  return (float32x4_t) {__a, __a, __a, __a};
  401968:	4e040442 	dup	v2.4s, v2.s[0]
  40196c:	6b0e00bf 	cmp	w5, w14
  401970:	5400012d 	b.le	401994 <_Z16gauss_simd_cachei+0x164>
  401974:	d503201f 	nop
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401978:	3ce16800 	ldr	q0, [x0, x1]
  40197c:	3dc00001 	ldr	q1, [x0]
  return __a - __b;
  401980:	4ea2cc20 	fmls	v0.4s, v1.4s, v2.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  401984:	3ca16800 	str	q0, [x0, x1]
  401988:	91004000 	add	x0, x0, #0x10
  40198c:	eb02001f 	cmp	x0, x2
  401990:	54ffff41 	b.ne	401978 <_Z16gauss_simd_cachei+0x148>  // b.any
                for (int j = j1; j < N; j++)
  401994:	6b0900bf 	cmp	w5, w9
  401998:	540001ad 	b.le	4019cc <_Z16gauss_simd_cachei+0x19c>
  40199c:	8b070160 	add	x0, x11, x7
  4019a0:	2a0903fc 	mov	w28, w9
  4019a4:	8b0009e0 	add	x0, x15, x0, lsl #2
                    m3[i][j] = m3[i][j] - m3[i][k] * m3[k][j];
  4019a8:	8b03001e 	add	x30, x0, x3
  4019ac:	bc6168c2 	ldr	s2, [x6, x1]
  4019b0:	bd400000 	ldr	s0, [x0]
                for (int j = j1; j < N; j++)
  4019b4:	1100079c 	add	w28, w28, #0x1
                    m3[i][j] = m3[i][j] - m3[i][k] * m3[k][j];
  4019b8:	bc686bc1 	ldr	s1, [x30, x8]
  4019bc:	1f018040 	fmsub	s0, s2, s1, s0
  4019c0:	bc004400 	str	s0, [x0], #4
                for (int j = j1; j < N; j++)
  4019c4:	6b1c00bf 	cmp	w5, w28
  4019c8:	54ffff01 	b.ne	4019a8 <_Z16gauss_simd_cachei+0x178>  // b.any
            for (int i = ii; i < ii + tile; i++)
  4019cc:	11000484 	add	w4, w4, #0x1
                m3[i][k] = 0;
  4019d0:	b82168df 	str	wzr, [x6, x1]
            for (int i = ii; i < ii + tile; i++)
  4019d4:	d1400863 	sub	x3, x3, #0x2, lsl #12
  4019d8:	912000e7 	add	x7, x7, #0x800
  4019dc:	91400821 	add	x1, x1, #0x2, lsl #12
  4019e0:	6b0a009f 	cmp	w4, w10
  4019e4:	54fffbed 	b.le	401960 <_Z16gauss_simd_cachei+0x130>
        for (; ii + tile <= N; ii += tile)
  4019e8:	1100814a 	add	w10, w10, #0x20
  4019ec:	1100818c 	add	w12, w12, #0x20
  4019f0:	d1410210 	sub	x16, x16, #0x40, lsl #12
  4019f4:	91404252 	add	x18, x18, #0x10, lsl #12
  4019f8:	6b0a00bf 	cmp	w5, w10
  4019fc:	54fffa4c 	b.gt	401944 <_Z16gauss_simd_cachei+0x114>
  401a00:	51007284 	sub	w4, w20, #0x1c
  401a04:	110075c0 	add	w0, w14, #0x1d
  401a08:	121b6884 	and	w4, w4, #0xffffffe0
  401a0c:	0b000084 	add	w4, w4, w0
        for (int i = ii; i < N; i++)  // 处理分块产生的余数
  401a10:	6b0400bf 	cmp	w5, w4
  401a14:	540006ed 	b.le	401af0 <_Z16gauss_simd_cachei+0x2c0>
  401a18:	53027e80 	lsr	w0, w20, #2
  401a1c:	b9406fe3 	ldr	w3, [sp, #108]
  401a20:	93407c89 	sxtw	x9, w4
            for (; j1 + 4 <= N; j1 += 4)
  401a24:	4b1400ab 	sub	w11, w5, w20
  401a28:	510006cc 	sub	w12, w22, #0x1
  401a2c:	91000522 	add	x2, x9, #0x1
  401a30:	0b00096b 	add	w11, w11, w0, lsl #2
  401a34:	8b152ea1 	add	x1, x21, x21, lsl #11
  401a38:	4b040070 	sub	w16, w3, w4
  401a3c:	6b0c00bf 	cmp	w5, w12
  401a40:	93757c84 	sbfiz	x4, x4, #11, #32
  401a44:	8b204820 	add	x0, x1, w0, uxtw #2
  401a48:	8b020210 	add	x16, x16, x2
  401a4c:	cb110081 	sub	x1, x4, x17
  401a50:	1a93c16b 	csel	w11, w11, w19, gt
  401a54:	8b150087 	add	x7, x4, x21
  401a58:	cb0937e9 	neg	x9, x9, lsl #13
  401a5c:	8b000b42 	add	x2, x26, x0, lsl #2
  401a60:	93407d71 	sxtw	x17, w11
  401a64:	d375d210 	lsl	x16, x16, #11
  401a68:	d37ef421 	lsl	x1, x1, #2
  401a6c:	8b0709e7 	add	x7, x15, x7, lsl #2
  return (float32x4_t) {__a, __a, __a, __a};
  401a70:	4d40c8e2 	ld1r	{v2.4s}, [x7]
  401a74:	aa0d03e0 	mov	x0, x13
  401a78:	6b0c00bf 	cmp	w5, w12
  401a7c:	5400010d 	b.le	401a9c <_Z16gauss_simd_cachei+0x26c>
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401a80:	3ce16800 	ldr	q0, [x0, x1]
  401a84:	3dc00001 	ldr	q1, [x0]
  return __a - __b;
  401a88:	4ea1cc40 	fmls	v0.4s, v2.4s, v1.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  401a8c:	3ca16800 	str	q0, [x0, x1]
  401a90:	91004000 	add	x0, x0, #0x10
  401a94:	eb02001f 	cmp	x0, x2
  401a98:	54ffff41 	b.ne	401a80 <_Z16gauss_simd_cachei+0x250>  // b.any
            for (int j = j1; j < N; j++)
  401a9c:	6b0b00bf 	cmp	w5, w11
  401aa0:	540001ad 	b.le	401ad4 <_Z16gauss_simd_cachei+0x2a4>
  401aa4:	8b040220 	add	x0, x17, x4
  401aa8:	2a0b03e3 	mov	w3, w11
  401aac:	8b0009e0 	add	x0, x15, x0, lsl #2
                m3[i][j] = m3[i][j] - m3[i][k] * m3[k][j];
  401ab0:	8b09000a 	add	x10, x0, x9
  401ab4:	bd4000e2 	ldr	s2, [x7]
  401ab8:	bd400000 	ldr	s0, [x0]
            for (int j = j1; j < N; j++)
  401abc:	11000463 	add	w3, w3, #0x1
                m3[i][j] = m3[i][j] - m3[i][k] * m3[k][j];
  401ac0:	bc686941 	ldr	s1, [x10, x8]
  401ac4:	1f018040 	fmsub	s0, s2, s1, s0
  401ac8:	bc004400 	str	s0, [x0], #4
            for (int j = j1; j < N; j++)
  401acc:	6b0300bf 	cmp	w5, w3
  401ad0:	54ffff01 	b.ne	401ab0 <_Z16gauss_simd_cachei+0x280>  // b.any
        for (int i = ii; i < N; i++)  // 处理分块产生的余数
  401ad4:	91200084 	add	x4, x4, #0x800
            m3[i][k] = 0;
  401ad8:	b90000ff 	str	wzr, [x7]
        for (int i = ii; i < N; i++)  // 处理分块产生的余数
  401adc:	d1400929 	sub	x9, x9, #0x2, lsl #12
  401ae0:	914008e7 	add	x7, x7, #0x2, lsl #12
  401ae4:	91400821 	add	x1, x1, #0x2, lsl #12
  401ae8:	eb10009f 	cmp	x4, x16
  401aec:	54fffc21 	b.ne	401a70 <_Z16gauss_simd_cachei+0x240>  // b.any
    for (int k = 0; k < N; k++)
  401af0:	51000694 	sub	w20, w20, #0x1
  401af4:	d2840080 	mov	x0, #0x2004                	// #8196
  401af8:	d2840081 	mov	x1, #0x2004                	// #8196
  401afc:	910006b5 	add	x21, x21, #0x1
  401b00:	8b0000c6 	add	x6, x6, x0
  401b04:	110005ce 	add	w14, w14, #0x1
  401b08:	91400908 	add	x8, x8, #0x2, lsl #12
  401b0c:	110006d6 	add	w22, w22, #0x1
  401b10:	8b0101ad 	add	x13, x13, x1
  401b14:	aa1703f1 	mov	x17, x23
  401b18:	91200718 	add	x24, x24, #0x801
  401b1c:	11000739 	add	w25, w25, #0x1
  401b20:	3100169f 	cmn	w20, #0x5
  401b24:	54ffebc1 	b.ne	40189c <_Z16gauss_simd_cachei+0x6c>  // b.any
}
  401b28:	a94153f3 	ldp	x19, x20, [sp, #16]
  401b2c:	a9425bf5 	ldp	x21, x22, [sp, #32]
  401b30:	a94363f7 	ldp	x23, x24, [sp, #48]
  401b34:	a9446bf9 	ldp	x25, x26, [sp, #64]
  401b38:	a94573fb 	ldp	x27, x28, [sp, #80]
  401b3c:	a8c77bfd 	ldp	x29, x30, [sp], #112
  401b40:	d65f03c0 	ret
        int ii = k + 1;
  401b44:	2a1303e4 	mov	w4, w19
  401b48:	91200237 	add	x23, x17, #0x800
  401b4c:	17ffffb1 	b	401a10 <_Z16gauss_simd_cachei+0x1e0>
        int j0 = k + 1;
  401b50:	2a1303e0 	mov	w0, w19
  401b54:	17ffff60 	b	4018d4 <_Z16gauss_simd_cachei+0xa4>
  401b58:	d65f03c0 	ret
  401b5c:	d503201f 	nop

0000000000401b60 <_Z16gauss_simd_aligni>:
    for (int k = 0; k < N; k++)
  401b60:	7100001f 	cmp	w0, #0x0
  401b64:	5400162d 	b.le	401e28 <_Z16gauss_simd_aligni+0x2c8>
{
  401b68:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  401b6c:	b000010b 	adrp	x11, 422000 <rd+0xa78>
  401b70:	9124416b 	add	x11, x11, #0x910
  401b74:	910003fd 	mov	x29, sp
  401b78:	b000010a 	adrp	x10, 422000 <rd+0xa78>
  401b7c:	2a0003e4 	mov	w4, w0
    for (int k = 0; k < N; k++)
  401b80:	aa0b03ec 	mov	x12, x11
  401b84:	51001011 	sub	w17, w0, #0x4
  401b88:	9124314a 	add	x10, x10, #0x90c
{
  401b8c:	a9025bf5 	stp	x21, x22, [sp, #32]
  401b90:	51000416 	sub	w22, w0, #0x1
  401b94:	f9001bf7 	str	x23, [sp, #48]
  401b98:	91004177 	add	x23, x11, #0x10
    for (int k = 0; k < N; k++)
  401b9c:	d2800008 	mov	x8, #0x0                   	// #0
  401ba0:	d2800012 	mov	x18, #0x0                   	// #0
  401ba4:	5280001e 	mov	w30, #0x0                   	// #0
        m4[k][k] = 1.0;
  401ba8:	1e2e1004 	fmov	s4, #1.000000000000000000e+00
  401bac:	9283fff5 	mov	x21, #0xffffffffffffe000    	// #-8192
{
  401bb0:	a90153f3 	stp	x19, x20, [sp, #16]
    for (int k = 0; k < N; k++)
  401bb4:	d2810013 	mov	x19, #0x800                 	// #2048
  401bb8:	d2840094 	mov	x20, #0x2004                	// #8196
  401bbc:	d503201f 	nop
        int j0 = k + 1;  // 由于k不一定是4的倍数，将其手动对其到4的倍数
  401bc0:	110007ce 	add	w14, w30, #0x1
        float32x4_t vt = vdupq_n_f32(m4[k][k]);
  401bc4:	bd400181 	ldr	s1, [x12]
        for (; j0 % 4 != 0 && j0 < N; j0++)
  401bc8:	f24005df 	tst	x14, #0x3
  return (float32x4_t) {__a, __a, __a, __a};
  401bcc:	4e040422 	dup	v2.4s, v1.s[0]
  401bd0:	1a9f17ef 	cset	w15, eq  // eq = none
  401bd4:	6b0e009f 	cmp	w4, w14
  401bd8:	1a9fc7e0 	cset	w0, le
  401bdc:	2a0001ef 	orr	w15, w15, w0
  401be0:	3500120f 	cbnz	w15, 401e20 <_Z16gauss_simd_aligni+0x2c0>
  401be4:	91000a40 	add	x0, x18, #0x2
  401be8:	14000002 	b	401bf0 <_Z16gauss_simd_aligni+0x90>
            m4[k][j0] = m4[k][j0] / m4[k][k];
  401bec:	bd400181 	ldr	s1, [x12]
  401bf0:	bc607940 	ldr	s0, [x10, x0, lsl #2]
        for (; j0 % 4 != 0 && j0 < N; j0++)
  401bf4:	f240041f 	tst	x0, #0x3
  401bf8:	1a9f17e1 	cset	w1, eq  // eq = none
  401bfc:	6b00009f 	cmp	w4, w0
  401c00:	1a9fc7e3 	cset	w3, le
  401c04:	2a0003e2 	mov	w2, w0
            m4[k][j0] = m4[k][j0] / m4[k][k];
  401c08:	1e211800 	fdiv	s0, s0, s1
  401c0c:	2a030021 	orr	w1, w1, w3
  401c10:	bc207940 	str	s0, [x10, x0, lsl #2]
        for (; j0 % 4 != 0 && j0 < N; j0++)
  401c14:	91000400 	add	x0, x0, #0x1
  401c18:	34fffea1 	cbz	w1, 401bec <_Z16gauss_simd_aligni+0x8c>
        for (; j0 + 4 <= N; j0 += 4)
  401c1c:	11000c40 	add	w0, w2, #0x3
  401c20:	6b00009f 	cmp	w4, w0
  401c24:	5400020d 	b.le	401c64 <_Z16gauss_simd_aligni+0x104>
  401c28:	4b020223 	sub	w3, w17, w2
  401c2c:	93407c41 	sxtw	x1, w2
  401c30:	8b122c21 	add	x1, x1, x18, lsl #11
  401c34:	53027c63 	lsr	w3, w3, #2
  401c38:	8b010960 	add	x0, x11, x1, lsl #2
  401c3c:	8b234821 	add	x1, x1, w3, uxtw #2
  401c40:	8b010ae1 	add	x1, x23, x1, lsl #2
  401c44:	d503201f 	nop
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401c48:	3dc00000 	ldr	q0, [x0]
  return __a / __b;
  401c4c:	6e22fc00 	fdiv	v0.4s, v0.4s, v2.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  401c50:	3c810400 	str	q0, [x0], #16
  401c54:	eb01001f 	cmp	x0, x1
  401c58:	54ffff81 	b.ne	401c48 <_Z16gauss_simd_aligni+0xe8>  // b.any
  401c5c:	11001040 	add	w0, w2, #0x4
  401c60:	0b030802 	add	w2, w0, w3, lsl #2
        for (int j = j0; j < N; j++)
  401c64:	6b02009f 	cmp	w4, w2
  401c68:	5400014d 	b.le	401c90 <_Z16gauss_simd_aligni+0x130>
  401c6c:	93407c40 	sxtw	x0, w2
  401c70:	8b123561 	add	x1, x11, x18, lsl #13
            m4[k][j] = m4[k][j] / m4[k][k];
  401c74:	bc607820 	ldr	s0, [x1, x0, lsl #2]
  401c78:	bd400181 	ldr	s1, [x12]
  401c7c:	1e211800 	fdiv	s0, s0, s1
  401c80:	bc207820 	str	s0, [x1, x0, lsl #2]
        for (int j = j0; j < N; j++)
  401c84:	91000400 	add	x0, x0, #0x1
  401c88:	6b00009f 	cmp	w4, w0
  401c8c:	54ffff4c 	b.gt	401c74 <_Z16gauss_simd_aligni+0x114>
        m4[k][k] = 1.0;
  401c90:	bd000184 	str	s4, [x12]
        for (int i = k + 1; i < N; i++)
  401c94:	6b0e009f 	cmp	w4, w14
  401c98:	54000ba0 	b.eq	401e0c <_Z16gauss_simd_aligni+0x2ac>  // b.none
  401c9c:	d375d250 	lsl	x16, x18, #11
  401ca0:	4b0e02cd 	sub	w13, w22, w14
  401ca4:	91000a40 	add	x0, x18, #0x2
  401ca8:	cb100265 	sub	x5, x19, x16
  401cac:	8b0001ad 	add	x13, x13, x0
  401cb0:	8b14018c 	add	x12, x12, x20
            for (; j1 + 4 <= N; j1 += 4)
  401cb4:	110013de 	add	w30, w30, #0x4
  401cb8:	d37ef4a5 	lsl	x5, x5, #2
  401cbc:	d375d1ad 	lsl	x13, x13, #11
        for (int i = k + 1; i < N; i++)
  401cc0:	aa0c03e6 	mov	x6, x12
  401cc4:	cb0802a7 	sub	x7, x21, x8
  401cc8:	aa1303e9 	mov	x9, x19
  401ccc:	d503201f 	nop
            float32x4_t vaik = vdupq_n_f32(m4[i][k]);
  401cd0:	bc5fc0c1 	ldur	s1, [x6, #-4]
  return (float32x4_t) {__a, __a, __a, __a};
  401cd4:	4e040423 	dup	v3.4s, v1.s[0]
            for (; j1 % 4 != 0 && j1 < N; j1++)
  401cd8:	3500092f 	cbnz	w15, 401dfc <_Z16gauss_simd_aligni+0x29c>
  401cdc:	aa0603e1 	mov	x1, x6
  401ce0:	2a0e03e2 	mov	w2, w14
  401ce4:	14000003 	b	401cf0 <_Z16gauss_simd_aligni+0x190>
                m4[i][j1] = m4[i][j1] - m4[i][k] * m4[k][j1];
  401ce8:	2a0003e2 	mov	w2, w0
  401cec:	bc5fc0c1 	ldur	s1, [x6, #-4]
  401cf0:	8b0100e3 	add	x3, x7, x1
  401cf4:	bd400020 	ldr	s0, [x1]
            for (; j1 % 4 != 0 && j1 < N; j1++)
  401cf8:	11000440 	add	w0, w2, #0x1
                m4[i][j1] = m4[i][j1] - m4[i][k] * m4[k][j1];
  401cfc:	bc686862 	ldr	s2, [x3, x8]
            for (; j1 % 4 != 0 && j1 < N; j1++)
  401d00:	f240041f 	tst	x0, #0x3
  401d04:	7a401084 	ccmp	w4, w0, #0x4, ne  // ne = any
                m4[i][j1] = m4[i][j1] - m4[i][k] * m4[k][j1];
  401d08:	1f018040 	fmsub	s0, s2, s1, s0
  401d0c:	bc004420 	str	s0, [x1], #4
            for (; j1 % 4 != 0 && j1 < N; j1++)
  401d10:	54fffecc 	b.gt	401ce8 <_Z16gauss_simd_aligni+0x188>
            for (; j1 + 4 <= N; j1 += 4)
  401d14:	11001042 	add	w2, w2, #0x4
  401d18:	6b02009f 	cmp	w4, w2
  401d1c:	540002ad 	b.le	401d70 <_Z16gauss_simd_aligni+0x210>
  401d20:	8b20c201 	add	x1, x16, w0, sxtw
  401d24:	2a0003e3 	mov	w3, w0
  401d28:	8b010961 	add	x1, x11, x1, lsl #2
  401d2c:	d503201f 	nop
  return __builtin_aarch64_ld1v4sf ((const __builtin_aarch64_simd_sf *) __a);
  401d30:	3ce56820 	ldr	q0, [x1, x5]
  401d34:	11001c62 	add	w2, w3, #0x7
  401d38:	3dc00021 	ldr	q1, [x1]
  401d3c:	11001063 	add	w3, w3, #0x4
  return __a - __b;
  401d40:	4ea1cc60 	fmls	v0.4s, v3.4s, v1.4s
  __builtin_aarch64_st1v4sf ((__builtin_aarch64_simd_sf *) __a, __b);
  401d44:	3ca56820 	str	q0, [x1, x5]
  401d48:	91004021 	add	x1, x1, #0x10
  401d4c:	6b02009f 	cmp	w4, w2
  401d50:	54ffff0c 	b.gt	401d30 <_Z16gauss_simd_aligni+0x1d0>
  401d54:	4b000221 	sub	w1, w17, w0
  401d58:	11000c02 	add	w2, w0, #0x3
  401d5c:	121e7421 	and	w1, w1, #0xfffffffc
  401d60:	6b02009f 	cmp	w4, w2
  401d64:	1a9fc021 	csel	w1, w1, wzr, gt
  401d68:	11001000 	add	w0, w0, #0x4
  401d6c:	0b000020 	add	w0, w1, w0
            for (int j = j1; j < N; j++)
  401d70:	6b00009f 	cmp	w4, w0
  401d74:	540002ad 	b.le	401dc8 <_Z16gauss_simd_aligni+0x268>
                m4[i][j] = m4[i][j] - m4[i][k] * m4[k][j];
  401d78:	bc5fc0c1 	ldur	s1, [x6, #-4]
  401d7c:	8b20c121 	add	x1, x9, w0, sxtw
            for (int j = j1; j < N; j++)
  401d80:	11000400 	add	w0, w0, #0x1
  401d84:	8b010961 	add	x1, x11, x1, lsl #2
                m4[i][j] = m4[i][j] - m4[i][k] * m4[k][j];
  401d88:	8b0100e2 	add	x2, x7, x1
  401d8c:	bd400020 	ldr	s0, [x1]
  401d90:	bc686842 	ldr	s2, [x2, x8]
  401d94:	1f018040 	fmsub	s0, s2, s1, s0
  401d98:	bc004420 	str	s0, [x1], #4
            for (int j = j1; j < N; j++)
  401d9c:	6b00009f 	cmp	w4, w0
  401da0:	5400014d 	b.le	401dc8 <_Z16gauss_simd_aligni+0x268>
                m4[i][j] = m4[i][j] - m4[i][k] * m4[k][j];
  401da4:	8b0100e2 	add	x2, x7, x1
  401da8:	bc5fc0c1 	ldur	s1, [x6, #-4]
  401dac:	bd400020 	ldr	s0, [x1]
            for (int j = j1; j < N; j++)
  401db0:	11000400 	add	w0, w0, #0x1
                m4[i][j] = m4[i][j] - m4[i][k] * m4[k][j];
  401db4:	bc686842 	ldr	s2, [x2, x8]
  401db8:	1f018040 	fmsub	s0, s2, s1, s0
  401dbc:	bc004420 	str	s0, [x1], #4
            for (int j = j1; j < N; j++)
  401dc0:	6b00009f 	cmp	w4, w0
  401dc4:	54ffff0c 	b.gt	401da4 <_Z16gauss_simd_aligni+0x244>
        for (int i = k + 1; i < N; i++)
  401dc8:	91200129 	add	x9, x9, #0x800
            m4[i][k] = 0;
  401dcc:	b81fc0df 	stur	wzr, [x6, #-4]
        for (int i = k + 1; i < N; i++)
  401dd0:	d14008e7 	sub	x7, x7, #0x2, lsl #12
  401dd4:	914008a5 	add	x5, x5, #0x2, lsl #12
  401dd8:	914008c6 	add	x6, x6, #0x2, lsl #12
  401ddc:	eb0d013f 	cmp	x9, x13
  401de0:	54fff781 	b.ne	401cd0 <_Z16gauss_simd_aligni+0x170>  // b.any
  401de4:	91000652 	add	x18, x18, #0x1
  401de8:	91400908 	add	x8, x8, #0x2, lsl #12
  401dec:	91200273 	add	x19, x19, #0x800
  401df0:	9140094a 	add	x10, x10, #0x2, lsl #12
  401df4:	2a0e03fe 	mov	w30, w14
  401df8:	17ffff72 	b	401bc0 <_Z16gauss_simd_aligni+0x60>
            for (; j1 + 4 <= N; j1 += 4)
  401dfc:	2a0e03e0 	mov	w0, w14
  401e00:	6b1e009f 	cmp	w4, w30
  401e04:	54fff8ec 	b.gt	401d20 <_Z16gauss_simd_aligni+0x1c0>
  401e08:	17ffffdd 	b	401d7c <_Z16gauss_simd_aligni+0x21c>
}
  401e0c:	a94153f3 	ldp	x19, x20, [sp, #16]
  401e10:	a9425bf5 	ldp	x21, x22, [sp, #32]
  401e14:	f9401bf7 	ldr	x23, [sp, #48]
  401e18:	a8c47bfd 	ldp	x29, x30, [sp], #64
  401e1c:	d65f03c0 	ret
        int j0 = k + 1;  // 由于k不一定是4的倍数，将其手动对其到4的倍数
  401e20:	2a0e03e2 	mov	w2, w14
  401e24:	17ffff7e 	b	401c1c <_Z16gauss_simd_aligni+0xbc>
  401e28:	d65f03c0 	ret
  401e2c:	d503201f 	nop

0000000000401e30 <_Z5m_cmpi>:
    for (int i = 0; i < N; i++)
  401e30:	7100001f 	cmp	w0, #0x0
  401e34:	5400076d 	b.le	401f20 <_Z5m_cmpi+0xf0>
            if (m1[i][j] - m2[i][j] > 1e-6 || m2[i][j] - m1[i][j] > 1e-6)  // 差绝对值不超过1e-6认为相等
  401e38:	b0000001 	adrp	x1, 402000 <_Z7m_reseti+0xd0>
  401e3c:	b0018104 	adrp	x4, 3422000 <m2+0xfff6f0>
  401e40:	b0010103 	adrp	x3, 2422000 <m3+0xfff6f0>
            if (m1[i][j] - m3[i][j] > 1e-6 || m3[i][j] - m1[i][j] > 1e-6)
  401e44:	b0008105 	adrp	x5, 1422000 <m4+0xfff6f0>
            if (m1[i][j] - m4[i][j] > 1e-6 || m4[i][j] - m1[i][j] > 1e-6)
  401e48:	b0000106 	adrp	x6, 422000 <rd+0xa78>
  401e4c:	91244084 	add	x4, x4, #0x910
  401e50:	91244063 	add	x3, x3, #0x910
            if (m1[i][j] - m3[i][j] > 1e-6 || m3[i][j] - m1[i][j] > 1e-6)
  401e54:	912440a5 	add	x5, x5, #0x910
            if (m1[i][j] - m4[i][j] > 1e-6 || m4[i][j] - m1[i][j] > 1e-6)
  401e58:	912440c6 	add	x6, x6, #0x910
            if (m1[i][j] - m2[i][j] > 1e-6 || m2[i][j] - m1[i][j] > 1e-6)  // 差绝对值不超过1e-6认为相等
  401e5c:	fd41d822 	ldr	d2, [x1, #944]
  401e60:	937e7c02 	sbfiz	x2, x0, #2, #32
  401e64:	93737c08 	sbfiz	x8, x0, #13, #32
    for (int i = 0; i < N; i++)
  401e68:	d2800007 	mov	x7, #0x0                   	// #0
    bool result = true;
  401e6c:	52800020 	mov	w0, #0x1                   	// #1
  401e70:	aa0703e1 	mov	x1, x7
  401e74:	d503201f 	nop
            if (m1[i][j] - m2[i][j] > 1e-6 || m2[i][j] - m1[i][j] > 1e-6)  // 差绝对值不超过1e-6认为相等
  401e78:	bc616881 	ldr	s1, [x4, x1]
  401e7c:	bc616860 	ldr	s0, [x3, x1]
  401e80:	1e203823 	fsub	s3, s1, s0
  401e84:	1e22c063 	fcvt	d3, s3
  401e88:	1e622070 	fcmpe	d3, d2
  401e8c:	540003ec 	b.gt	401f08 <_Z5m_cmpi+0xd8>
  401e90:	1e213800 	fsub	s0, s0, s1
  401e94:	1e22c000 	fcvt	d0, s0
  401e98:	1e622010 	fcmpe	d0, d2
  401e9c:	5400036c 	b.gt	401f08 <_Z5m_cmpi+0xd8>
            if (m1[i][j] - m3[i][j] > 1e-6 || m3[i][j] - m1[i][j] > 1e-6)
  401ea0:	bc656820 	ldr	s0, [x1, x5]
  401ea4:	1e203823 	fsub	s3, s1, s0
  401ea8:	1e22c063 	fcvt	d3, s3
  401eac:	1e622070 	fcmpe	d3, d2
  401eb0:	540002cc 	b.gt	401f08 <_Z5m_cmpi+0xd8>
  401eb4:	1e213800 	fsub	s0, s0, s1
  401eb8:	1e22c000 	fcvt	d0, s0
  401ebc:	1e622010 	fcmpe	d0, d2
  401ec0:	5400024c 	b.gt	401f08 <_Z5m_cmpi+0xd8>
            if (m1[i][j] - m4[i][j] > 1e-6 || m4[i][j] - m1[i][j] > 1e-6)
  401ec4:	bc666820 	ldr	s0, [x1, x6]
        for (int j = 0; j < N; j++)
  401ec8:	91001021 	add	x1, x1, #0x4
            if (m1[i][j] - m4[i][j] > 1e-6 || m4[i][j] - m1[i][j] > 1e-6)
  401ecc:	1e203823 	fsub	s3, s1, s0
  401ed0:	1e22c063 	fcvt	d3, s3
  401ed4:	1e622070 	fcmpe	d3, d2
  401ed8:	5400018c 	b.gt	401f08 <_Z5m_cmpi+0xd8>
  401edc:	1e213800 	fsub	s0, s0, s1
  401ee0:	1e22c000 	fcvt	d0, s0
  401ee4:	1e622010 	fcmpe	d0, d2
  401ee8:	5400010c 	b.gt	401f08 <_Z5m_cmpi+0xd8>
        for (int j = 0; j < N; j++)
  401eec:	eb02003f 	cmp	x1, x2
  401ef0:	54fffc41 	b.ne	401e78 <_Z5m_cmpi+0x48>  // b.any
    for (int i = 0; i < N; i++)
  401ef4:	914008e7 	add	x7, x7, #0x2, lsl #12
  401ef8:	91400842 	add	x2, x2, #0x2, lsl #12
  401efc:	eb0800ff 	cmp	x7, x8
  401f00:	54fffb81 	b.ne	401e70 <_Z5m_cmpi+0x40>  // b.any
}
  401f04:	d65f03c0 	ret
    for (int i = 0; i < N; i++)
  401f08:	914008e7 	add	x7, x7, #0x2, lsl #12
  401f0c:	91400842 	add	x2, x2, #0x2, lsl #12
                result = false;
  401f10:	52800000 	mov	w0, #0x0                   	// #0
    for (int i = 0; i < N; i++)
  401f14:	eb0800ff 	cmp	x7, x8
  401f18:	54fffac1 	b.ne	401e70 <_Z5m_cmpi+0x40>  // b.any
  401f1c:	17fffffa 	b	401f04 <_Z5m_cmpi+0xd4>
    bool result = true;
  401f20:	52800020 	mov	w0, #0x1                   	// #1
}
  401f24:	d65f03c0 	ret
  401f28:	d503201f 	nop
  401f2c:	d503201f 	nop

0000000000401f30 <_Z7m_reseti>:
    for (int i = 0; i < N; i++)
  401f30:	7100001f 	cmp	w0, #0x0
  401f34:	5400132d 	b.le	402198 <_Z7m_reseti+0x268>
{
  401f38:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
  401f3c:	b0020103 	adrp	x3, 4422000 <m1+0xfff6f0>
  401f40:	910003fd 	mov	x29, sp
  401f44:	a90153f3 	stp	x19, x20, [sp, #16]
  401f48:	91244073 	add	x19, x3, #0x910
  401f4c:	2a0003f4 	mov	w20, w0
  401f50:	a9025bf5 	stp	x21, x22, [sp, #32]
  401f54:	51000415 	sub	w21, w0, #0x1
  401f58:	a90363f7 	stp	x23, x24, [sp, #48]
  401f5c:	b0018118 	adrp	x24, 3422000 <m2+0xfff6f0>
  401f60:	91244318 	add	x24, x24, #0x910
  401f64:	a9046bf9 	stp	x25, x26, [sp, #64]
    mersenne_twister_engine<_UIntType, __w, __n, __m, __r, __a, __u, __d,
			    __s, __b, __t, __c, __l, __f>::
    operator()()
    {
      // Reload the vector - cost is O(n) amortized over n calls.
      if (_M_p >= state_size)
  401f68:	f00000fa 	adrp	x26, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  401f6c:	9108035a 	add	x26, x26, #0x200
  401f70:	a90573fb 	stp	x27, x28, [sp, #80]
	_M_gen_rand();

      // Calculate o(x(i)).
      result_type __z = _M_x[_M_p++];
      __z ^= (__z >> __u) & __d;
      __z ^= (__z << __s) & __b;
  401f74:	d28ad01c 	mov	x28, #0x5680                	// #22144
  401f78:	2a0003fb 	mov	w27, w0
    for (int i = 0; i < N; i++)
  401f7c:	d2800019 	mov	x25, #0x0                   	// #0
  401f80:	f2b3a59c 	movk	x28, #0x9d2c, lsl #16
{
  401f84:	6d0627e8 	stp	d8, d9, [sp, #96]
      for (size_t __k = __m; __k != 0; --__k)
	{
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	  __tmp *= __r;
	}
      __ret = __sum / __tmp;
  401f88:	52a5f000 	mov	w0, #0x2f800000            	// #796917760
      if (__builtin_expect(__ret >= _RealType(1), 0))
	{
#if _GLIBCXX_USE_C99_MATH_TR1
	  __ret = std::nextafter(_RealType(1), _RealType(0));
  401f8c:	12b81001 	mov	w1, #0x3f7fffff            	// #1065353215
  401f90:	d373cb36 	lsl	x22, x25, #13
      __ret = __sum / __tmp;
  401f94:	1e270009 	fmov	s9, w0
	  __ret = std::nextafter(_RealType(1), _RealType(0));
  401f98:	1e270028 	fmov	s8, w1
        for (int j = 0; j < N; j++)
  401f9c:	52800017 	mov	w23, #0x0                   	// #0
  401fa0:	14000009 	b	401fc4 <_Z7m_reseti+0x94>
                m0[i][j] = 0;
  401fa4:	0f000400 	movi	v0.2s, #0x0
  401fa8:	bc336ac0 	str	s0, [x22, x19]
        for (int j = 0; j < N; j++)
  401fac:	110006e2 	add	w2, w23, #0x1
            m1[i][j] = m0[i][j];  // 创建副本
  401fb0:	bc386ac0 	str	s0, [x22, x24]
        for (int j = 0; j < N; j++)
  401fb4:	910012d6 	add	x22, x22, #0x4
  401fb8:	6b02037f 	cmp	w27, w2
  401fbc:	540004c0 	b.eq	402054 <_Z7m_reseti+0x124>  // b.none
  401fc0:	2a0203f7 	mov	w23, w2
            if (j < i)
  401fc4:	6b1902ff 	cmp	w23, w25
  401fc8:	54fffeeb 	b.lt	401fa4 <_Z7m_reseti+0x74>  // b.tstop
            else if (j == i)
  401fcc:	54000d20 	b.eq	402170 <_Z7m_reseti+0x240>  // b.none
      if (_M_p >= state_size)
  401fd0:	f949c342 	ldr	x2, [x26, #4992]
  401fd4:	f109bc5f 	cmp	x2, #0x26f
  401fd8:	54000d48 	b.hi	402180 <_Z7m_reseti+0x250>  // b.pmore
      result_type __z = _M_x[_M_p++];
  401fdc:	f8627b41 	ldr	x1, [x26, x2, lsl #3]
      __z ^= (__z << __t) & __c;
  401fe0:	d2bdf8c3 	mov	x3, #0xefc60000            	// #4022730752
      result_type __z = _M_x[_M_p++];
  401fe4:	91000442 	add	x2, x2, #0x1
  401fe8:	f909c342 	str	x2, [x26, #4992]
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  401fec:	0f000402 	movi	v2.2s, #0x0
      if (__builtin_expect(__ret >= _RealType(1), 0))
  401ff0:	1e2e1000 	fmov	s0, #1.000000000000000000e+00
      __z ^= (__z >> __u) & __d;
  401ff4:	d34ba820 	ubfx	x0, x1, #11, #32
  401ff8:	ca000021 	eor	x1, x1, x0
      __z ^= (__z << __s) & __b;
  401ffc:	8a011f80 	and	x0, x28, x1, lsl #7
  402000:	ca000021 	eor	x1, x1, x0
      __z ^= (__z << __t) & __c;
  402004:	8a013c62 	and	x2, x3, x1, lsl #15
  402008:	ca020021 	eor	x1, x1, x2
      __z ^= (__z >> __l);
  40200c:	ca414821 	eor	x1, x1, x1, lsr #18
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  402010:	9e230021 	ucvtf	s1, x1
  402014:	1e222821 	fadd	s1, s1, s2
      __ret = __sum / __tmp;
  402018:	1e290821 	fmul	s1, s1, s9
      if (__builtin_expect(__ret >= _RealType(1), 0))
  40201c:	1e202030 	fcmpe	s1, s0
  402020:	54000b8a 	b.ge	402190 <_Z7m_reseti+0x260>  // b.tcont
	  __glibcxx_assert(_M_a <= _M_b);
	}

	result_type
	a() const
	{ return _M_a; }
  402024:	d00000e0 	adrp	x0, 420000 <_ZNSo3putEc@GLIBCXX_3.4>
  402028:	9107c001 	add	x1, x0, #0x1f0
        for (int j = 0; j < N; j++)
  40202c:	110006e2 	add	w2, w23, #0x1
  402030:	bd41f000 	ldr	s0, [x0, #496]
	operator()(_UniformRandomNumberGenerator& __urng,
		   const param_type& __p)
	{
	  __detail::_Adaptor<_UniformRandomNumberGenerator, result_type>
	    __aurng(__urng);
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  402034:	bd400422 	ldr	s2, [x1, #4]
  402038:	1e203842 	fsub	s2, s2, s0
  40203c:	1f010040 	fmadd	s0, s2, s1, s0
                m0[i][j] = dis(gen);  // 生成归一化的随机数避免溢出
  402040:	bc336ac0 	str	s0, [x22, x19]
            m1[i][j] = m0[i][j];  // 创建副本
  402044:	bc386ac0 	str	s0, [x22, x24]
        for (int j = 0; j < N; j++)
  402048:	910012d6 	add	x22, x22, #0x4
  40204c:	6b02037f 	cmp	w27, w2
  402050:	54fffb81 	b.ne	401fc0 <_Z7m_reseti+0x90>  // b.any
    for (int i = 0; i < N; i++)
  402054:	91000739 	add	x25, x25, #0x1
  402058:	eb14033f 	cmp	x25, x20
  40205c:	54fff961 	b.ne	401f88 <_Z7m_reseti+0x58>  // b.any
  402060:	d0018109 	adrp	x9, 3424000 <m1+0x16f0>
  402064:	91244129 	add	x9, x9, #0x910
  402068:	52800000 	mov	w0, #0x0                   	// #0
  40206c:	aa1303e3 	mov	x3, x19
  402070:	aa0903e6 	mov	x6, x9
  402074:	91401308 	add	x8, x24, #0x4, lsl #12
        for (int i = k + 1; i < N; i++)
  402078:	11000407 	add	w7, w0, #0x1
    for (int i = 0; i < N; i++)
  40207c:	d2800005 	mov	x5, #0x0                   	// #0
        for (int i = k + 1; i < N; i++)
  402080:	6b0002ff 	cmp	w23, w0
  402084:	54000300 	b.eq	4020e4 <_Z7m_reseti+0x1b4>  // b.none
  402088:	4b0702a4 	sub	w4, w21, w7
  40208c:	aa0603e1 	mov	x1, x6
  402090:	8b050084 	add	x4, x4, x5
  402094:	8b043504 	add	x4, x8, x4, lsl #13
  402098:	d2800000 	mov	x0, #0x0                   	// #0
  40209c:	d503201f 	nop
                m1[i][j] += m0[k][j];  // 不同的行相加，使副本每行都是基的线性和，一定能消元至原三角矩阵
  4020a0:	bc607820 	ldr	s0, [x1, x0, lsl #2]
  4020a4:	bc607861 	ldr	s1, [x3, x0, lsl #2]
  4020a8:	1e212800 	fadd	s0, s0, s1
  4020ac:	bc207820 	str	s0, [x1, x0, lsl #2]
            for (int j = 0; j < N; j++)
  4020b0:	91000400 	add	x0, x0, #0x1
  4020b4:	6b00005f 	cmp	w2, w0
  4020b8:	54ffff4c 	b.gt	4020a0 <_Z7m_reseti+0x170>
        for (int i = k + 1; i < N; i++)
  4020bc:	91400821 	add	x1, x1, #0x2, lsl #12
  4020c0:	eb04003f 	cmp	x1, x4
  4020c4:	54fffea1 	b.ne	402098 <_Z7m_reseti+0x168>  // b.any
  4020c8:	2a0703e0 	mov	w0, w7
  4020cc:	910004a5 	add	x5, x5, #0x1
  4020d0:	91400863 	add	x3, x3, #0x2, lsl #12
  4020d4:	914008c6 	add	x6, x6, #0x2, lsl #12
  4020d8:	11000407 	add	w7, w0, #0x1
  4020dc:	6b0002ff 	cmp	w23, w0
  4020e0:	54fffd41 	b.ne	402088 <_Z7m_reseti+0x158>  // b.any
  4020e4:	52840000 	mov	w0, #0x2000                	// #8192
  4020e8:	90010117 	adrp	x23, 2422000 <m3+0xfff6f0>
  4020ec:	90008116 	adrp	x22, 1422000 <m4+0xfff6f0>
  4020f0:	90000113 	adrp	x19, 422000 <rd+0xa78>
  4020f4:	9ba026b5 	umaddl	x21, w21, w0, x9
            m2[i][j] = m1[i][j];  // 复制三份以对比串行/SIMD/Cache优化/对齐
  4020f8:	d37ef694 	lsl	x20, x20, #2
  4020fc:	912442f7 	add	x23, x23, #0x910
  402100:	912442d6 	add	x22, x22, #0x910
  402104:	91244273 	add	x19, x19, #0x910
  402108:	aa1803e1 	mov	x1, x24
  40210c:	aa1403e2 	mov	x2, x20
  402110:	aa1703e0 	mov	x0, x23
  402114:	97fffae7 	bl	400cb0 <memcpy@plt>
            m3[i][j] = m1[i][j];
  402118:	aa1803e1 	mov	x1, x24
  40211c:	aa1403e2 	mov	x2, x20
  402120:	aa1603e0 	mov	x0, x22
  402124:	97fffae3 	bl	400cb0 <memcpy@plt>
            m4[i][j] = m1[i][j];
  402128:	aa1803e1 	mov	x1, x24
  40212c:	aa1303e0 	mov	x0, x19
  402130:	aa1403e2 	mov	x2, x20
    for (int i = 0; i < N; i++)
  402134:	91400b18 	add	x24, x24, #0x2, lsl #12
            m4[i][j] = m1[i][j];
  402138:	97fffade 	bl	400cb0 <memcpy@plt>
    for (int i = 0; i < N; i++)
  40213c:	91400af7 	add	x23, x23, #0x2, lsl #12
  402140:	91400ad6 	add	x22, x22, #0x2, lsl #12
  402144:	91400a73 	add	x19, x19, #0x2, lsl #12
  402148:	eb15031f 	cmp	x24, x21
  40214c:	54fffde1 	b.ne	402108 <_Z7m_reseti+0x1d8>  // b.any
}
  402150:	a94153f3 	ldp	x19, x20, [sp, #16]
  402154:	a9425bf5 	ldp	x21, x22, [sp, #32]
  402158:	a94363f7 	ldp	x23, x24, [sp, #48]
  40215c:	a9446bf9 	ldp	x25, x26, [sp, #64]
  402160:	a94573fb 	ldp	x27, x28, [sp, #80]
  402164:	6d4627e8 	ldp	d8, d9, [sp, #96]
  402168:	a8c77bfd 	ldp	x29, x30, [sp], #112
  40216c:	d65f03c0 	ret
                m0[i][j] = 1.0;
  402170:	1e2e1001 	fmov	s1, #1.000000000000000000e+00
  402174:	1e204020 	fmov	s0, s1
  402178:	bc336ac1 	str	s1, [x22, x19]
  40217c:	17ffff8c 	b	401fac <_Z7m_reseti+0x7c>
	_M_gen_rand();
  402180:	aa1a03e0 	mov	x0, x26
  402184:	94000033 	bl	402250 <_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv>
      result_type __z = _M_x[_M_p++];
  402188:	f949c342 	ldr	x2, [x26, #4992]
  40218c:	17ffff94 	b	401fdc <_Z7m_reseti+0xac>
	  __ret = std::nextafter(_RealType(1), _RealType(0));
  402190:	1e204101 	fmov	s1, s8
  402194:	17ffffa4 	b	402024 <_Z7m_reseti+0xf4>
  402198:	d65f03c0 	ret
  40219c:	d503201f 	nop

00000000004021a0 <_ZNKSt5ctypeIcE8do_widenEc>:
       *  @param __c  The char to convert.
       *  @return  The converted character.
      */
      virtual char_type
      do_widen(char __c) const
      { return __c; }
  4021a0:	2a0103e0 	mov	w0, w1
  4021a4:	d65f03c0 	ret
  4021a8:	d503201f 	nop
  4021ac:	d503201f 	nop

00000000004021b0 <_ZNSt13random_deviceD1Ev>:
    ~random_device()
  4021b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4021b4:	910003fd 	mov	x29, sp
    { _M_fini(); }
  4021b8:	97fffaca 	bl	400ce0 <_ZNSt13random_device7_M_finiEv@plt>
  4021bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4021c0:	d65f03c0 	ret
  4021c4:	d503201f 	nop
  4021c8:	d503201f 	nop
  4021cc:	d503201f 	nop

00000000004021d0 <_ZNSt13random_deviceC1Ev>:
    random_device() { _M_init("default"); }
  4021d0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
	  return __s1;
#ifdef __cpp_lib_is_constant_evaluated
	if (std::is_constant_evaluated())
	  return __gnu_cxx::char_traits<char_type>::copy(__s1, __s2, __n);
#endif
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  4021d4:	90000002 	adrp	x2, 402000 <_Z7m_reseti+0xd0>
  4021d8:	910c8042 	add	x2, x2, #0x320
#if __cplusplus < 201103L
	_Alloc_hider(pointer __dat, const _Alloc& __a = _Alloc())
	: allocator_type(__a), _M_p(__dat) { }
#else
	_Alloc_hider(pointer __dat, const _Alloc& __a)
	: allocator_type(__a), _M_p(__dat) { }
  4021dc:	9100c3e3 	add	x3, sp, #0x30
  4021e0:	910003fd 	mov	x29, sp
      _M_data(pointer __p)
      { _M_dataplus._M_p = __p; }

      void
      _M_length(size_type __length)
      { _M_string_length = __length; }
  4021e4:	d28000e4 	mov	x4, #0x7                   	// #7
  4021e8:	b9400045 	ldr	w5, [x2]
	: allocator_type(__a), _M_p(__dat) { }
  4021ec:	910083e1 	add	x1, sp, #0x20
  4021f0:	b8403042 	ldur	w2, [x2, #3]
  4021f4:	b90033e5 	str	w5, [sp, #48]
      { __c1 = __c2; }
  4021f8:	3900dfff 	strb	wzr, [sp, #55]
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  4021fc:	b8003062 	stur	w2, [x3, #3]
      { _M_string_length = __length; }
  402200:	a90213e3 	stp	x3, x4, [sp, #32]
  402204:	97fffae7 	bl	400da0 <_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@plt>

      pointer
      _M_data() const
      { return _M_dataplus._M_p; }
  402208:	f94013e0 	ldr	x0, [sp, #32]
      _M_create(size_type&, size_type);

      void
      _M_dispose()
      {
	if (!_M_is_local())
  40220c:	9100c3e1 	add	x1, sp, #0x30
  402210:	eb01001f 	cmp	x0, x1
  402214:	54000080 	b.eq	402224 <_ZNSt13random_deviceC1Ev+0x54>  // b.none
	  _M_destroy(_M_allocated_capacity);
      }

      void
      _M_destroy(size_type __size) throw()
      { _Alloc_traits::deallocate(_M_get_allocator(), _M_data(), __size + 1); }
  402218:	f9401be1 	ldr	x1, [sp, #48]
# endif
			      std::align_val_t(alignof(_Tp)));
	    return;
	  }
#endif
	::operator delete(__p
  40221c:	91000421 	add	x1, x1, #0x1
  402220:	97fffab4 	bl	400cf0 <_ZdlPvm@plt>
  402224:	a8c47bfd 	ldp	x29, x30, [sp], #64
  402228:	d65f03c0 	ret
  40222c:	f9000bf3 	str	x19, [sp, #16]

      /**
       *  @brief  Destroy the string instance.
       */
      ~basic_string()
      { _M_dispose(); }
  402230:	aa0003f3 	mov	x19, x0
  402234:	910083e0 	add	x0, sp, #0x20
  402238:	97fffabe 	bl	400d30 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
      ~new_allocator() _GLIBCXX_USE_NOEXCEPT { }
  40223c:	aa1303e0 	mov	x0, x19
  402240:	97fffae0 	bl	400dc0 <_Unwind_Resume@plt>
  402244:	d503201f 	nop
  402248:	d503201f 	nop
  40224c:	d503201f 	nop

0000000000402250 <_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv>:
		       ^ ((__y & 0x01) ? __a : 0));
  402250:	d2961be7 	mov	x7, #0xb0df                	// #45279
  402254:	aa0003e1 	mov	x1, x0
  402258:	911c6006 	add	x6, x0, #0x718
    mersenne_twister_engine<_UIntType, __w, __n, __m, __r, __a, __u, __d,
  40225c:	aa0003e3 	mov	x3, x0
		       ^ ((__y & 0x01) ? __a : 0));
  402260:	f2b32107 	movk	x7, #0x9908, lsl #16
  402264:	d503201f 	nop
			   | (_M_x[__k + 1] & __lower_mask));
  402268:	a9401464 	ldp	x4, x5, [x3]
	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
  40226c:	f9463462 	ldr	x2, [x3, #3176]
	  _UIntType __y = ((_M_x[__k] & __upper_mask)
  402270:	b34078a4 	bfxil	x4, x5, #0, #31
	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
  402274:	ca440442 	eor	x2, x2, x4, lsr #1
		       ^ ((__y & 0x01) ? __a : 0));
  402278:	f240009f 	tst	x4, #0x1
  40227c:	ca070044 	eor	x4, x2, x7
  402280:	9a821082 	csel	x2, x4, x2, ne  // ne = any
	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
  402284:	f8008462 	str	x2, [x3], #8
      for (size_t __k = 0; __k < (__n - __m); ++__k)
  402288:	eb0300df 	cmp	x6, x3
  40228c:	54fffee1 	b.ne	402268 <_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv+0x18>  // b.any
		       ^ ((__y & 0x01) ? __a : 0));
  402290:	d2961be5 	mov	x5, #0xb0df                	// #45279
  402294:	91318006 	add	x6, x0, #0xc60
  402298:	f2b32105 	movk	x5, #0x9908, lsl #16
  40229c:	d503201f 	nop
	  _UIntType __y = ((_M_x[__k] & __upper_mask)
  4022a0:	f9438c23 	ldr	x3, [x1, #1816]
      for (size_t __k = (__n - __m); __k < (__n - 1); ++__k)
  4022a4:	91002021 	add	x1, x1, #0x8
			   | (_M_x[__k + 1] & __lower_mask));
  4022a8:	f9438c24 	ldr	x4, [x1, #1816]
	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
  4022ac:	f85f8022 	ldur	x2, [x1, #-8]
	  _UIntType __y = ((_M_x[__k] & __upper_mask)
  4022b0:	b3407883 	bfxil	x3, x4, #0, #31
	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
  4022b4:	ca430442 	eor	x2, x2, x3, lsr #1
		       ^ ((__y & 0x01) ? __a : 0));
  4022b8:	f240007f 	tst	x3, #0x1
  4022bc:	ca050043 	eor	x3, x2, x5
  4022c0:	9a821062 	csel	x2, x3, x2, ne  // ne = any
	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
  4022c4:	f9038822 	str	x2, [x1, #1808]
      for (size_t __k = (__n - __m); __k < (__n - 1); ++__k)
  4022c8:	eb0100df 	cmp	x6, x1
  4022cc:	54fffea1 	b.ne	4022a0 <_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv+0x50>  // b.any
		       | (_M_x[0] & __lower_mask));
  4022d0:	f9400004 	ldr	x4, [x0]
		       ^ ((__y & 0x01) ? __a : 0));
  4022d4:	d2961be3 	mov	x3, #0xb0df                	// #45279
      _UIntType __y = ((_M_x[__n - 1] & __upper_mask)
  4022d8:	f949bc02 	ldr	x2, [x0, #4984]
		       ^ ((__y & 0x01) ? __a : 0));
  4022dc:	f2b32103 	movk	x3, #0x9908, lsl #16
      _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
  4022e0:	f9463001 	ldr	x1, [x0, #3168]
      _M_p = 0;
  4022e4:	f909c01f 	str	xzr, [x0, #4992]
      _UIntType __y = ((_M_x[__n - 1] & __upper_mask)
  4022e8:	b3407882 	bfxil	x2, x4, #0, #31
      _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
  4022ec:	ca420421 	eor	x1, x1, x2, lsr #1
		       ^ ((__y & 0x01) ? __a : 0));
  4022f0:	f240005f 	tst	x2, #0x1
  4022f4:	ca030022 	eor	x2, x1, x3
  4022f8:	9a811041 	csel	x1, x2, x1, ne  // ne = any
      _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
  4022fc:	f909bc01 	str	x1, [x0, #4984]
    }
  402300:	d65f03c0 	ret

Disassembly of section .fini:

0000000000402304 <_fini>:
  402304:	d503201f 	nop
  402308:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  40230c:	910003fd 	mov	x29, sp
  402310:	a8c17bfd 	ldp	x29, x30, [sp], #16
  402314:	d65f03c0 	ret
