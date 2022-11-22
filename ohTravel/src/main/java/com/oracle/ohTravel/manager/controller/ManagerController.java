package com.oracle.ohTravel.manager.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.protocol.x.Notice;
import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.TicketDTO;
import com.oracle.ohTravel.manager.service.ManagerService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "manager")
@RequiredArgsConstructor
public class ManagerController {
	
	private final ManagerService service;
	
	//관리자 메인페이지
	@RequestMapping(value = "managerMain")
	public String managerMain(){
		
		return "manager/managerMain";
		
	}
	//회원관리 ->회원관리
	@RequestMapping(value = "manageUser")
	public String manageUser(Model model) {
		List<MemberDTO> member = service.getMemberList();
		model.addAttribute("memberList", member);
		
		return "manager/manageUser";
	}
	//회원관리 -> 회원상세조회(1명)->수정/삭제가능
	@RequestMapping(value = "manageUserDetail")
	public String manageUserDetail(String mem_id,Model model) {
		List<MembershipDTO> userDetail = service.getUserDetail(mem_id);
		List<MembershipDTO> membershipList = service.getMembershipList();
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("membershipList", membershipList);
		
		return "manager/manageUserDetail";
	}
	//회원상세에서 회원수정 누를시 작동
	@RequestMapping(value = "updateUserForm")
	public String updateUserForm(String mem_id, Model model) {
		List<MembershipDTO> userDetail = service.getUserDetail(mem_id);
		List<MembershipDTO> membershipList = service.getMembershipList();
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("membershipList", membershipList);
		
		return "manager/updateUserForm";
	}
	
	//회원정보 수정완료 버튼누를시 작동
	@PostMapping(value = "updateUser")
	public String updateUser(MembershipDTO membership, Model model) {
		int result = service.updateUserRole(membership);
		int result1 = service.updateUserMemName(membership);
		model.addAttribute("updateMsg1", result);
		model.addAttribute("updateMsg2", result1);
		
		return "forward:manageUser";
	}
	//회원탈퇴 버튼 누를시 작동
	@PostMapping(value = "deleteUser")
	public String deleteUser(String mem_id ,Model model) {
		int result = service.deleteUser(mem_id);
		model.addAttribute("deleteMsg1", result);
		
		return "forward:manageUser";
	}
	
	
	//회원관리 ->등급관리
	@RequestMapping(value = "manageMemberShip")
	public String manageMemberShip(Model model) {
		List<MembershipDTO>membershipList = service.getMembershipList();
		model.addAttribute("membershipList", membershipList);
		return "manager/manageMemberShip";
	}
	
	//등급관리 ->상세보기 수정/삭제 가능
	@GetMapping(value = "manageMembershipDetail")
	public String manageMembershipDetail(int membership_id, Model model) {
		List<MembershipDTO> membershipDetail = service.getMembershipDetail(membership_id);
		model.addAttribute("membershipDetail", membershipDetail);
		return "manager/manageMembershipDetail";
	}
	//등급관리 -> 추가페이지이동
	@RequestMapping(value = "insertMembershipForm")
	public String insertMembershipForm(Model model){
		
		return "manager/insertMembershipForm";
	}
	//등급관리 -> 추가 기능실행
	@PostMapping(value = "insertMembership")
	public String insertMembership(MembershipDTO membership, Model model){
		System.out.println("mile ->"+membership.getMembership_mile());
		System.out.println("dis ->"+membership.getMembership_discount());
		int result = service.insertMembership(membership);
		model.addAttribute("insertMembershipMsg1", result);
		return "forward:manageMemberShip";
	}
	
	//등급관리 -> 수정
	@PostMapping(value = "updateMembership")
	public String updateMembership(MembershipDTO membership, Model model) {
		System.out.println("id->"+membership.getMembership_id());
		System.out.println("name->"+membership.getMembership_name());
		System.out.println("mile->"+membership.getMembership_mile());
		System.out.println("discount->"+membership.getMembership_discount());
		int result = service.updateMembership(membership);
		model.addAttribute("updateMembershipMsg1", result);
		return "forward:manageMemberShip";
	}
	//등급관리 -> 삭제
	@PostMapping(value = "deleteMembership")
	public String deleteMembership(MembershipDTO membership, Model model) {
		int result = service.deleteMembership(membership);
		model.addAttribute("deleteMembershipMsg1", result);
		return "forward:manageMemberShip";
	}
	
