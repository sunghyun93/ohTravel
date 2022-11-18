package com.oracle.ohTravel.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class ManagerDAOImpl implements ManagerDAO {
	private final SqlSession session;
	
	@Override
	public List<MemberDTO> getMemberList() {
		List<MemberDTO>member = session.selectList("MemberList");
		return member;
	}

	@Override
	public List<MembershipDTO> getMembershipList() {
		List<MembershipDTO>membershipList = session.selectList("MembershipList");
		return membershipList;
	}

	@Override
	public List<MembershipDTO> getUserDetail(String mem_id) {
		List<MembershipDTO> getUserDetail = session.selectList("GetUserDetail",mem_id);
		return getUserDetail;
	}


	@Override
	public int updateUserRole(MembershipDTO membership) {
		int result = session.update("UpdateUserRole",membership);
		return result;
	}

	@Override
	public int updateUserMemName(MembershipDTO membership) {
		int result = session.update("UpdateUserMemName",membership);
		return result;
	}

	@Override
	public int deleteUser(String mem_id) {
		int result = session.delete("DeleteUser", mem_id);
		return result;
	}

	@Override
	public List<MembershipDTO> getMembershipDetail(int membership_id) {
		List<MembershipDTO> membershipDetail = session.selectList("GetMembershipDetail",membership_id);
		return membershipDetail;
	}

	@Override
	public int updateMembership(MembershipDTO membership) {
		int result = session.update("UpdateMembership",membership);
		System.out.println(result);
		return result;
	}

	@Override
	public int deleteMembership(MembershipDTO membership) {
		int result = session.delete("DeleteMembership", membership);
		return result;
	}

}
