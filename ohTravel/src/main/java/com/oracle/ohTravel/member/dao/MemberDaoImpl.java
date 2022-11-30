package com.oracle.ohTravel.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.member.domain.Member;
import com.oracle.ohTravel.member.model.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		log.info("MemberDaoImpl login Start..");
		MemberDTO res = null;
		
		try {
			res = sqlSession.selectOne("login", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
}
