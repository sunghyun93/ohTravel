package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.ohTravel.manager.dao.ManagerDAO;
import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.manager.model.ManageAirportDTO;
import com.oracle.ohTravel.manager.model.ManageHotelDTO;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.manager.model.ManageTicketDTO;
import com.oracle.ohTravel.manager.model.ManageMemberDTO;
import com.oracle.ohTravel.manager.model.MembershipDTO;
import com.oracle.ohTravel.manager.model.NoticeDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

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
	public List<ManageMemberDTO> getMemberList(ManageMemberDTO member) {
		List<ManageMemberDTO>memberList = dao.getMemberList(member);
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
	public List<ManagePackageDTO> getAttractionList(ManagePackageDTO pk) {
		List<ManagePackageDTO> attractionList = dao.getAttractionList(pk);
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

	@Override
	public int deleteAttraction(ManagePackageDTO pk) {
		int result = dao.deleteAttraction(pk);
		return result;
	}

	@Override
	public int insertPackage(ManagePackageDTO pk) {
		int result = dao.insertPackage(pk);
		return result;
	}

	@Override
	public List<ManagePackageDTO> getPackageDetailOne(ManagePackageDTO pk) {
		List<ManagePackageDTO> packageDetailOne = dao.getPackageDetailOne(pk);
		return packageDetailOne;
	}

	@Override
	public List<ManageAirportDTO> getAirScheduleList(ManageAirportDTO air) {
		List<ManageAirportDTO> airSchduleList = dao.getAirScheduleList(air);
		return airSchduleList;
	}

	@Override
	public int totalAirSchedule() {
		int total = dao.totalAirSchedule();
		return total;
	}

	@Override
	public int totalAirline() {
		int total = dao.totalAirline();
		return total;
	}

	@Override
	public List<ManageAirportDTO> getAirlineList(ManageAirportDTO air) {
		List<ManageAirportDTO> airlineList = dao.getAirlineList(air);
		return airlineList;
	}

	@Override
	public List<ManageAirportDTO> getAirlineDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> airlineDetail = dao.getAirlineDetail(air);
		return airlineDetail;
	}

	@Override
	public int updateAirline(ManageAirportDTO air) {
		int result = dao.updateAirline(air);
		return result;
	}

	@Override
	public int insertAirline(ManageAirportDTO air) {
		int result = dao.insertAirline(air);
		return result;
	}

	@Override
	public int deleteAirline(ManageAirportDTO air) {
		int result = dao.deleteAirline(air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneList(ManageAirportDTO air) {
		List<ManageAirportDTO> airplaneList = dao.getAirplaneList(air);
		return airplaneList;
	}

	@Override
	public int totalAirplane() {
		int total = dao.totalAirplane();
		return total;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> airplaneDetail = dao.getAirplaneDetail(air);
		return airplaneDetail;
	}

	@Override
	public int updateAirplane(ManageAirportDTO air) {
		int result = dao.updateAirplane(air);
		return result;
	}

	@Override
	public int deleteAirplane(ManageAirportDTO air) {
		int result = dao.deleteAirplane(air);
		return result;
	}

	@Override
	public int insertAirplane(ManageAirportDTO air) {
		int result =dao.insertAirplane(air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportList(ManageAirportDTO air) {
		List<ManageAirportDTO> startAirportList = dao.getStartAirportList(air);
		return startAirportList;
	}

	@Override
	public int totalStartAirport() {
		int total = dao.totalStartAirport();
		return total;
	}

	@Override
	public int insertStartAirport(ManageAirportDTO air) {
		int result = dao.insertStartAirport(air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> startAirportDetail = dao.getStartAirportDetail(air);
		return startAirportDetail;
	}

	@Override
	public int updateStartAirport(ManageAirportDTO air) {
		int result = dao.updateStartAirport(air);
		return result;
	}

	@Override
	public int deletestartAirport(ManageAirportDTO air) {
		int result = dao.deletestartAirport(air);
		return result;
	}

	@Override
	public int totalEndAirport() {
		int total = dao.totalEndAirport();
		return total;
	}
	
	@Override
	public List<ManageAirportDTO> getEndAirportList(ManageAirportDTO air) {
		List<ManageAirportDTO> endAirportList = dao.getEndAirportList(air);
		return endAirportList;
	}

	@Override
	public int insertEndAirport(ManageAirportDTO air) {
		int result = dao.insertEndAirport(air);
		return result;
	}
	
	@Override
	public List<ManageAirportDTO> getEndAirportDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> endAirportDetail = dao.getEndAirportDetail(air);
		return endAirportDetail;
	}
	
	@Override
	public int updateEndAirport(ManageAirportDTO air) {
		int result = dao.updateEndAirport(air);
		return result;
	}

	@Override
	public int deleteEndAirport(ManageAirportDTO air) {
		int result = dao.deleteEndAirport(air);
		return result;
	}

	@Override
	public List<ManageAirportDTO> getSeatList() {
		List<ManageAirportDTO> seatList = dao.getSeatList();
		return seatList;
	}

	@Override
	public List<ManageAirportDTO> getAirlineList() {
		List<ManageAirportDTO> airlineList = dao.getAirlineList();
		return airlineList;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneList() {
		List<ManageAirportDTO> airplaneList = dao.getAirplaneList();
		return airplaneList;
	}

	@Override
	public List<ManageAirportDTO> getStartAirportList() {
		List<ManageAirportDTO> startAirportList = dao.getStartAirportList();
		return startAirportList;
	}

	@Override
	public List<ManageAirportDTO> getEndAirportList() {
		List<ManageAirportDTO> endAirportList = dao.getEndAirportList();
		return endAirportList;
	}

	@Override
	public List<ManageAirportDTO> getAirplaneChange(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirplaneChange = dao.getAirplaneChange(air);
		return getAirplaneChange;
	}

	@Override
	public List<ManageAirportDTO> getAirScheduleDetail(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirScheduleDetail = dao.getAirScheduleDetail(air);
		return getAirScheduleDetail;
	}

	@Override
	public int insertAirSchedule(ManageAirportDTO air) {
		int result = dao.insertAirSchedule(air);
		return result;
	}

	@Override
	public int deleteAirSchedule(ManageAirportDTO air) {
		int result = dao.deleteAirSchedule(air);
		return result;
	}

	@Override
	public int updateAirSchedule(ManageAirportDTO air) {
		int result = dao.updateAirSchedule(air);
		return result;
	}

	@Override
	public int updateNoticeCount(NoticeDTO notice) {
		int result = dao.updateNoticeCount(notice);
		return result;
	}

	@Override
	public List<CouponDTO> getMemberCouponList(String sessionId) {
		List<CouponDTO>getMemberCouponList = dao.getMemberCouponList(sessionId);
		return getMemberCouponList;
	}

	@Override
	public int insertMemberCoupon(CouponDTO coupon) {
		int result = dao.insertMemberCoupon(coupon);
		return result;
	}

	@Override
	public List<ManageTicketDTO> getTicketResList() {
		List<ManageTicketDTO> getTicketResList = dao.getTicketResList();
		return getTicketResList;
	}

	@Override
	public List<ManageHotelDTO> getHotelResList() {
		List<ManageHotelDTO> getHotelResList = dao.getHotelResList();
		return getHotelResList;
	}

	@Override
	public List<ManagePackageDTO> getPackageResList() {
		List<ManagePackageDTO> getPackageResList = dao.getPackageResList();
		return getPackageResList;
	}

	@Override
	public List<ManagePackageDTO> getPackageResPiList(ManagePackageDTO pk) {
		List<ManagePackageDTO> getPackageResPiList = dao.getPackageResPiList(pk);
		return getPackageResPiList;
	}

	@Override
	public List<ManageAirportDTO> getAirResList() {
		List<ManageAirportDTO> getAirResList = dao.getAirResList();
		return getAirResList;
	}

	@Override
	public List<ManageAirportDTO> getAirResPiList(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirResPiList = dao.getAirResPiList(air);
		return getAirResPiList;
	}

	@Override
	public List<ManageAirportDTO> getAirResScheduleList(ManageAirportDTO air) {
		List<ManageAirportDTO> getAirResScheduleList = dao.getAirResScheduleList(air);
		return getAirResScheduleList;
	}

	@Override
	public int getPackageTotalSale() {
		int getPackageTotalSale = dao.getPackageTotalSale();
		return getPackageTotalSale;
	}

	@Override
	public List<ManagePackageDTO> getPackageMonth() {
		List<ManagePackageDTO> getPackageMonth = dao.getPackageMonth();
		return getPackageMonth;
	}
	@Override
	public List<ManagePackageDTO> getPackageDay(String month) {
		List<ManagePackageDTO> getPackageDay = dao.getPackageDay(month);
		return getPackageDay;
	}

	@Override
	public int getAirTotalSale() {
		int getAirTotalSale = dao.getAirTotalSale();
		return getAirTotalSale;
	}

	@Override
	public List<ManageAirportDTO> getAirMonth() {
		List<ManageAirportDTO> getAirMonth = dao.getAirMonth();
		return getAirMonth;
	}

	@Override
	public List<ManageAirportDTO> getAirDay(String month) {
		List<ManageAirportDTO> getAirDay = dao.getAirDay(month);
		return getAirDay;
	}
	
	@Override
	public int getTicketTotalSale() {
		int getTicketTotalSale = dao.getTicketTotalSale();
		return getTicketTotalSale;
	}
	
	@Override
	public List<ManageTicketDTO> getTicketMonth() {
		List<ManageTicketDTO> getTicketMonth = dao.getTicketMonth();
		return getTicketMonth;
	}

	@Override
	public List<ManageTicketDTO> getTicketDay(String month) {
		List<ManageTicketDTO> getTicketDay = dao.getTicketDay(month);
		return getTicketDay;
	}
	
	@Override
	public int getHotelTotalSale() {
		int getHotelTotalSale = dao.getHotelTotalSale();
		return getHotelTotalSale;
	}
	@Override
	public List<ManageHotelDTO> getHotelMonth() {
		List<ManageHotelDTO> getHotelMonth = dao.getHotelMonth();
		return getHotelMonth;
	}

	@Override
	public List<ManageHotelDTO> getHotelDay(String month) {
		List<ManageHotelDTO> getHotelDay = dao.getHotelDay(month);
		return getHotelDay;
	}

	@Override
	public int totalTicketRes(ManageTicketDTO ticket) {
		int total = dao.totalTicketRes(ticket);
		return total;
	}

	@Override
	public List<ManageTicketDTO> getTicketResPage(ManageTicketDTO ticket) {
		List<ManageTicketDTO> ticketRes = dao.getTicketResPage(ticket);
		return ticketRes;
	}
}
