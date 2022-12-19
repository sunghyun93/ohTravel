package com.oracle.ohTravel.manager.service;

import java.util.List;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.manager.model.ManageAirportDTO;
import com.oracle.ohTravel.manager.model.ManageHotelDTO;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.manager.model.ManageTicketDTO;
import com.oracle.ohTravel.manager.model.ManageMemberDTO;
import com.oracle.ohTravel.manager.model.MembershipDTO;
import com.oracle.ohTravel.manager.model.NoticeDTO;
import com.oracle.ohTravel.member.model.TicketReservationDTO;

public interface ManagerService {

	int totalMember();
	
	List<ManageMemberDTO> getMemberList(ManageMemberDTO member);

	List<MembershipDTO> getMembershipList();

	List<MembershipDTO> getUserDetail(String mem_id);

	int updateUserRole(MembershipDTO membership);

	int updateUserMemName(MembershipDTO membership);

	int deleteUser(String mem_id);

	List<MembershipDTO> getMembershipDetail(int membership_id);

	int updateMembership(MembershipDTO membership);

	int deleteMembership(MembershipDTO membership);

	int insertMembership(MembershipDTO membership);

	List<NoticeDTO> getNoticeList(NoticeDTO notice);

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

	List<ManageTicketDTO> getTicketList(ManageTicketDTO ticket);

	List<ManageTicketDTO> getTicketDetail(ManageTicketDTO ticket);

	List<ManageTicketDTO> getCountryList();

	List<ManageTicketDTO> getCityList(ManageTicketDTO ticket);

	List<ManageTicketDTO> getCityListChangeCountry(ManageTicketDTO ticket);

	int updateTicket(ManageTicketDTO ticket);

	int insertTicket(ManageTicketDTO ticket);

	int deleteTicket(ManageTicketDTO ticket);

	int totalTicket();

	int totalNotice();

	int totalPackage();

	List<ManagePackageDTO> getPackageList(ManagePackageDTO pk);

	List<ManagePackageDTO> getPackageDetail(ManagePackageDTO pk);

	int totalPackageDetail(ManagePackageDTO pk);

	List<ManagePackageDTO> getAttractionList(ManagePackageDTO pk);

	int totalAttraction();

	int insertAttraction(ManagePackageDTO pk);

	List<ManagePackageDTO> getAttractionDetail(ManagePackageDTO pk);

	List<ManagePackageDTO> getCityList(ManagePackageDTO pk);

	int updateAttraction(ManagePackageDTO pk);

	int deleteAttraction(ManagePackageDTO pk);

	int insertPackage(ManagePackageDTO pk);

	List<ManagePackageDTO> getPackageDetailOne(ManagePackageDTO pk);

	List<ManageAirportDTO> getAirScheduleList(ManageAirportDTO air);

	int totalAirSchedule();

	int totalAirline();

	List<ManageAirportDTO> getAirlineList(ManageAirportDTO air);

	List<ManageAirportDTO> getAirlineDetail(ManageAirportDTO air);

	int updateAirline(ManageAirportDTO air);

	int insertAirline(ManageAirportDTO air);

	int deleteAirline(ManageAirportDTO air);

	List<ManageAirportDTO> getAirplaneList(ManageAirportDTO air);

	int totalAirplane();

	List<ManageAirportDTO> getAirplaneDetail(ManageAirportDTO air);

	int updateAirplane(ManageAirportDTO air);

	int deleteAirplane(ManageAirportDTO air);

	int insertAirplane(ManageAirportDTO air);

	List<ManageAirportDTO> getStartAirportList(ManageAirportDTO air);

	int totalStartAirport();

	int insertStartAirport(ManageAirportDTO air);

	List<ManageAirportDTO> getStartAirportDetail(ManageAirportDTO air);

	int updateStartAirport(ManageAirportDTO air);

	int deletestartAirport(ManageAirportDTO air);

	int totalEndAirport();

	List<ManageAirportDTO> getEndAirportList(ManageAirportDTO air);

	int insertEndAirport(ManageAirportDTO air);

	List<ManageAirportDTO> getEndAirportDetail(ManageAirportDTO air);

	int updateEndAirport(ManageAirportDTO air);

	int deleteEndAirport(ManageAirportDTO air);

	List<ManageAirportDTO> getSeatList();

	List<ManageAirportDTO> getAirlineList();	//페이징처리 없이 모든 데이터 가져오기

	List<ManageAirportDTO> getAirplaneList();	//페이징처리 없이 모든 데이터 가져오기

	List<ManageAirportDTO> getStartAirportList();	//페이징처리 없이 모든 데이터 가져오기

	List<ManageAirportDTO> getEndAirportList();	//페이징처리 없이 모든 데이터 가져오기

	List<ManageAirportDTO> getAirplaneChange(ManageAirportDTO air);

	List<ManageAirportDTO> getAirScheduleDetail(ManageAirportDTO air);

	int insertAirSchedule(ManageAirportDTO air);

	int deleteAirSchedule(ManageAirportDTO air);

	int updateAirSchedule(ManageAirportDTO air);

	int updateNoticeCount(NoticeDTO notice);

	List<CouponDTO> getMemberCouponList(String sessionId);

	int insertMemberCoupon(CouponDTO coupon);

	List<ManageTicketDTO> getTicketResList();

	List<ManageHotelDTO> getHotelResList();

	List<ManagePackageDTO> getPackageResList();

	List<ManagePackageDTO> getPackageResPiList(ManagePackageDTO pk);

	List<ManageAirportDTO> getAirResList();

	List<ManageAirportDTO> getAirResPiList(ManageAirportDTO air);

	List<ManageAirportDTO> getAirResScheduleList(ManageAirportDTO air);

	int getPackageTotalSale();

	List<ManagePackageDTO> getPackageMonth();

	List<ManagePackageDTO> getPackageDay(String month);

	int getAirTotalSale();

	List<ManageAirportDTO> getAirMonth();

	List<ManageAirportDTO> getAirDay(String month);

	int getTicketTotalSale();

	List<ManageTicketDTO> getTicketMonth();

	List<ManageTicketDTO> getTicketDay(String month);

	int getHotelTotalSale();

	List<ManageHotelDTO> getHotelMonth();

	List<ManageHotelDTO> getHotelDay(String month);

	int totalTicketRes(ManageTicketDTO ticket);

	List<ManageTicketDTO> getTicketResPage(ManageTicketDTO ticket);


	

}
