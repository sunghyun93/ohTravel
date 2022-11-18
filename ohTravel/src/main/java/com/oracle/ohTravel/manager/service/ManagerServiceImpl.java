package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.dao.ManagerDAO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ManagerServiceImpl implements ManagerService {
	private final ManagerDAO dao;

	//회원관리 들어갔을때 회원목록 보이는거
	@Override
	public List<MemberDTO> getMemberList() {
		List<MemberDTO>member = dao.getMemberList();
		return member;
	}
	//등급관리 들어갔을때 목록보이는거
	@Override	
	public List<MembershipDTO> getMembershipList() {
		List<MembershipDTO>membershipList = dao.getMembershipList();
		return membershipList;
	}
	@Override
	public List<MembershipDTO> getUserDetail(String mem_id) {
		List<MembershipDTO> getUserDetail = dao.getUserDetail(mem_id);
		return getUserDetail;
	}
	
	@Override
	public int updateUserRole(MembershipDTO membership) {
		int result = dao.updateUserRole(membership);
		return result;
	}
	@Override
	public int updateUserMemName(MembershipDTO membership) {
		int result = dao.updateUserMemName(membership);
		return result;
	}
	@Override
	public int deleteUser(String mem_id) {
		int result = dao.deleteUser(mem_id);
		return result;
	}
	@Override
	public List<MembershipDTO> getMembershipDetail(int membership_id) {
		List<MembershipDTO> membershipDetail = dao.getMembershipDetail(membership_id);
		return membershipDetail;
	}
	@Override
	public int updateMembership(MembershipDTO membership) {
		int result = dao.updateMembership(membership);
		return result;
	}
	@Override
	public int deleteMembership(MembershipDTO membership) {
		int result = dao.deleteMembership(membership);
		return result;
	}
	
	
}
