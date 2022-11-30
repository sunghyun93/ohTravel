package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.dao.ManagerDAO;
import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.ManagePackageDTO;
import com.oracle.ohTravel.manager.dto.ManageTicketDTO;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ManagerServiceImpl implements ManagerService {
	private final ManagerDAO dao;
	
	@Override
	public int totalMember() {
		int total = dao.totalMember();
		return total;
	}
	
	//회원관리 들어갔을때 회원목록 보이는거
	@Override
	public List<MemberDTO> getMemberList(MemberDTO member) {
		List<MemberDTO>memberList = dao.getMemberList(member);
		return memberList;
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
	public List<NoticeDTO> getNoticeList(NoticeDTO notice) {
		List<NoticeDTO> noticeList = dao.getNoticeList(notice);
		return noticeList;
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
	public List<ManageTicketDTO> getTicketList(ManageTicketDTO ticket) {
		List<ManageTicketDTO>ticketList = dao.getTicketList(ticket);
		return ticketList;
	}
	@Override
	public List<ManageTicketDTO> getTicketDetail(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketDetail = dao.getTicketDetail(ticket);
		return ticketDetail;
	}
	@Override
	public List<ManageTicketDTO> getCountryList() {
		List<ManageTicketDTO> countryList = dao.getCountryList();
		return countryList;
	}
	@Override
	public List<ManageTicketDTO> getCityList(ManageTicketDTO ticket) {
		List<ManageTicketDTO> cityList = dao.getCityList(ticket);
		return cityList;
	}
	@Override
	public List<ManageTicketDTO> getCityListChangeCountry(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketChangeCountry = dao.getCityListChangeCountry(ticket);
		return ticketChangeCountry;
	}
	@Override
	public int updateTicket(ManageTicketDTO ticket) {
		int result = dao.updateTicket(ticket);
		return result;
	}
	@Override
	public int insertTicket(ManageTicketDTO ticket) {
		int result = dao.insertTicket(ticket);
		return result;
	}
	@Override
	public int deleteTicket(ManageTicketDTO ticket) {
		int result = dao.deleteTicket(ticket);
		return result;
	}

	@Override
	public int totalTicket() {
		int total = dao.totalTicket();
		return total;
	}

	@Override
	public int totalNotice() {
		int total = dao.totalNotice();
		return total;
	}

	@Override
	public int totalPackage() {
		int total = dao.totalPackage();
		return total;
	}

	@Override
	public List<ManagePackageDTO> getPackageList(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageList = dao.getPackageList(pk);
		return packageList;
	}

	@Override
	public List<ManagePackageDTO> getPackageDetail(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageDetail = dao.getPackageDetail(pk);
		return packageDetail;
	}

	@Override
	public int totalPackageDetail(ManagePackageDTO pk) {
		int total = dao.totalPackageDetail(pk);
		return total;
	}

	@Override
	public List<ManagePackageDTO> getAttractionList() {
		List<ManagePackageDTO> attractionList = dao.getAttractionList();
		return attractionList;
	}

	@Override
	public int totalAttraction() {
		int total = dao.totalAttraction();
		return total;
	}

	@Override
	public int insertAttraction(ManagePackageDTO pk) {
		int result = dao.insertAttraction(pk);
		return result;
	}

	@Override
	public List<ManagePackageDTO> getAttractionDetail(ManagePackageDTO pk) {
		List<ManagePackageDTO> getAttractionDetail = dao.getAttractionDetail(pk);
		return getAttractionDetail;
	}

	@Override
	public List<ManagePackageDTO> getCityList(ManagePackageDTO pk) {
		List<ManagePackageDTO> cityList = dao.getCityList(pk);
		return cityList;
	}

	@Override
	public int updateAttraction(ManagePackageDTO pk) {
		int result = dao.updateAttraction(pk);
		return result;
	}
	
	
}
