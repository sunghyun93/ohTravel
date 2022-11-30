package com.oracle.ohTravel.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.ohTravel.member.dao.MemberDao;
import com.oracle.ohTravel.member.domain.Member;
import com.oracle.ohTravel.member.model.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	// 로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		log.info("MemberServiceImpl login Start..");
		return memberDao.login(memberDTO);
	}


	
}