	//상품관리 ->패키지 관리
	@RequestMapping(value = "managePackage")
	public String manageProduct() {
		
		return "manager/managePackage";
	}
	//상품관리 ->항공권 상품 관리
	@RequestMapping(value = "manageAirline")
	public String manageAirline() {
		
		return "manager/manageAirline";
	}
	//상품관리 ->숙박 상품 관리
	@RequestMapping(value = "manageHotel")
	public String manageHotel() {
		
		return "manager/manageHotel";
	}
	//상품관리 ->입장권 상품 관리
	@RequestMapping(value = "manageTicket")
	public String manageTicket(Model model) {
		List<TicketDTO> ticketList = service.getTicketList();
		model.addAttribute("ticketList", ticketList);
		return "manager/manageTicket";
	}
	//상품관리 ->입장권 상품상세 조회
	@RequestMapping(value = "ticketDetail")
	public String ticketDetail(TicketDTO ticket, Model model) {
		List<TicketDTO>ticketDetail = service.getTicketDetail(ticket);
		ticket.setCity_id(ticketDetail.get(0).getCity_id());
		List<TicketDTO>countryList = service.getCountryList();
		List<TicketDTO>cityList = service.getCityList(ticket);
		System.out.println(ticketDetail.get(0).getCity_id());
		System.out.println("size->"+ticketDetail.size());
		model.addAttribute("ticketDetail", ticketDetail);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		
		return "manager/ticketDetail";
	}
	//상품관리 ->입장권 상세조회중 국가별 도시 셀렉문 Ajax
	
	
	//게시판관리 -> 리뷰관리
	@RequestMapping(value = "manageBoard")
	public String manageBoard() {
		
		return "manager/manageBoard";
	}
	//게시판관리 -> 공지사항관리
	@RequestMapping(value = "manageNotice")
	public String manageNotice(Model model) {
		List<NoticeDTO> notice = service.getNoticeList();
		model.addAttribute("notice", notice);
		
		return "manager/manageNotice";
	}
	//게시판관리 - >공지사항 상세보기
	@RequestMapping(value = "manageNoticeDetail")
	public String noticeDetail(int notice_id ,Model model) {
		System.out.println("Controller noticeDetail id ->" + notice_id);
		List<NoticeDTO> noticeDetail = service.getNoticeDetail(notice_id);
		model.addAttribute("noticeDetail", noticeDetail);
		return "manager/manageNoticeDetail";
	}
	//게시판관리 -> 공지사항 추가 폼으로 이동
	@RequestMapping(value = "insertNoticeForm")
	public String insertNoticeForm() {
		
		return "manager/insertNoticeForm";
	}
	//게시판관리 -> 공지사항 추가 버튼눌렀을때 동작
	@PostMapping(value = "insertNotice")
	public String insertNotice(NoticeDTO notice,Model model) {
		System.out.println("Controller insertNotice id ->"+notice.getNotice_id());
		System.out.println("Controller insertNotice title ->"+notice.getNotice_title());
		System.out.println("Controller insertNotice content ->"+notice.getNotice_content());
		System.out.println("Controller insertNotice writer ->"+notice.getNotice_writer());
		int result = service.insertNotice(notice);
		model.addAttribute("intertNoticeMsg1", result);
		return "forward:manageNotice";
	}
	//게시판관리 -> 공지사항 수정
	@PostMapping(value = "updateNotice")
	public String updateNotice(NoticeDTO notice, Model model) {
		System.out.println("Controller updateNotice id ->"+notice.getNotice_id());
		System.out.println("Controller updateNotice title ->"+notice.getNotice_title());
		System.out.println("Controller updateNotice content ->"+notice.getNotice_content());
		int result = service.updateNotice(notice);
		System.out.println("결과값 ->"+result);
		model.addAttribute("updateNoticeMsg1", result);
		return "forward:manageNotice";
	}
	//게시판관리 -> 공지사항 수정
	@PostMapping(value = "deleteNotice")
	public String deleteNotice(NoticeDTO notice, Model model) {
		System.out.println("Controller updateNotice id ->"+notice.getNotice_id());
		System.out.println("Controller updateNotice title ->"+notice.getNotice_title());
		System.out.println("Controller updateNotice content ->"+notice.getNotice_content());
		int result = service.deleteNotice(notice);
		System.out.println("결과값 ->"+result);
		model.addAttribute("deleteNoticeMsg1", result);
		return "forward:manageNotice";
	}
	
