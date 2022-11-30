package com.oracle.ohTravel.member.service;

import com.oracle.ohTravel.member.model.MemberDTO;

public interface MemberService {
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO);
}
