package com.oracle.ohTravel.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.manager.model.ManageAirportDTO;
import com.oracle.ohTravel.manager.model.ManageHotelDTO;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.manager.model.ManageTicketDTO;
import com.oracle.ohTravel.manager.model.ManageMemberDTO;
import com.oracle.ohTravel.manager.model.MembershipDTO;
import com.oracle.ohTravel.manager.model.NoticeDTO;

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
	public List<ManageMemberDTO> getMemberList(ManageMemberDTO member) {
		List<ManageMemberDTO>memberList = session.selectList("memberList",member);
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

	@Override
	public List<ManageAirportDTO> getAirScheduleList(ManageAirportDTO air) {
		List<ManageAirportDTO> airScheduleList = session.selectList("getAirScheduleList", air);
		return airScheduleList;
	}

	@Override
	public int totalAirSchedule() {
		int total = session.selectOne("totalAirSchedule");
		return total;
	}

	@Override
	public int totalAirline() {
		int total = session.selectOne("totalAirline");
		return total;
	}

	@Override
	public List<ManageAirportDTO> getAirlineList(ManageAirportDTO air) {
		List<ManageAirportDTO> airlineList = session.selectList("getAirlineList", air);
		return airlineList;
	}

	@Override
	public List<ManageAirportDTO> getAirlineDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> airlineDetail = session.selectList("getAirlineDetail", air);
		return airlineDetail;
	}

	@Override
	public int updateAirline(ManageAirportDTO air) {
		int result = session.update("updateAirline", air);
		return result;
	}

	@Override
	public int insertAirline(ManageAirportDTO air) {
		int result = session.insert("insertAirline", air);
		return result;
	}

	@Override
	public int deleteAirline(ManageAirportDTO air) {
		int result = session.delete("deleteAirline", air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneList(ManageAirportDTO air) {
		List<ManageAirportDTO> airplaneList = session.selectList("getAirplaneList", air);
		return airplaneList;
	}

	@Override
	public int totalAirplane() {
		int total = session.selectOne("totalAirplane");
		return total;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> airplaneDetail = session.selectList("getAirplaneDetail", air);
		return airplaneDetail;
	}

	@Override
	public int updateAirplane(ManageAirportDTO air) {
		int result = session.update("updateAirplane", air);
		return result;
	}

	@Override
	public int deleteAirplane(ManageAirportDTO air) {
		int result = session.delete("deleteAirplane", air);
		return result;
	}

	@Override
	public int insertAirplane(ManageAirportDTO air) {
		int result = session.insert("insertAirplane", air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportList(ManageAirportDTO air) {
		List<ManageAirportDTO> startAirportList = session.selectList("getStartAirportList", air);
		return startAirportList;
	}

	@Override
	public int totalStartAirport() {
		int total = session.selectOne("totalStartAirport");
		return total;
	}

	@Override
	public int insertStartAirport(ManageAirportDTO air) {
		int result = session.insert("insertStartAirport", air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportDetail(ManageAirportDTO air) {
		List<ManageAirportDTO>startAirportDetail = session.selectList("getStartAirportDetail", air);
		return startAirportDetail;
	}

	@Override
	public int updateStartAirport(ManageAirportDTO air) {
		int result = session.update("updateStartAirport", air);
		return result;
	}

	@Override
	public int deletestartAirport(ManageAirportDTO air) {
		int result = session.delete("deleteStartAirport", air);
		return result;
	}

	@Override
	public int totalEndAirport() {
		int total = session.selectOne("totalEndAirport");
		return total;
	}

	@Override
	public List<ManageAirportDTO> getEndAirportList(ManageAirportDTO air) {
		List<ManageAirportDTO> endAirportList = session.selectList("getEndAirportList", air);
		return endAirportList;
	}

	@Override
	public int insertEndAirport(ManageAirportDTO air) {
		int result = session.insert("insertEndAirport", air);
		return result;
	}
	
	@Override
	public List<ManageAirportDTO> getEndAirportDetail(ManageAirportDTO air) {
		List<ManageAirportDTO>endAirportDetail = session.selectList("getEndAirportDetail", air);
		return endAirportDetail;
	}
	
	@Override
	public int updateEndAirport(ManageAirportDTO air) {
		int result = session.update("updateEndAirport", air);
		return result;
	}

	@Override
	public int deleteEndAirport(ManageAirportDTO air) {
		int result = session.delete("deleteEndAirport", air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getSeatList() {
		List<ManageAirportDTO> seatList = session.selectList("getSeatList");
		return seatList;
	}

	@Override
	public List<ManageAirportDTO> getAirlineList() {
		List<ManageAirportDTO> airlineList = session.selectList("getAirlineListAll");
		return airlineList;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneList() {
		List<ManageAirportDTO> airplaneList = session.selectList("getAirplaneListAll");
		return airplaneList;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportList() {
		List<ManageAirportDTO> startAirportList = session.selectList("getStartAirportListAll");
		return startAirportList;
	}

	@Override
	public List<ManageAirportDTO> getEndAirportList() {
		List<ManageAirportDTO> endAirportList = session.selectList("getEndAirportListAll");
		return endAirportList;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneChange(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirplaneChange = session.selectList("getAirplaneChange", air);
		return getAirplaneChange;
	}

	@Override
	public List<ManageAirportDTO> getAirScheduleDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirScheduleDetail = session.selectList("getAirScheduleDetail", air);
		return getAirScheduleDetail;
	}

	@Override
	public int insertAirSchedule(ManageAirportDTO air) {
		int result = session.insert("insertAirSchedule", air);
		return result;
	}

	@Override
	public int deleteAirSchedule(ManageAirportDTO air) {
		int result = session.delete("deleteAirSchedule", air);
		return result;
	}

	@Override
	public int updateAirSchedule(ManageAirportDTO air) {
		int result = session.update("updateAirSchedule", air);
		return result;
	}

	@Override
	public int updateNoticeCount(NoticeDTO notice) {
		int result = session.update("updateNoticeCount", notice);
		return result;
	}

	@Override
	public List<CouponDTO> getMemberCouponList(String sessionId) {
		List<CouponDTO> getMemberCouponList = session.selectList("getMemberCouponList", sessionId);
		return getMemberCouponList;
	}

	@Override
	public int insertMemberCoupon(CouponDTO coupon) {
		int result = session.insert("insertMemberCoupon", coupon);
		return result;
	}

	@Override
	public List<ManageTicketDTO> getTicketResList() {
		List<ManageTicketDTO> getTicketResList = session.selectList("getTicketResList");
		return getTicketResList;
	}

	@Override
	public List<ManageHotelDTO> getHotelResList() {
		List<ManageHotelDTO> getHotelResList = session.selectList("getHotelResList");
		return getHotelResList;
	}

	@Override
	public List<ManagePackageDTO> getPackageResList() {
		List<ManagePackageDTO> getPackageResList = session.selectList("getPackageResList");
		return getPackageResList;
	}

	@Override
	public List<ManagePackageDTO> getPackageResPiList(ManagePackageDTO pk) {
		List<ManagePackageDTO> getPackageResPiList = session.selectList("getPackageResPiList", pk);
		return getPackageResPiList;
	}

	@Override
	public List<ManageAirportDTO> getAirResList() {
		List<ManageAirportDTO> getAirResList = session.selectList("getAirResList");
		return getAirResList;
	}

	@Override
	public List<ManageAirportDTO> getAirResPiList(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirResPiList = session.selectList("getAirResPiList",air);
		return getAirResPiList;
	}

	@Override
	public List<ManageAirportDTO> getAirResScheduleList(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirResScheduleList = session.selectList("getAirResScheduleList", air);
		return getAirResScheduleList;
	}

	@Override
	public int getPackageTotalSale() {
		int getPackageTotalSale = session.selectOne("getPackageTotalSale");
		return getPackageTotalSale;
	}

	@Override
	public List<ManagePackageDTO> getPackageMonth() {
		List<ManagePackageDTO> getPackageMonth = session.selectList("getPackageMonth");
		return getPackageMonth;
	}
	@Override
	public List<ManagePackageDTO> getPackageDay(String month) {
		List<ManagePackageDTO> getPackageDay = session.selectList("getPackageDay",month);
		return getPackageDay;
	}

	@Override
	public int getAirTotalSale() {
		int getAirTotalSale = session.selectOne("getAirTotalSale");
		return getAirTotalSale;
	}

	@Override
	public List<ManageAirportDTO> getAirMonth() {
		List<ManageAirportDTO> getAirMonth = session.selectList("getAirMonth");
		return getAirMonth;
	}

	@Override
	public List<ManageAirportDTO> getAirDay(String month) {
		List<ManageAirportDTO> getAirDay = session.selectList("getAirDay", month);
		return getAirDay;
	}
	
	@Override
	public int getTicketTotalSale() {
		int getTicketTotalSale = session.selectOne("getTicketTotalSale");
		return getTicketTotalSale;
	}
	
	@Override
	public List<ManageTicketDTO> getTicketMonth() {
		List<ManageTicketDTO> getTicketMonth = session.selectList("getTicketMonth");
		return getTicketMonth;
	}

	@Override
	public List<ManageTicketDTO> getTicketDay(String month) {
		List<ManageTicketDTO> getTicketDay = session.selectList("getTicketDay", month);
		return getTicketDay;
	}
	
	@Override
	public int getHotelTotalSale() {
		int getHotelTotalSale = session.selectOne("getHotelTotalSale");
		return getHotelTotalSale;
	}
	
	@Override
	public List<ManageHotelDTO> getHotelMonth() {
		List<ManageHotelDTO> getHotelMonth = session.selectList("getHotelMonth");
		return getHotelMonth;
	}

	@Override
	public List<ManageHotelDTO> getHotelDay(String month) {
		List<ManageHotelDTO> getHotelDay = session.selectList("getHotelDay", month);
		return getHotelDay;
	}
}
