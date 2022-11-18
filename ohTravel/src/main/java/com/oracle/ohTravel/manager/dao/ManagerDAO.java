package com.oracle.ohTravel.manager.dao;

import java.util.List;

import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;

public interface ManagerDAO {

	List<MemberDTO> getMemberList();

	List<MembershipDTO> getMembershipList();

	List<MembershipDTO> getUserDetail(String mem_id);

	int updateUserRole(MembershipDTO membership);

	int updateUserMemName(MembershipDTO membership);

	int deleteUser(String mem_id);

	List<MembershipDTO> getMembershipDetail(int membership_id);

	int updateMembership(MembershipDTO membership);

	int deleteMembership(MembershipDTO membership);

}
