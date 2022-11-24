package com.oracle.ohTravel.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mysql.cj.protocol.x.Notice;
import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.TicketDTO;

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

	@Override
	public int insertMembership(MembershipDTO membership) {
		int result = session.insert("InsertMembership", membership);
		return result;
	}

	@Override
	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> notice = session.selectList("GetNoticeList");
		return notice;
	}

	@Override
	public List<NoticeDTO> getNoticeDetail(int notice_id) {
		System.out.println("dao notice_id->"+notice_id);
		List<NoticeDTO> noticeDetail = session.selectList("GetNoticeDetail", notice_id);
		return noticeDetail;
	}

	@Override
	public int updateNotice(NoticeDTO notice) {
		int result = session.update("UpdateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(NoticeDTO notice) {
		int result = session.delete("DeleteNotice", notice);
		return result;
	}

	@Override
	public int insertNotice(NoticeDTO notice) {
		int result = session.insert("InsertNotice", notice);
		return result;
	}

	@Override
	public List<CouponDTO> getCouponList() {
		List<CouponDTO>coupon = session.selectList("GetCouponList");
		return coupon;
	}

	@Override
	public List<CouponDTO> getCouponDetail(CouponDTO coupon) {
		List<CouponDTO>couponDetail = session.selectList("GetCouponDetail", coupon);
		return couponDetail;
	}

	@Override
	public List<CouponDTO> getCouponMemberDetail(CouponDTO coupon) {
		List<CouponDTO> couponMemberDetail = session.selectList("GetCouponMemberDetail", coupon);
		return couponMemberDetail;
	}

	@Override
	public int updateCoupon(CouponDTO coupon) {
		int result = session.update("UpdateCoupon", coupon);
		return result;
	}

	@Override
	public int deleteCoupon(CouponDTO coupon) {
		int result = session.delete("DeleteCoupon", coupon);
		return result;
	}

	@Override
	public int insertCoupon(CouponDTO coupon) {
		int result = session.insert("InsertCoupon", coupon);
		return result;
	}

	@Override
	public List<TicketDTO> getTicketList() {
		List<TicketDTO> ticketList = session.selectList("GetTicketList");
		return ticketList;
	}

	@Override
	public List<TicketDTO> getTicketDetail(TicketDTO ticket) {
		List<TicketDTO> ticketDetail = session.selectList("GetTicketDetail",ticket);
		return ticketDetail;
	}

	@Override
	public List<TicketDTO> getCountryList() {
		List<TicketDTO> countryList = session.selectList("GetCountryList");
		return countryList;
	}

	@Override
	public List<TicketDTO> getCityList(TicketDTO ticket) {
		List<TicketDTO> cityList = session.selectList("GetCityList",ticket);
		return cityList;
	}

	@Override
	public List<TicketDTO> getCityListChangeCountry(TicketDTO ticket) {
		List<TicketDTO> ticketChangeCountry = session.selectList("GetCityListChangeCountry", ticket);
		return ticketChangeCountry;
	}

	@Override
	public int updateTicket(TicketDTO ticket) {
		int result = session.update("UpdateTicket", ticket);
		return result;
	}

	@Override
	public int insertTicket(TicketDTO ticket) {
		int result = session.insert("InsertTicket",ticket);
		return result;
	}

}
