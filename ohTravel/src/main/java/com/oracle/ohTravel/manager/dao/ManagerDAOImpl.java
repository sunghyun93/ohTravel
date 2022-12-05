package com.oracle.ohTravel.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mysql.cj.protocol.x.Notice;
import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.ManagePackageDTO;
import com.oracle.ohTravel.manager.dto.ManageTicketDTO;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class ManagerDAOImpl implements ManagerDAO {
	private final SqlSession session;
	
	@Override
	public int totalMember() {
		int total = session.selectOne("totalMember");
		return total;
	}
	
	@Override
	public List<MemberDTO> getMemberList(MemberDTO member) {
		List<MemberDTO>memberList = session.selectList("memberList",member);
		return memberList;
	}

	@Override
	public List<MembershipDTO> getMembershipList() {
		List<MembershipDTO>membershipList = session.selectList("membershipList");
		return membershipList;
	}

	@Override
	public List<MembershipDTO> getUserDetail(String mem_id) {
		List<MembershipDTO> getUserDetail = session.selectList("getUserDetail",mem_id);
		return getUserDetail;
	}


	@Override
	public int updateUserRole(MembershipDTO membership) {
		int result = session.update("updateUserRole",membership);
		return result;
	}

	@Override
	public int updateUserMemName(MembershipDTO membership) {
		int result = session.update("updateUserMemName",membership);
		return result;
	}

	@Override
	public int deleteUser(String mem_id) {
		int result = session.delete("deleteUser", mem_id);
		return result;
	}

	@Override
	public List<MembershipDTO> getMembershipDetail(int membership_id) {
		List<MembershipDTO> membershipDetail = session.selectList("getMembershipDetail",membership_id);
		return membershipDetail;
	}

	@Override
	public int updateMembership(MembershipDTO membership) {
		int result = session.update("updateMembership",membership);
		System.out.println(result);
		return result;
	}

	@Override
	public int deleteMembership(MembershipDTO membership) {
		int result = session.delete("deleteMembership", membership);
		return result;
	}

	@Override
	public int insertMembership(MembershipDTO membership) {
		int result = session.insert("insertMembership", membership);
		return result;
	}

	@Override
	public List<NoticeDTO> getNoticeList(NoticeDTO notice) {
		List<NoticeDTO> noticeList = session.selectList("getNoticeList",notice);
		return noticeList;
	}

	@Override
	public List<NoticeDTO> getNoticeDetail(int notice_id) {
		System.out.println("dao notice_id->"+notice_id);
		List<NoticeDTO> noticeDetail = session.selectList("getNoticeDetail", notice_id);
		return noticeDetail;
	}

	@Override
	public int updateNotice(NoticeDTO notice) {
		int result = session.update("updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(NoticeDTO notice) {
		int result = session.delete("deleteNotice", notice);
		return result;
	}

	@Override
	public int insertNotice(NoticeDTO notice) {
		int result = session.insert("insertNotice", notice);
		return result;
	}

	@Override
	public List<CouponDTO> getCouponList() {
		List<CouponDTO>coupon = session.selectList("getCouponList");
		return coupon;
	}

	@Override
	public List<CouponDTO> getCouponDetail(CouponDTO coupon) {
		List<CouponDTO>couponDetail = session.selectList("getCouponDetail", coupon);
		return couponDetail;
	}

	@Override
	public List<CouponDTO> getCouponMemberDetail(CouponDTO coupon) {
		List<CouponDTO> couponMemberDetail = session.selectList("getCouponMemberDetail", coupon);
		return couponMemberDetail;
	}

	@Override
	public int updateCoupon(CouponDTO coupon) {
		int result = session.update("updateCoupon", coupon);
		return result;
	}

	@Override
	public int deleteCoupon(CouponDTO coupon) {
		int result = session.delete("deleteCoupon", coupon);
		return result;
	}

	@Override
	public int insertCoupon(CouponDTO coupon) {
		int result = session.insert("insertCoupon", coupon);
		return result;
	}

	@Override
	public List<ManageTicketDTO> getTicketList(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketList = session.selectList("getTicketList",ticket);
		return ticketList;
	}

	@Override
	public List<ManageTicketDTO> getTicketDetail(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketDetail = session.selectList("getTicketDetail",ticket);
		return ticketDetail;
	}

	@Override
	public List<ManageTicketDTO> getCountryList() {
		List<ManageTicketDTO> countryList = session.selectList("getCountryList");
		return countryList;
	}

	@Override
	public List<ManageTicketDTO> getCityList(ManageTicketDTO ticket) {
		List<ManageTicketDTO> cityList = session.selectList("getCityList",ticket);
		return cityList;
	}

	@Override
	public List<ManageTicketDTO> getCityListChangeCountry(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketChangeCountry = session.selectList("getCityListChangeCountry", ticket);
		return ticketChangeCountry;
	}

	@Override
	public int updateTicket(ManageTicketDTO ticket) {
		int result = session.update("updateTicket", ticket);
		return result;
	}

	@Override
	public int insertTicket(ManageTicketDTO ticket) {
		int result = session.insert("insertTicket",ticket);
		return result;
	}

	@Override
	public int deleteTicket(ManageTicketDTO ticket) {
		int result = session.delete("deleteTicket",ticket);
		return result;
	}

	@Override
	public int totalTicket() {
		int total = session.selectOne("totalTicket");
		return total;
	}

	@Override
	public int totalNotice() {
		int total = session.selectOne("totalNotice");
		return total;
	}

	@Override
	public int totalPackage() {
		int total = session.selectOne("totalPackage");
		return total;
	}

	@Override
	public List<ManagePackageDTO> getPackageList(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageList = session.selectList("getPackageList", pk);
		return packageList;
	}

	@Override
	public List<ManagePackageDTO> getPackageDetail(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageDetail = session.selectList("getPackageDetail", pk);
		return packageDetail;
	}

	@Override
	public int totalPackageDetail(ManagePackageDTO pk) {
		int total = session.selectOne("totalPackageDetail",pk);
		return total;
	}

	@Override
	public List<ManagePackageDTO> getAttractionList(ManagePackageDTO pk) {
		List<ManagePackageDTO> attractionList = session.selectList("getAttractionList",pk);
		return attractionList;
	}

	@Override
	public int totalAttraction() {
		int total = session.selectOne("totalAttraction");
		return total;
	}

	@Override
	public int insertAttraction(ManagePackageDTO pk) {
		int result = session.insert("insertAttraction",pk);
		return result;
	}

	@Override
	public List<ManagePackageDTO> getAttractionDetail(ManagePackageDTO pk) {
		List<ManagePackageDTO> getAttractionDetail = session.selectList("getAttractionDetail", pk);
		return getAttractionDetail;
	}

	@Override
	public List<ManagePackageDTO> getCityList(ManagePackageDTO pk) {
		List<ManagePackageDTO> cityList = session.selectList("getCityListPk",pk);
		return cityList;
	}

	@Override
	public int updateAttraction(ManagePackageDTO pk) {
		int result = session.update("updateAttraction", pk);
		System.out.println("DAO result->"+result);
		return result;
	}

	@Override
	public int deleteAttraction(ManagePackageDTO pk) {
		int result = session.delete("deleteAttraction", pk);
		return result;
	}

	@Override
	public int insertPackage(ManagePackageDTO pk) {
		int result = session.insert("insertPackage", pk);
		return result;
	}

	@Override
	public List<ManagePackageDTO> getPackageDetailOne(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageDetailOne = session.selectList("getPackageDetailOne", pk);
		return packageDetailOne;
	}

	

}
