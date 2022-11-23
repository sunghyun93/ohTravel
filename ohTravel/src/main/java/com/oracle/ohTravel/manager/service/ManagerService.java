package com.oracle.ohTravel.manager.service;

import java.util.List;

import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.TicketDTO;

public interface ManagerService {

	List<MemberDTO> getMemberList();

	List<MembershipDTO> getMembershipList();

	List<MembershipDTO> getUserDetail(String mem_id);

	int updateUserRole(MembershipDTO membership);

	int updateUserMemName(MembershipDTO membership);

	int deleteUser(String mem_id);

	List<MembershipDTO> getMembershipDetail(int membership_id);

	int updateMembership(MembershipDTO membership);

	int deleteMembership(MembershipDTO membership);

	int insertMembership(MembershipDTO membership);

	List<NoticeDTO> getNoticeList();

	List<NoticeDTO> getNoticeDetail(int notice_id);

	int updateNotice(NoticeDTO notice);

	int deleteNotice(NoticeDTO notice);

	int insertNotice(NoticeDTO notice);

	List<CouponDTO> getCouponList();

	List<CouponDTO> getCouponDetail(CouponDTO coupon);
	
	List<CouponDTO> getCouponMemberDetail(CouponDTO coupon);

	int updateCoupon(CouponDTO coupon);

	int deleteCoupon(CouponDTO coupon);

	int insertCoupon(CouponDTO coupon);

	List<TicketDTO> getTicketList();

	List<TicketDTO> getTicketDetail(TicketDTO ticket);

	List<TicketDTO> getCountryList();

	List<TicketDTO> getCityList(TicketDTO ticket);

}