	//매출관리
	@RequestMapping(value = "manageSales")
	public String manageSales() {
		
		return "manager/manageSales";
	}
	//쿠폰관리 ->모든 쿠폰 조회
	@RequestMapping(value = "manageCoupon")
	public String manageCoupon(Model model) {
		List<CouponDTO> coupon = service.getCouponList();
		model.addAttribute("couponList", coupon);
		return "manager/manageCoupon";
	}
	//쿠폰관리 ->쿠폰상세보기
	@RequestMapping(value = "manageCouponDetail")
	public String manageCouponDetail(CouponDTO coupon, Model model) {
		System.out.println("Controller manageCouponDetail id ->"+coupon.getCoupon_id());
		List<CouponDTO> couponDetail = service.getCouponDetail(coupon);
		List<CouponDTO> couponMemberDetail = service.getCouponMemberDetail(coupon);
		System.out.println("size->"+couponDetail.size());
		model.addAttribute("couponDetail", couponDetail);
		model.addAttribute("couponMemberDetail", couponMemberDetail);
		
		return "manager/manageCouponDetail";
	}
	//쿠폰관리 ->쿠폰추가페이지로 이동
	@RequestMapping(value = "insertCouponForm")
	public String insertCouponForm() {
		
		return "manager/insertCouponForm";
	}
	//쿠폰관리 ->쿠폰추가 버튼누를시 동작 진짜 추가
	@RequestMapping(value = "insertCoupon")
	public String insertCoupon(CouponDTO coupon, Model model) {
		System.out.println("Controller insertCoupon name ->"+coupon.getCoupon_name());
		System.out.println("Controller insertCoupon discount ->"+coupon.getCoupon_discount());
		System.out.println("Controller updateCoupon quantity ->"+coupon.getCoupon_quantity());
		int result = service.insertCoupon(coupon);
		model.addAttribute("insertCouponMsg1", result);
		return "forward:manageCoupon";
	}
	//쿠폰관리 ->쿠폰수정
	@RequestMapping(value = "updateCoupon")
	public String updateCoupon(CouponDTO coupon, Model model) {
		System.out.println("Controller updateCoupon id ->"+coupon.getCoupon_id());
		System.out.println("Controller updateCoupon name ->"+coupon.getCoupon_name());
		System.out.println("Controller updateCoupon discount ->"+coupon.getCoupon_discount());
		System.out.println("Controller updateCoupon date ->"+coupon.getCoupon_date());
		System.out.println("Controller updateCoupon quantity ->"+coupon.getCoupon_quantity());
		int result = service.updateCoupon(coupon);
		model.addAttribute("updateCouponMsg1", result);
		return "forward:manageCoupon";
	}
	//쿠폰관리 -> 쿠폰 삭제
	@PostMapping(value = "deleteCoupon")
	public String deleteCoupon(CouponDTO coupon, Model model) {
		int result = service.deleteCoupon(coupon);
		model.addAttribute("deleteCouponMsg1", result);
		return "forward:manageCoupon";
	}
	//예약관리
	@RequestMapping(value = "manageReservation")
	public String manageReservation() {
		
		return "manager/manageReservation";
	}
}
