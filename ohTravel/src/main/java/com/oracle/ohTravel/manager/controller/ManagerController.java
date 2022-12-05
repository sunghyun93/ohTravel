package com.oracle.ohTravel.manager.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.springframework.boot.autoconfigure.web.ServerProperties.Tomcat.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.ohTravel.manager.dto.CouponDTO;
import com.oracle.ohTravel.manager.dto.MemberDTO;
import com.oracle.ohTravel.manager.dto.MembershipDTO;
import com.oracle.ohTravel.manager.dto.NoticeDTO;
import com.oracle.ohTravel.manager.dto.ManagePackageDTO;
import com.oracle.ohTravel.manager.dto.PagingManager;
import com.oracle.ohTravel.manager.dto.ManageTicketDTO;
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
	public String manageUser(MemberDTO member, String currentPage ,Model model) {
		int total = service.totalMember();
		PagingManager page = new PagingManager(total, currentPage);
		member.setStart(page.getStart());
		member.setEnd(page.getEnd());
		System.out.println("pa-"+page.getStart());
		System.out.println("pa-"+page.getPageBlock());
		List<MemberDTO> memberList = service.getMemberList(member);
		model.addAttribute("memberList", memberList);
		model.addAttribute("page", page);
		
		
		return "manager/manageUser";
	}
	//회원관리 -> 회원상세조회(1명)->수정/삭제가능
	@RequestMapping(value = "manageUserDetail")
	public String manageUserDetail(String mem_id,String currentPage, Model model) {
		List<MembershipDTO> userDetail = service.getUserDetail(mem_id);
		List<MembershipDTO> membershipList = service.getMembershipList();
		model.addAttribute("currentPage", currentPage);
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
		int result1 = service.updateUserMemName(membership);
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
	public String managePackage(ManagePackageDTO pk,String currentPage, Model model) {
		int total = service.totalPackage();
		PagingManager page = new PagingManager(total, currentPage);
		pk.setStart(page.getStart());
		pk.setEnd(page.getEnd());
		List<ManagePackageDTO> packageList = service.getPackageList(pk);
		model.addAttribute("packageList", packageList);
		model.addAttribute("page", page);
		
		return "manager/managePackage";
	}
	//상품관리 ->패키지 상세 보기
	@RequestMapping(value = "managePackageDetail")
	public String managePackageDetail(ManagePackageDTO pk,String pkage_id, String currentPage, Model model) {
		List<ManagePackageDTO> packageDetail = service.getPackageDetail(pk);
		model.addAttribute("pkage_id", pk.getPkage_id());
		model.addAttribute("packageDetail", packageDetail);
		model.addAttribute("currentPage", currentPage);
		return "manager/managePackageDetail";
	}
	//상품관리 ->패키지 상세 추가하기 form으로 이동
	@RequestMapping(value = "insertPackageForm")
	public String insertPackageForm(ManagePackageDTO pk, Model model) {
		model.addAttribute("pk", pk);
		return "manager/insertPackageForm";
	}
	//상품관리 ->패키지 상세 추가하기
	@PostMapping(value = "insertPackage")
	public String insertPackage(ManagePackageDTO pk, Model model) {
		System.out.println("meet ->"+pk.getPkage_dt_meetDate());
		System.out.println("start ->"+pk.getPkage_dt_startDay());
		System.out.println("end ->"+pk.getPkage_dt_endDay());
		System.out.println("pkage_id->"+pk.getPkage_id());
		int result = service.insertPackage(pk);
		model.addAttribute("result", result);
		return "redirect:managePackageDetail?pkage_id="+pk.getPkage_id();
	}
	
	//상품관리 -> 패키지 한개 상세보기
	@RequestMapping(value = "managePackageDetailOne")
	public String managePackageDetailOne(ManagePackageDTO pk,String pkage_id, Model model) {
		List<ManagePackageDTO> packageDetailOne = service.getPackageDetailOne(pk);
		model.addAttribute("packageDetailOne", packageDetailOne);
		model.addAttribute("pkage_id", pkage_id);
		return "manager/managePackageDetailOne";
	}
	
	//상품관리 -> 패키지 관광지 관리
	@RequestMapping(value = "manageAttraction")
	public String manageAttraction(ManagePackageDTO pk,String currentPage, Model model) {
		int total = service.totalAttraction();
		System.out.println("total->"+total);
		PagingManager page = new PagingManager(total, currentPage);
		pk.setStart(page.getStart());
		pk.setEnd(page.getEnd());
		List<ManagePackageDTO> attractionList = service.getAttractionList(pk);
		System.out.println("size->"+attractionList.size());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("attractionList",attractionList);
		model.addAttribute("page", page);
		return "manager/manageAttraction";
	}
	//상품관리 ->패키지 관광지 상세보기
	@RequestMapping(value = "manageAttractionDetail")
	public String manageAttractionDetail(ManagePackageDTO pk, String currentPage, Model model) {
		List<ManagePackageDTO> attractionDetail = service.getAttractionDetail(pk);
		pk.setCity_id(attractionDetail.get(0).getCity_id());
		model.addAttribute("attractionDetail", attractionDetail);
		List<ManageTicketDTO> countryList = service.getCountryList();
		List<ManagePackageDTO>cityList = service.getCityList(pk);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		return "manager/manageAttractionDetail";
	}
	//상품관리 ->패키지 관광지 수정
	@PostMapping(value = "updateAttraction")
	public String updateAttraction(ManagePackageDTO pk,@RequestParam(value = "file1")MultipartFile file1, Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/pkage/");
		if(!file1.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String fileName= file1.getOriginalFilename();
			String uuFileName = uuid.toString()+"_"+file1.getOriginalFilename();
			System.out.println("fileName=->"+fileName);
			File saveFile = new File(path,uuFileName);
			if (!saveFile.getParentFile().exists())
				saveFile.getParentFile().mkdirs();
			System.out.println(saveFile);
			System.out.println("오냐??");
			try {
				file1.transferTo(saveFile);
				System.out.println("와?");
				System.out.println("path->"+path);
				System.out.println("uuid->"+uuid);
				System.out.println("fileName->"+fileName);
				pk.setAttr_Img_path("/img/pkage/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			System.out.println("file1 없어용~");
			System.out.println("2"+pk.getAttr_id());
			System.out.println("3"+pk.getAttr_Img_code());
			pk.setAttr_Img_path(service.getAttractionDetail(pk).get(0).getAttr_Img_path());
			System.out.println("empty attr_img_path"+pk.getAttr_Img_path());
		}
		
		System.out.println("2"+pk.getAttr_id());
		System.out.println("3"+pk.getAttr_Img_code());
		int result = service.updateAttraction(pk);
		System.out.println("result->"+result);
		model.addAttribute("updateAttractionMsg1", result);
		return "forward:manageAttraction";
	}
	
	@PostMapping(value = "deleteAttraction")
	public String deleteAttraction(ManagePackageDTO pk, Model model) {
		int result = service.deleteAttraction(pk);
		model.addAttribute("deleteAttractionMsg1", result);
		return "forward:manageAttraction";
	}
	
	
	//상품관리 -> 패키지 관광지 추가form으로 이동
	@RequestMapping(value = "insertAttractionForm")
	public String insertAttractionForm(Model model) {
		List<ManageTicketDTO> countryList = service.getCountryList();
		model.addAttribute("countryList", countryList);
		return "manager/insertAttractionForm";
	}
	//상품관리 -> 패키지 관광지 추가
	@RequestMapping(value = "insertAttraction")
	public String insertAttraction(ManagePackageDTO pk,@RequestParam(value = "file1") MultipartFile file1, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/img/pkage/");
		
		System.out.println("realpath->"+path);
		
		//String path = "C:\\Users\\zest_\\Desktop\\ohTravel\\ohTravel\\src\\main\\resources\\static\\img\\ticket";
		String fileName = "";
		
		UUID uuid = UUID.randomUUID();
		fileName= file1.getOriginalFilename();
		String uuFileName = uuid.toString()+"_"+file1.getOriginalFilename();
		System.out.println("fileName=->"+fileName);
		File saveFile = new File(path,uuFileName);
		if (!saveFile.getParentFile().exists())
			saveFile.getParentFile().mkdirs();
		System.out.println(saveFile);
		System.out.println("오냐??");
		try {
			file1.transferTo(saveFile);
			System.out.println("와?");
			System.out.println("path->"+path);
			System.out.println("uuid->"+uuid);
			System.out.println("fileName->"+fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pk.setAttr_Img_path("/img/pkage/"+uuFileName);
		System.out.println("child->"+pk.getAttr_Img_path());
		
		int result = service.insertAttraction(pk);
		model.addAttribute("insertAttractionMsg1", result);
		return "forward:manageAttraction";
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
	public String manageTicket(ManageTicketDTO ticket,String currentPage, Model model) {
		int total = service.totalTicket();
		PagingManager page = new PagingManager(total, currentPage);
		ticket.setStart(page.getStart());
		ticket.setEnd(page.getEnd());
		System.out.println("pa-"+page.getStart());
		System.out.println("pa-"+page.getPageBlock());
		List<ManageTicketDTO> ticketList = service.getTicketList(ticket);
		model.addAttribute("ticketList", ticketList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("page", page);
		
		return "manager/manageTicket";
	}
	//상품관리 ->입장권 상품상세 조회
	@RequestMapping(value = "manageTicketDetail")
	public String ticketDetail(ManageTicketDTO ticket,String currentPage, Model model) {
		List<ManageTicketDTO>ticketDetail = service.getTicketDetail(ticket);
		ticket.setCity_id(ticketDetail.get(0).getCity_id());
		List<ManageTicketDTO>countryList = service.getCountryList();
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		System.out.println(ticketDetail.get(0).getCity_id());
		System.out.println("size->"+ticketDetail.size());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("ticketDetail", ticketDetail);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		
		return "manager/manageTicketDetail";
	}
	//상품관리 ->입장권 상세조회중 국가별 도시 셀렉문 Ajax
	@ResponseBody
	@RequestMapping(value = "changeCountry")
	public List<ManageTicketDTO> changeCountry(ManageTicketDTO ticket) {
		System.out.println("country_id-->"+ticket.getCountry_id());
		
		List<ManageTicketDTO> ticketChangeCountry = service.getCityListChangeCountry(ticket);
		return ticketChangeCountry;
	}
	//상품관리 ->입장권 추가하는 페이지로 이동
	@RequestMapping(value = "insertTicketForm")
	public String insertTicketForm(ManageTicketDTO ticket, Model model) {
		List<ManageTicketDTO> countryList = service.getCountryList();
		model.addAttribute("countryList", countryList);
		return "manager/insertTicketForm";
	}
	//상품관리 -> 입장권 추가요
	@PostMapping(value = "insertTicket")
	public String insertTicket(ManageTicketDTO ticket, List<MultipartFile> file1,Model model, HttpServletRequest request){
		String path = request.getServletContext().getRealPath("/img/ticket/");
		
		System.out.println("realpath->"+path);
		
		//String path = "C:\\Users\\zest_\\Desktop\\ohTravel\\ohTravel\\src\\main\\resources\\static\\img\\ticket";
		String fileName = "";
		List<String> nameList = new ArrayList<String>();
		for(MultipartFile file : file1) {
			UUID uuid = UUID.randomUUID();
			fileName= file.getOriginalFilename();
			String uuFileName = uuid.toString()+"_"+file.getOriginalFilename();
			System.out.println("fileName=->"+fileName);
			File saveFile = new File(path,uuFileName);
			if (!saveFile.getParentFile().exists())
				saveFile.getParentFile().mkdirs();
			System.out.println(saveFile);
			System.out.println("오냐??");
			try {
				file.transferTo(saveFile);
				System.out.println("와?");
				System.out.println("path->"+path);
				System.out.println("uuid->"+uuid);
				System.out.println("fileName->"+fileName);
				nameList.add(uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ticket.setTicket_rep_img_path("/img/ticket/"+nameList.get(0));
		ticket.setTicket_detail_img_path("/img/ticket/"+nameList.get(1));
		System.out.println("child->"+ticket.getTicket_child_price());
		System.out.println("path1 ->"+ticket.getTicket_rep_img_path());
		System.out.println("path2 ->"+ticket.getTicket_detail_img_path());
		int result = service.insertTicket(ticket);
		model.addAttribute("insertTicketMsg1", result);
		return "forward:manageTicket";
	}
	
	//상품관리 -> 입장권 수정하기
	@PostMapping(value = "updateTicket")
	public String updateTicket(ManageTicketDTO ticket,@RequestParam(value = "file1") MultipartFile file1,@RequestParam(value = "file2")MultipartFile file2, Model model, HttpServletRequest request) {
		System.out.println("file1.getOriginalFilename() ->"+file1.getOriginalFilename());
		System.out.println("file2.getOriginalFilename() ->"+file2.getOriginalFilename());
		String path = request.getServletContext().getRealPath("/img/ticket/");
		//String path = "C:\\Users\\zest_\\Desktop\\ohTravel\\ohTravel\\src\\main\\resources\\static\\img\\ticket";
		if(!file1.isEmpty()) {
			System.out.println("file1 없어용~");
			UUID uuid = UUID.randomUUID();
			String fileName= file1.getOriginalFilename();
			String uuFileName = uuid.toString()+"_"+file1.getOriginalFilename();
			System.out.println("fileName=->"+fileName);
			File saveFile = new File(path,uuFileName);
			if (!saveFile.getParentFile().exists())
				saveFile.getParentFile().mkdirs();
			System.out.println(saveFile);
			System.out.println("오냐??");
			try {
				file1.transferTo(saveFile);
				System.out.println("와?");
				System.out.println("path->"+path);
				System.out.println("uuid->"+uuid);
				System.out.println("fileName->"+fileName);
				ticket.setTicket_rep_img_path("/img/ticket/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			ticket.setTicket_rep_img_path(service.getTicketDetail(ticket).get(0).getTicket_rep_img_path());
			System.out.println("empty rep path"+ticket.getTicket_rep_img_path());
		}
		if(!file2.isEmpty()) {
			System.out.println("file2 있다어요");
			UUID uuid = UUID.randomUUID();
			String fileName= file2.getOriginalFilename();
			String uuFileName = uuid.toString()+"_"+file2.getOriginalFilename();
			System.out.println("fileName=->"+fileName);
			File saveFile = new File(path,uuFileName);
			if (!saveFile.getParentFile().exists())
				saveFile.getParentFile().mkdirs();
			System.out.println(saveFile);
			System.out.println("오냐??");
			try {
				file1.transferTo(saveFile);
				System.out.println("와?");
				System.out.println("path2->"+path);
				System.out.println("uuid2->"+uuid);
				System.out.println("fileName2->"+fileName);
				ticket.setTicket_detail_img_path("/img/ticket/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file2.isEmpty()) {
			ticket.setTicket_detail_img_path(service.getTicketDetail(ticket).get(0).getTicket_detail_img_path());
			System.out.println("empty detail path"+ticket.getTicket_detail_img_path());
		}
		int result = service.updateTicket(ticket);
		model.addAttribute("updateTicketMsg1", result);
		return "forward:manageTicket";
	}
	
	//상품관리 -> 입장권 삭제하기
	@PostMapping(value = "deleteTicket")
	public String deleteTicket(ManageTicketDTO ticket, Model model) {
		int result = service.deleteTicket(ticket);
		model.addAttribute("deleteTicketMsg1", result);
		return "forward:manageTicket";
	}
	
	//게시판관리 -> 리뷰관리
	@RequestMapping(value = "manageBoard")
	public String manageBoard() {
		
		return "manager/manageBoard";
	}
	//게시판관리 -> 공지사항관리
	@RequestMapping(value = "manageNotice")
	public String manageNotice(NoticeDTO notice, String currentPage, Model model) {
		int total = service.totalNotice();
		PagingManager page = new PagingManager(total, currentPage);
		notice.setStart(page.getStart());
		notice.setEnd(page.getEnd());
		List<NoticeDTO> noticeList = service.getNoticeList(notice);
		model.addAttribute("notice", noticeList);
		model.addAttribute("totalEmp", total);
		model.addAttribute("page", page);
		
		return "manager/manageNotice";
	}
	//게시판관리 - >공지사항 상세보기
	@RequestMapping(value = "manageNoticeDetail")
	public String noticeDetail(int notice_id ,String currentPage, Model model) {
		System.out.println("Controller noticeDetail id ->" + notice_id);
		List<NoticeDTO> noticeDetail = service.getNoticeDetail(notice_id);
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("currentPage", currentPage);
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
