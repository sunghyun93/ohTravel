package com.oracle.ohTravel.manager.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.ManagePackageDTO;
import com.oracle.ohTravel.manager.dto.ManageTicketDTO;

public interface ManagerService {

	int totalMember();
	
	List<MemberDTO> getMemberList(MemberDTO member);

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

	

}
