package com.oracle.ohTravel.manager.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.service.ManagerService;

import lombok.RequiredArgsConstructor;

@Controller
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
	//등급관리 -> 추가
	@RequestMapping(value = "insertMembershipForm")
	public String insertMembershipForm(Model model){
		
		return "manager/insertMembership";
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
	public String manageTicket() {
		
		return "manager/manageTicket";
	}
	
	//게시판관리 -> 리뷰관리
	@RequestMapping(value = "manageBoard")
	public String manageBoard() {
		
		return "manager/manageBoard";
	}
	//게시판관리 -> 공지사항관리
	@RequestMapping(value = "manageNotice")
	public String manageNotice() {
		
		return "manager/manageNotice";
	}
	//매출관리
	@RequestMapping(value = "manageSales")
	public String manageSales() {
		
		return "manager/manageSales";
	}
	//쿠폰관리
	@RequestMapping(value = "manageCoupon")
	public String manageCoupon() {
		
		return "manager/manageCoupon";
	}
	//예약관리
	@RequestMapping(value = "manageReservation")
	public String manageReservation() {
		
		return "manager/manageReservation";
	}
}
