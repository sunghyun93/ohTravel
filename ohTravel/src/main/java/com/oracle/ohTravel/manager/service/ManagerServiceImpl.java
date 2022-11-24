package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.dao.ManagerDAO;
import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.TicketDTO;

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
	@Override
	public int insertMembership(MembershipDTO membership) {
		int result = dao.insertMembership(membership);
		return result;
	}
	@Override
	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> notice = dao.getNoticeList();
		return notice;
	}
	@Override
	public List<NoticeDTO> getNoticeDetail(int notice_id) {
		List<NoticeDTO> noticeDetail = dao.getNoticeDetail(notice_id);
		return noticeDetail;
	}
	@Override
	public int updateNotice(NoticeDTO notice) {
		int result = dao.updateNotice(notice);
		return result;
	}
	@Override
	public int deleteNotice(NoticeDTO notice) {
		int result = dao.deleteNotice(notice);
		return result;
	}
	@Override
	public int insertNotice(NoticeDTO notice) {
		int result = dao.insertNotice(notice);
		return result;
	}
	@Override
	public List<CouponDTO> getCouponList() {
		List<CouponDTO>coupon = dao.getCouponList();
		return coupon;
	}
	@Override
	public List<CouponDTO> getCouponDetail(CouponDTO coupon) {
		List<CouponDTO>couponDetail = dao.getCouponDetail(coupon);
		return couponDetail;
	}
	@Override
	public List<CouponDTO> getCouponMemberDetail(CouponDTO coupon) {
		List<CouponDTO> couponMemberDetail = dao.getCouponMemberDetail(coupon);
		return couponMemberDetail;
	}
	@Override
	public int updateCoupon(CouponDTO coupon) {
		int result = dao.updateCoupon(coupon);
		return result;
	}
	@Override
	public int deleteCoupon(CouponDTO coupon) {
		int result = dao.deleteCoupon(coupon);
		return result;
	}
	@Override
	public int insertCoupon(CouponDTO coupon) {
		int result = dao.insertCoupon(coupon);
		return result;
	}
	@Override
	public List<TicketDTO> getTicketList() {
		List<TicketDTO>ticketList = dao.getTicketList();
		return ticketList;
	}
	@Override
	public List<TicketDTO> getTicketDetail(TicketDTO ticket) {
		List<TicketDTO> ticketDetail = dao.getTicketDetail(ticket);
		return ticketDetail;
	}
	@Override
	public List<TicketDTO> getCountryList() {
		List<TicketDTO> countryList = dao.getCountryList();
		return countryList;
	}
	@Override
	public List<TicketDTO> getCityList(TicketDTO ticket) {
		List<TicketDTO> cityList = dao.getCityList(ticket);
		return cityList;
	}
	@Override
	public List<TicketDTO> getCityListChangeCountry(TicketDTO ticket) {
		List<TicketDTO> ticketChangeCountry = dao.getCityListChangeCountry(ticket);
		return ticketChangeCountry;
	}
	@Override
	public int updateTicket(TicketDTO ticket) {
		int result = dao.updateTicket(ticket);
		return result;
	}
	@Override
	public int insertTicket(TicketDTO ticket) {
		int result = dao.insertTicket(ticket);
		return result;
	}
	@Override
	public int deleteTicket(TicketDTO ticket) {
		int result = dao.deleteTicket(ticket);
		return result;
	}
	
	
}
