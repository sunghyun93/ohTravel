package com.oracle.ohTravel.manager.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.ohTravel.manager.model.CouponDTO;
import com.oracle.ohTravel.manager.model.ManageAirportDTO;
import com.oracle.ohTravel.manager.model.ManageHotelDTO;
import com.oracle.ohTravel.manager.model.ManageMemberDTO;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.manager.model.ManageTicketDTO;
import com.oracle.ohTravel.manager.model.MembershipDTO;
import com.oracle.ohTravel.manager.model.NoticeDTO;
import com.oracle.ohTravel.manager.model.PagingManager;
import com.oracle.ohTravel.manager.service.ManageHotelService;
import com.oracle.ohTravel.manager.service.ManagerService;
import com.oracle.ohTravel.member.model.AirReservationDetail;
import com.oracle.ohTravel.member.model.MemberDTO;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "manager")
@RequiredArgsConstructor
public class ManagerController {
	
	private final ManagerService service;
	private final ManageHotelService hotelService;
	//관리자 메인페이지
	@RequestMapping(value = "managerMain")
	public String managerMain(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("member")==null) {
			return "redirect:/member/loginForm";
		}else {
			MemberDTO member = (MemberDTO) session.getAttribute("member");
			String user_id = member.getMem_id();
			if(!user_id.equals("admin")) {
				return "redirect:/";
			}
			
		}
		return "manager/managerMain";
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 회원관리 관련////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//회원관리 ->회원관리
	@RequestMapping(value = "manageUser")
	public String manageUser(ManageMemberDTO member, String currentPage ,Model model) {
		int total = service.totalMember();
		PagingManager page = new PagingManager(total, currentPage);
		member.setStart(page.getStart());
		member.setEnd(page.getEnd());
		System.out.println("pa-"+page.getStart());
		System.out.println("pa-"+page.getPageBlock());
		List<ManageMemberDTO> memberList = service.getMemberList(member);
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
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 회원등급 관련////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 패키지 관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	public String insertPackageForm(Pkage_detailDTO pk, Model model) {
		model.addAttribute("pk", pk);
		return "manager/insertPackageForm";
	}
	//상품관리 ->패키지 상세 추가하기
	@PostMapping(value = "insertPackage1")
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
	@RequestMapping(value = "managePackageDetailOne1")
	public String managePackageDetailOne(ManagePackageDTO pk,String currentPage, String pkage_id, Model model) {
		List<ManagePackageDTO> packageDetailOne = service.getPackageDetailOne(pk);
		model.addAttribute("packageDetailOne", packageDetailOne);
		model.addAttribute("pkage_id", pkage_id);
		model.addAttribute("currentPage", currentPage);
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
	@PostMapping(value = "insertAttraction")
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
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 항공권관련//////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//상품관리 ->항공권 상품 관리
	@RequestMapping(value = "manageAir")
	public String manageAir(ManageAirportDTO air,String currentPage,Model model) {
		int total = service.totalAirSchedule();
		PagingManager page = new PagingManager(total, currentPage);
		air.setStart(page.getStart());
		air.setEnd(page.getEnd());
		List<ManageAirportDTO> airScheduleList = service.getAirScheduleList(air);
		model.addAttribute("AirScheduleList", airScheduleList);
		model.addAttribute("page", page);
		return "manager/manageAir";
	}
	
	//상품관리 - > 항공권 상품관리 ->일정 상세조회
	@RequestMapping(value = "manageAirScheduleDetail")
	public String manageAirScheduleDetail(ManageAirportDTO air, String currentPage, Model model) {
		List<ManageAirportDTO> airScheduleDetail = service.getAirScheduleDetail(air);
		List<ManageAirportDTO> getAirlineList = service.getAirlineList();
		List<ManageAirportDTO> getAirplaneList = service.getAirplaneList();
		List<ManageAirportDTO> getStartAirportList = service.getStartAirportList();
		List<ManageAirportDTO> getEndAirportList = service.getEndAirportList();
		List<ManageAirportDTO> getSeatList = service.getSeatList();
		model.addAttribute("airScheduleDetail", airScheduleDetail);
		model.addAttribute("airlineList", getAirlineList);
		model.addAttribute("airplaneList", getAirplaneList);
		model.addAttribute("startAirportList", getStartAirportList);
		model.addAttribute("endAirportList", getEndAirportList);
		model.addAttribute("seatList", getSeatList);
		model.addAttribute("currentPage", currentPage);
		
		return "manager/manageAirScheduleDetail";
	}
	

	//상품관리 -> 항공권 -> 항공사관리
	@RequestMapping(value = "manageAirline")
	public String manageAirline(ManageAirportDTO air, String currentPage, Model model) {
		int total = service.totalAirline();
		PagingManager page = new PagingManager(total, currentPage);
		air.setStart(page.getStart());
		air.setEnd(page.getEnd());
		List<ManageAirportDTO> airlineList = service.getAirlineList(air);
		System.out.println(airlineList.size());
		model.addAttribute("airlineList", airlineList);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", currentPage);
		return "manager/manageAirline";
	}
	//상품관리 -> 항공권 ->항공사관리 상세보기
	@RequestMapping(value = "manageAirlineDetail")
	public String manageAirlineDetail(ManageAirportDTO air,Model model) {
		List<ManageAirportDTO> airlineDetail = service.getAirlineDetail(air);
		model.addAttribute("airlineDetail", airlineDetail);
		return "manager/manageAirlineDetail";
	}
	//상품관리 -> 항공권 -> 항공사 수정하기
	@PostMapping(value = "updateAirline")
	public String updateAirline(ManageAirportDTO air,@RequestParam(value = "file1")MultipartFile file1, Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/air/");
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
				air.setAir_picture("/img/air/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			System.out.println("file1 없어용~");
			System.out.println("2"+air.getAir_num());
			System.out.println("3"+air.getAir_name());
			air.setAir_picture(service.getAirlineDetail(air).get(0).getAir_picture());
			System.out.println("empty getAir_picture"+air.getAir_picture());
		}
		
		System.out.println("2"+air.getAir_num());
		System.out.println("3"+air.getAir_name());
		int result = service.updateAirline(air);
		System.out.println("result->"+result);
		model.addAttribute("updateAirlineMsg1", result);
		return "redirect:manageAirline";
	}
	//상품관리 -> 항공권 -> 항공사 추가하기로 이동
	@RequestMapping(value = "insertAirlineForm")
	public String insertAirlineForm() {
		
		return "manager/insertAirlineForm";
	}
	//상품관리 -> 항공권 -> 항공사 추가하기 실행
	@PostMapping(value = "insertAirline")
	public String insertAirline(ManageAirportDTO air, @RequestParam(value = "file1") MultipartFile file1, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/img/air/");
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
		air.setAir_picture("/img/air/"+uuFileName);
		System.out.println("child->"+air.getAir_picture());
		
		int result = service.insertAirline(air);
		model.addAttribute("insertAirlineMsg1", result);
		return "redirect:manageAirline";
	}
	//상품관리 -> 항공권 -> 항공사 삭제하기 Ajax로
	@ResponseBody
	@PostMapping(value = "deleteAirline")
	public int deleteAirline(ManageAirportDTO air) {
		System.out.println("air_num-->"+air.getAir_num());
		int result = service.deleteAirline(air);
		return result;
	}
	
	//상품관리 -> 항공권 -> 비행기 관리
	@RequestMapping(value = "manageAirplane")
	public String manageAirplane(ManageAirportDTO air,String currentPage,Model model) {
		int total = service.totalAirplane();
		PagingManager page = new PagingManager(total, currentPage);
		air.setStart(page.getStart());
		air.setEnd(page.getEnd());
		List<ManageAirportDTO> airplaneList = service.getAirplaneList(air);
		System.out.println(airplaneList.size());
		model.addAttribute("airplaneList", airplaneList);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", currentPage);
		return "manager/manageAirplane";
	}
	
	//상품관리 -> 항공권 ->비행기관리 상세보기
	@RequestMapping(value = "manageAirplaneDetail")
	public String manageAirplaneDetail(ManageAirportDTO air,Model model) {
		List<ManageAirportDTO> airplaneDetail = service.getAirplaneDetail(air);
		model.addAttribute("airplaneDetail", airplaneDetail);
		return "manager/manageAirplaneDetail";
	}
	//상품관리 -> 항공권 ->비행기 수정하기 Ajax
	@ResponseBody
	@PostMapping(value = "updateAirplane")
	public int updateAirplane(ManageAirportDTO air) {
		int result = service.updateAirplane(air);
		System.out.println(result);
		return result;
	}
	//상품관리 -> 항공권 ->비행기 삭제하기 Ajax
	@ResponseBody
	@PostMapping(value = "deleteAirplane")
	public int deleteAirplane(ManageAirportDTO air) {
		int result = service.deleteAirplane(air);
		
		return result;
	}
	//상품관리 -> 항공권 ->비행기 추가하기 Form으로 이동
	@RequestMapping(value = "insertAirplaneForm")
	public String insertAirplaneForm() {
		
		return "manager/insertAirplaneForm";
	}
	//상품관리 -> 항공권 ->비행기 추가하기 실행k Ajax
	@ResponseBody
	@RequestMapping(value = "insertAirplane")
	public int insertAirplane(ManageAirportDTO air) {
		int result = service.insertAirplane(air);

		return result;
	}
	

	//상품관리 -> 항공권 -> 출발공항 관리
	@RequestMapping(value = "manageStartAirport")
	public String manageStartAirport(ManageAirportDTO air,String currentPage,Model model) {
		int total = service.totalStartAirport();
		PagingManager page = new PagingManager(total, currentPage);
		air.setStart(page.getStart());
		air.setEnd(page.getEnd());
		List<ManageAirportDTO> startAirportList = service.getStartAirportList(air);
		System.out.println(startAirportList.size());
		model.addAttribute("startAirportList", startAirportList);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", currentPage);
		return "manager/manageStartAirport";
	}
	//상품관리 -> 항공권 -> 출발공항 추가 Form으로 이동
	@RequestMapping(value = "insertStartAirportForm")
	public String insertStartAirportForm(ManageTicketDTO ticket ,Model model) {
		List<ManageTicketDTO>countryList = service.getCountryList();
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		return "manager/insertStartAirportForm";
	}
	//상품관리 -> 항공권 -> 출발공항 추가 실행 Ajax
	@ResponseBody
	@PostMapping(value = "insertStartAirport")
	public int insertStartAirport(ManageAirportDTO air) {
		System.out.println("name->"+air.getStart_airport_name());
		System.out.println("country->"+air.getCountry_id());
		System.out.println("city ->"+air.getCity_id());
		int result = service.insertStartAirport(air);
		return result;
	}
	//상품관리 -> 항공권 ->출발공항 상세보기
	@RequestMapping(value = "manageStartAirportDetail")
	public String manageStartAirportDetail(ManageTicketDTO ticket,ManageAirportDTO air, Model model) {
		List<ManageAirportDTO> startAirportDetail = service.getStartAirportDetail(air);
		ticket.setCity_id(startAirportDetail.get(0).getCity_id());
		List<ManageTicketDTO>countryList = service.getCountryList();
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		model.addAttribute("startAirportDetail", startAirportDetail);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		return "manager/manageStartAirportDetail";
	}
	//상품관리 -> 항공권 -> 출발공항 수정
	@ResponseBody
	@PostMapping(value = "updateStartAirport")
	public int updatestartAirport(ManageAirportDTO air) {
		int result = service.updateStartAirport(air);
		return result;
	}
	//상품관리 -> 항공권 -> 출발공항 삭제
	@ResponseBody
	@PostMapping(value = "deleteStartAirport")
	public int deletestartAirport(ManageAirportDTO air) {
		int result = service.deletestartAirport(air);
		return result;
	}
	
	
	//상품관리 -> 항공권 -> 도착공항 관리
	@RequestMapping(value = "manageEndAirport")
	public String manageEndAirport(ManageAirportDTO air,String currentPage,Model model) {
		int total = service.totalEndAirport();
		PagingManager page = new PagingManager(total, currentPage);
		air.setStart(page.getStart());
		air.setEnd(page.getEnd());
		List<ManageAirportDTO> endAirportList = service.getEndAirportList(air);
		System.out.println(endAirportList.size());
		model.addAttribute("endAirportList", endAirportList);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", currentPage);
		return "manager/manageEndAirport";
	}
	//상품관리 -> 항공권 -> 도착공항 추가 Form으로 이동
	@RequestMapping(value = "insertEndAirportForm")
	public String insertEndAirportForm(ManageTicketDTO ticket ,Model model) {
		List<ManageTicketDTO>countryList = service.getCountryList();
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		return "manager/insertEndAirportForm";
	}
	//상품관리 -> 항공권 -> 도착공항 추가 실행 Ajax
	@ResponseBody
	@PostMapping(value = "insertEndAirport")
	public int insertEndAirport(ManageAirportDTO air) {
		System.out.println("name->"+air.getStart_airport_name());
		System.out.println("country->"+air.getCountry_id());
		System.out.println("city ->"+air.getCity_id());
		int result = service.insertEndAirport(air);
		return result;
	}
	//상품관리 -> 항공권 ->도착공항 상세보기
	@RequestMapping(value = "manageEndAirportDetail")
	public String manageEndAirportDetail(ManageTicketDTO ticket,ManageAirportDTO air, Model model) {
		List<ManageAirportDTO> endAirportDetail = service.getEndAirportDetail(air);
		ticket.setCity_id(endAirportDetail.get(0).getCity_id());
		List<ManageTicketDTO>countryList = service.getCountryList();
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		model.addAttribute("endAirportDetail", endAirportDetail);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		return "manager/manageEndAirportDetail";
	}
	//상품관리 -> 항공권 -> 도착공항 수정
	@ResponseBody
	@PostMapping(value = "updateEndAirport")
	public int updateEndAirport(ManageAirportDTO air) {
		int result = service.updateEndAirport(air);
		return result;
	}
	//상품관리 -> 항공권 -> 도착공항 삭제
	@ResponseBody
	@PostMapping(value = "deleteEndAirport")
	public int deleteEndAirport(ManageAirportDTO air) {
		int result = service.deleteEndAirport(air);
		return result;
	}
	
	//상품관리 -> 항공권 -> 좌석 관리
	@RequestMapping(value = "manageSeat")
	public String manageSeat(Model model) {
		List<ManageAirportDTO> seatList = service.getSeatList();
		model.addAttribute("seatList", seatList);
		return "manager/manageSeat";
	}
	//상품관리 -> 항공권 -> 일정 추가 Form 으로 이동
	@RequestMapping(value = "insertAirScheduleForm")
	public String insertAirSchedule(ManageAirportDTO air, Model model) {
		List<ManageAirportDTO> getAirlineList = service.getAirlineList();
		List<ManageAirportDTO> getAirplaneList = service.getAirplaneList();
		List<ManageAirportDTO> getStartAirportList = service.getStartAirportList();
		List<ManageAirportDTO> getEndAirportList = service.getEndAirportList();
		List<ManageAirportDTO> getSeatList = service.getSeatList();
		model.addAttribute("airlineList", getAirlineList);
		model.addAttribute("airplaneList", getAirplaneList);
		model.addAttribute("startAirportList", getStartAirportList);
		model.addAttribute("endAirportList", getEndAirportList);
		model.addAttribute("seatList", getSeatList);
		return "manager/insertAirScheduleForm";
	}
	//상품관리 -> 항공권 -> 일정추가 실행
	@ResponseBody
	@PostMapping(value = "insertAirSchedule")
	public int insertAirSchedule(ManageAirportDTO air) {
		int result = 0;
		result = service.insertAirSchedule(air);
		return result;
	}
	
	//상품관리 -> 항공권 -> 일정 삭제
	@ResponseBody
	@PostMapping(value = "deleteAirSchedule")
	public int deleteAirSchedule(ManageAirportDTO air) {
		int result = service.deleteAirSchedule(air);
		return result;
	}
	//상품관리 -> 항공권 -> 일정 삭제
	@ResponseBody
	@PostMapping(value = "updateAirSchedule")
	public int updateAirSchedule(ManageAirportDTO air) {
		int result = service.updateAirSchedule(air);
		return result;
	}
	
	//상품관리 ->항공권 항공사마다 항공기 달라지는 셀렉문 Ajax
	@ResponseBody
	@RequestMapping(value = "changeAirline")
	public List<ManageAirportDTO> changeAirline(ManageAirportDTO air) {
		System.out.println("getAir_num-->"+air.getAir_num());
		
		List<ManageAirportDTO> airlineChangenum = service.getAirplaneChange(air);
		System.out.println(airlineChangenum.size());
		return airlineChangenum;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 호텔 관련//////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//상품관리 ->숙박 상품 관리
	@RequestMapping(value = "manageHotel")
	public String manageHotel(ManageHotelDTO hotel, String currentPage, Model model) {
		int total = hotelService.totalHotel();
		PagingManager page = new PagingManager(total, currentPage);
		hotel.setStart(page.getStart());
		hotel.setEnd(page.getEnd());
		List<ManageHotelDTO> hotelList = hotelService.getHotelList(hotel);
		model.addAttribute("hotelList", hotelList);
		if(currentPage == "" || currentPage == null) {
			currentPage = "1";
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("page", page);
		return "manager/manageHotel";
	}
	//상품관리 -> 숙박상품관리 -> 업체 상세보기
	@RequestMapping(value = "manageHotelDetail")
	public String manageHotelDetail(ManageTicketDTO ticket,ManageHotelDTO hotel, String currentPage, Model model) {
		List<ManageHotelDTO> hotelDetail = hotelService.getHotelDetail(hotel);
		List<ManageTicketDTO>countryList = service.getCountryList();
		ticket.setCity_id(hotelDetail.get(0).getCity_id());
		List<ManageTicketDTO>cityList = service.getCityList(ticket);
		List<ManageHotelDTO> hotelOptionList = hotelService.getHotelOptionList(hotel);
		System.out.println("hotelOptionList size ->"+hotelOptionList.size());
		model.addAttribute("hotelOptionList", hotelOptionList);
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityList", cityList);
		model.addAttribute("hotelDetail", hotelDetail);
		model.addAttribute("hotel_id", hotelDetail.get(0).getHotel_id());
		System.out.println("currentPage->"+currentPage);
		model.addAttribute("currentPage", currentPage);
		return "manager/manageHotelDetail";
		
	}
	//상품관리 -> 숙박상품관리 -> 업체상세보기 -> 옵션변경 Ajax
	@ResponseBody
	@PostMapping(value = "changeHotelOption")
	public int changeHotelOption(ManageHotelDTO hotel, Model model) {
		System.out.println("controller hotel.getHotel_exist ->"+hotel.getHotel_exist());
		int result = hotelService.updateHotelOptionAjax(hotel);
		return result;
	}
	//상품관리 -> 숙박상품관리 -> 업체상세보기 -> 호텔수정
	@PostMapping(value = "updateHotel")
	public String updateHotel(ManageHotelDTO hotel, @RequestParam(value = "file1") MultipartFile file1,HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/img/hotel/");
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
				hotel.setH_img_path("/img/hotel/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			System.out.println("file1 없어용~");
			System.out.println("2"+hotel.getHotel_id());
			hotel.setH_img_path(hotelService.getHotelDetail(hotel).get(0).getH_img_path());
			System.out.println("empty getH_img_path"+hotel.getH_img_path());
		}
		System.out.println("hotel img path ->"+hotel.getH_img_path());
		int result = hotelService.updateHotel(hotel);
		System.out.println("update result ->"+ result);
		return "forward:manageHotel";
	}
	//상품관리 -> 숙박상품관리 -> 호텔추가 폼으로 이동
	@RequestMapping(value = "insertHotelForm")
	public String insertHotelForm(Model model) {
		List<ManageTicketDTO>countryList = service.getCountryList();
		model.addAttribute("countryList", countryList);
		return "manager/insertHotelForm";
	}
	//상품관리 -> 숙박상품관리 -> 호텔추가 실행
	@PostMapping(value = "insertHotel")
	public String insertHotel(ManageHotelDTO hotel,@RequestParam(value = "file1") MultipartFile file1,HttpServletRequest request,Model model) {

		if(hotel.getWifi() == null) {
			hotel.setWifi("N");
		}
		if(hotel.getSmoke() == null) {
			hotel.setSmoke("N");
		}
		if(hotel.getRestaurant() == null) {
			hotel.setRestaurant("N");
		}
		if(hotel.getParking() == null) {
			hotel.setParking("N");
		}
		if(hotel.getShopping() == null) {
			hotel.setShopping("N");
		}
		if(hotel.getCharging_station() == null) {
			hotel.setCharging_station("N");
		}
		if(hotel.getBath() == null) {
			hotel.setBath("N");
		}
		if(hotel.getCoffee() == null) {
			hotel.setCoffee("N");
		}
		if(hotel.getRoomservice() == null) {
			hotel.setRoomservice("N");
		}
		if(hotel.getDisabled() == null) {
			hotel.setDisabled("N");
		}
		if(hotel.getBalcony() == null) {
			hotel.setBalcony("N");
		}
		if(hotel.getSafe() == null) {
			hotel.setSafe("N");
		}
		String[] array = {hotel.getWifi(),hotel.getRestaurant(),hotel.getParking(),hotel.getShopping(),hotel.getBath(),hotel.getCoffee(),hotel.getRoomservice(),hotel.getDisabled(),hotel.getBalcony(),hotel.getSafe()};
		hotel.setOptionArray(array);
		System.out.println("grade - >"+hotel.getHotel_grade());
		System.out.println("type ->"+hotel.getHotel_type());
		if(file1.isEmpty()) {
			hotel.setH_img_path("");
		}else {
			String path = request.getServletContext().getRealPath("/img/hotel/");
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
			hotel.setH_img_path("/img/hotel/"+uuFileName);
			System.out.println("child->"+hotel.getH_img_path());
			
		}
		
		
		int result = hotelService.insertHotel(hotel);
		System.out.println("insert result ->"+result);
		model.addAttribute("insertMsg", result);
		return "forward:manageHotel";
	}
	
	//상품관리 -> 숙박상품관리 -> 삭제 실행 Ajax
	@ResponseBody
	@PostMapping(value = "deleteHotel")
	public int deleteHotel(ManageHotelDTO hotel){
		
		int result = hotelService.deleteHotel(hotel);
		System.out.println("delete hotel result - >"+result);
		return result;
	}
	//상품관리 -> 숙박상품관리 -> 호텔상세 -> 객실보기
	@RequestMapping(value = "manageRoom")
	public String manageRoom(ManageHotelDTO hotel,String hotel_id,String currentPage, Model model) {
		List<ManageHotelDTO> roomList = hotelService.getRoomList(hotel);
		model.addAttribute("roomList", roomList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("hotel_id", hotel_id);
		
		return "manager/manageRoom";
	}
	//상품관리 -> 숙박상품관리 -> 호텔상세 -> 객실보기 -> 객실별 detail정보 가져오는 Ajax
	@ResponseBody
	@PostMapping(value = "getRoomDetail")
	public Map<String, Object> getRoomDetail(ManageHotelDTO hotel,String currentPage, Model model){
		Map<String, Object> mapRoomDetail = new HashMap<String, Object>();
		int total = hotelService.totalroomDetail(hotel);
		PagingManager page = new PagingManager(total, currentPage);
		hotel.setStart(page.getStart());
		hotel.setEnd(page.getEnd());
		
		List<ManageHotelDTO> roomDetail = hotelService.getRoomDetail(hotel);
		
		mapRoomDetail.put("roomDetail", roomDetail);
		mapRoomDetail.put("currentPage", currentPage);
		mapRoomDetail.put("page", page);
		mapRoomDetail.put("total", total);

		System.out.println("roomDetail.size->"+roomDetail.size());
		return mapRoomDetail;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실별 detail정보 페이징처리 Ajax
	@ResponseBody
	@RequestMapping(value = "pagingDetail")
	public Map<String, Object> pagingDetail(ManageHotelDTO hotel, String currentPage){
		Map<String, Object> mapRoomDetail = new HashMap<String, Object>();
		int total = hotelService.totalroomDetail(hotel);
		PagingManager page = new PagingManager(total, currentPage);
		hotel.setStart(page.getStart());
		hotel.setEnd(page.getEnd());
		List<ManageHotelDTO> roomDetail = hotelService.getRoomDetail(hotel);
		mapRoomDetail.put("roomDetail", roomDetail);
		mapRoomDetail.put("currentPage", currentPage);
		mapRoomDetail.put("page", page);
		mapRoomDetail.put("total", total);
		return mapRoomDetail;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실별 detail정보 이미지 파일 수정 Ajax
	@ResponseBody
	@PostMapping(value = "updateRoomImg")
	public int updateRoomImg(ManageHotelDTO hotel,@RequestParam("file1") MultipartFile file1,HttpServletRequest request) {
		int result = 0;
		System.out.println("room_id ->"+hotel.getRoom_id());
		System.out.println("r_img_id ->"+hotel.getR_img_id());
		String path = request.getServletContext().getRealPath("/img/hotel/");
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
				hotel.setR_img_path("/img/hotel/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			System.out.println("file1 없어용~");
			System.out.println("2"+hotel.getHotel_id());
			hotel.setR_img_path(hotelService.getHotelDetail(hotel).get(0).getR_img_path());
			System.out.println("empty getAir_picture"+hotel.getR_img_path());
		}
		if(hotel.getR_img_id()==0) {
			result = hotelService.insertRoomImg(hotel);
		}else {
			result = hotelService.updateRoomImg(hotel);
		}
		
		
		return result;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실상세 수정 Ajax
	@ResponseBody
	@PostMapping(value = "updateDetailRoom")
	public int updateDetailRoom(ManageHotelDTO hotel) {
		int result = hotelService.updateDetailRoom(hotel);
		return result;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실상세 섹제 Ajax
	@ResponseBody
	@PostMapping(value = "deleteDetailRoom")
	public int deleteDetailRoom(ManageHotelDTO hotel) {
		int result = hotelService.deleteDetailRoom(hotel);
		return result;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실삭제 Ajax
	@ResponseBody
	@PostMapping(value = "deleteRoom")
	public int deleteRoom(ManageHotelDTO hotel) {
		System.out.println("deleteRoom room_id->"+hotel.getRoom_id());
		int result = hotelService.deleteRoom(hotel);
		return result;
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실추가 폼으로 이동
	@RequestMapping(value = "insertRoomForm")
	public String insertRoomForm(ManageHotelDTO hotel,String currentPage,Model model) {
		System.out.println("insertRoomForm hotel_id ->"+hotel.getHotel_id());
		model.addAttribute("hotel_id", hotel.getHotel_id());
		model.addAttribute("currentPage", currentPage);
		return "manager/insertRoomForm";
	}
	//상품관리 -> 숙박상품관리 ->호텔상세 ->객실보기 ->객실 추가 실행 Ajax
	@ResponseBody
	@PostMapping(value = "insertRoom")
	public int insertRoom(ManageHotelDTO hotel,@RequestParam("file1") MultipartFile file1,HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/img/hotel/");
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
				hotel.setR_img_path("/img/hotel/"+uuFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(file1.isEmpty()) {
			System.out.println("file1 없어용~");
			System.out.println("2"+hotel.getHotel_id());
			hotel.setR_img_path(hotelService.getHotelDetail(hotel).get(0).getR_img_path());
			System.out.println("empty getAir_picture"+hotel.getR_img_path());
		}
		System.out.println("insertRoom hotel_id ->"+hotel.getHotel_id());
		System.out.println("insertRoom room_type ->"+hotel.getRoom_type());
		System.out.println("insertRoom room_name ->"+hotel.getRoom_name());
		System.out.println("insertRoom room_per ->"+hotel.getRoom_per());
		int r_img_id = hotelService.getInsertRoom_id();
		hotel.setR_img_id(r_img_id);
		System.out.println("insertRoom room_id ->"+hotel.getR_img_id());
		int room_detail_id = hotelService.getInsertRoom_detail_id();
		hotel.setRoom_detail_id(room_detail_id);
		System.out.println("insertRoom room_detail_id ->"+hotel.getRoom_detail_id());
		int result = hotelService.insertRoom(hotel);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "getNextRoom_detail_id")
	public int getNextRoom_detail_id() {
		int result = hotelService.getInsertRoom_detail_id();
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "insertRoomDetail")
	public int insertRoomDetail(ManageHotelDTO hotel) {
		int result = hotelService.insertRoomDetail(hotel);
		return result;
	}
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 입장권관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
		System.out.println("due_date ->"+ticket.getTicket_due_date());
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
		System.out.println("updateTicket due date - >"+ticket.getTicket_due_date());
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
				e.printStackTrace();
			} catch (IOException e) {
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
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 게시판관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 메인페이지 공지사항 탭 관련//////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@GetMapping(value = "goNotice")
	public String goNotice(NoticeDTO notice,String currentPage, Model model) {
		int total = service.totalNotice();
		PagingManager page = new PagingManager(total, currentPage);
		notice.setStart(page.getStart());
		notice.setEnd(page.getEnd());
		List<NoticeDTO> noticeList = service.getNoticeList(notice);
		model.addAttribute("notice", noticeList);
		model.addAttribute("totalEmp", total);
		model.addAttribute("page", page);
		return "manager/goNotice";
	}
	
	@ResponseBody
	@PostMapping(value = "updateNoticeCount")
	public int updateNoticeCount(NoticeDTO notice) {
		int result = service.updateNoticeCount(notice);
		return result;
	}
	@GetMapping(value = "goNoticeDetail")
	public String goNoticeDetail(NoticeDTO notice, String currentPage,Model model) {
		System.out.println("notice_id->"+notice.getNotice_id());
		List<NoticeDTO> noticeDetail = service.getNoticeDetail(notice.getNotice_id());
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("currentPage", currentPage);
		return "manager/goNoticeDetail";
	}
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 매출관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//매출관리
	@RequestMapping(value = "manageSales")
	public String manageSales() {
		
		return "manager/manageSales";
	}
	
	@ResponseBody
	@PostMapping(value = "getPackageTotalSale")
	public int getPackageTotalSale() {
		int getPackageTotalSale = service.getPackageTotalSale();
		return getPackageTotalSale;
	}
	@ResponseBody
	@PostMapping(value = "changePackageChart")
	public Map<String, Object> changePackageChart(String str, String month){
		Map<String, Object> item = new HashMap<String, Object>();
		
		if(str.equals("packageMonth")) {
			item.clear();
			List<ManagePackageDTO> getPackageMonth = service.getPackageMonth();
			String[] date = new String[getPackageMonth.size()];
			int[] tprice = new int[getPackageMonth.size()];
			System.out.println(getPackageMonth.size());
			
			for(int i=0; i<getPackageMonth.size(); i++) {
				date[i] = getPackageMonth.get(i).getPkage_rv_date();
				tprice[i] = getPackageMonth.get(i).getPkage_rv_tprice();
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}else if(str.equals("packageDay")) {
			item.clear();
			List<ManagePackageDTO> getPackageDay = service.getPackageDay(month);
			System.out.println("month->"+month);
			String[] date = new String[getPackageDay.size()];
			int[] tprice = new int[getPackageDay.size()];
			System.out.println(getPackageDay.size());
			
			for(int i=0; i<getPackageDay.size(); i++) {
				date[i] = getPackageDay.get(i).getPkage_rv_date();
				tprice[i] = getPackageDay.get(i).getPkage_rv_tprice();
				System.out.println("date ->"+date[i]);
				System.out.println("tprice ->"+tprice[i]);
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}
		System.out.println("오냐?");
		return item;
	}
	
	////////////////////////////////////////항권공 매출관련////////////////////////////////////////
	@ResponseBody
	@PostMapping(value = "getAirTotalSale")
	public int getAirTotalSale() {
		int getAirTotalSale = service.getAirTotalSale();
		return getAirTotalSale;
	}
	
	@ResponseBody
	@PostMapping(value = "changeAirChart")
	public Map<String, Object> changeAirChart(String str, String month){
		Map<String, Object> item = new HashMap<String, Object>();
		
		if(str.equals("airMonth")) {
			item.clear();
			List<ManageAirportDTO> getAirMonth = service.getAirMonth();
			String[] date = new String[getAirMonth.size()];
			int[] tprice = new int[getAirMonth.size()];
			System.out.println(getAirMonth.size());
			
			for(int i=0; i<getAirMonth.size(); i++) {
				date[i] = getAirMonth.get(i).getReservation_date();
				tprice[i] = getAirMonth.get(i).getReservation_price();
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}else if(str.equals("airDay")) {
			item.clear();
			List<ManageAirportDTO> getAirDay = service.getAirDay(month);
			System.out.println("month->"+month);
			String[] date = new String[getAirDay.size()];
			int[] tprice = new int[getAirDay.size()];
			System.out.println(getAirDay.size());
			
			for(int i=0; i<getAirDay.size(); i++) {
				date[i] = getAirDay.get(i).getReservation_date();
				tprice[i] = getAirDay.get(i).getReservation_price();
				System.out.println("date ->"+date[i]);
				System.out.println("tprice ->"+tprice[i]);
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}
		System.out.println("오냐?");
		return item;
	}
	
	////////////////////////////////////////숙박 매출관련////////////////////////////////////////
	
	@ResponseBody
	@PostMapping(value = "getHotelTotalSale")
	public int getHotelTotalSale() {
		int getHotelTotalSale = service.getHotelTotalSale();
		return getHotelTotalSale;
	}
	
	@ResponseBody
	@PostMapping(value = "changeHotelChart")
	public Map<String, Object> changeHotelChart(String str, String month){
		Map<String, Object> item = new HashMap<String, Object>();
		
		if(str.equals("hotelMonth")) {
			item.clear();
			List<ManageHotelDTO> getHotelMonth = service.getHotelMonth();
			String[] date = new String[getHotelMonth.size()];
			int[] tprice = new int[getHotelMonth.size()];
			System.out.println(getHotelMonth.size());
			
			for(int i=0; i<getHotelMonth.size(); i++) {
				date[i] = getHotelMonth.get(i).getRev_date();
				tprice[i] = getHotelMonth.get(i).getRev_tot_price();
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}else if(str.equals("hotelDay")) {
			item.clear();
			List<ManageHotelDTO> getHotelDay = service.getHotelDay(month);
			System.out.println("month->"+month);
			String[] date = new String[getHotelDay.size()];
			int[] tprice = new int[getHotelDay.size()];
			System.out.println(getHotelDay.size());
			
			for(int i=0; i<getHotelDay.size(); i++) {
				date[i] = getHotelDay.get(i).getRev_date();
				tprice[i] = getHotelDay.get(i).getRev_tot_price();
				System.out.println("date ->"+date[i]); 
				System.out.println("tprice ->"+tprice[i]);
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}
		System.out.println("오냐?");
		return item;
	}
	
	
	////////////////////////////////////////입장권 매출관련////////////////////////////////////////
	@ResponseBody
	@PostMapping(value = "getTicketTotalSale")
	public int getTicketTotalSale() {
		int getTicketTotalSale = service.getTicketTotalSale();
		return getTicketTotalSale;
	}
	
	@ResponseBody
	@PostMapping(value = "changeTicketChart")
	public Map<String, Object> changeTicketChart(String str, String month){
		Map<String, Object> item = new HashMap<String, Object>();
		
		if(str.equals("ticketMonth")) {
			item.clear();
			List<ManageTicketDTO> getTicketMonth = service.getTicketMonth();
			String[] date = new String[getTicketMonth.size()];
			int[] tprice = new int[getTicketMonth.size()];
			System.out.println(getTicketMonth.size());
			
			for(int i=0; i<getTicketMonth.size(); i++) {
				date[i] = getTicketMonth.get(i).getTicket_puchase_date();
				tprice[i] = getTicketMonth.get(i).getTicket_total_price();
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}else if(str.equals("ticketDay")) {
			item.clear();
			List<ManageTicketDTO> getTicketMonth = service.getTicketDay(month);
			System.out.println("month->"+month);
			String[] date = new String[getTicketMonth.size()];
			int[] tprice = new int[getTicketMonth.size()];
			System.out.println(getTicketMonth.size());
			
			for(int i=0; i<getTicketMonth.size(); i++) {
				date[i] = getTicketMonth.get(i).getTicket_puchase_date();
				tprice[i] = getTicketMonth.get(i).getTicket_total_price();
				System.out.println("date ->"+date[i]);
				System.out.println("tprice ->"+tprice[i]);
			}
			item.put("date", date);
			item.put("tprice", tprice);
		}
		System.out.println("오냐?");
		return item;
	}
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 쿠폰관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	
	//메인페이지에서 쿠폰다운로드 페이지 열기
	@RequestMapping(value = "goCoupon")
	public String goCoupon(MemberDTO memberDTO,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		
		// 로그인 안 했을 때 로그인 페이지로 이동
		if (session.getAttribute("member")==null) {
			return "redirect:/member/loginForm";
		}
		// session에 로그인 된 아이디 정보
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String sessionId = member.getMem_id();
		System.out.println("MemberController myPageReservPackage sessionId -> " + sessionId );
		List<CouponDTO> getMemCouponList = service.getMemberCouponList(sessionId);
		
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("getMemCouponList", getMemCouponList);
		
		return "empty/userCouponDown";
	}
	
	@ResponseBody
	@PostMapping(value = "insertMemCoupon")
	public int insertMemCoupon(CouponDTO coupon) {
		int result = service.insertMemberCoupon(coupon);
		return result;
	}
	
	
	
	

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////아래 예약 관련//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//예약관리
	@RequestMapping(value = "manageReservation")
	public String manageReservation() {
		
		return "manager/manageReservation";
	}
	//예약관리 -> 패키지 리스트 가져오기 Ajax
//	@RequestMapping(value = "getPackageList")
//	public List<ManagePackageDTO> getPackageList(){
//		List<ManagePackageDTO> getPackageList =
//	}
	
	
	//예약관리 -> 패키지 예약 리스트 가져오기 Ajax
	@ResponseBody
	@PostMapping(value = "getPackageResList")
	public List<ManagePackageDTO> getPackageResList(){
		List<ManagePackageDTO> getPackageResList = service.getPackageResList();
		return getPackageResList;
	}
	
	//예약관리 -> 패키지 예약인원 리스트 가져오기 Ajax
	@ResponseBody
	@PostMapping(value = "getPackageResPiList")
	public List<ManagePackageDTO> getPackageResPiList(ManagePackageDTO pk){
		List<ManagePackageDTO> getPackageResPiList = service.getPackageResPiList(pk);
		return getPackageResPiList;
	}
	
	@ResponseBody
	@PostMapping(value = "getAirResList")
	public List<AirReservationDetail> getAirResList(){
		List<AirReservationDetail> getAirResList = service.getAirResList();
		return getAirResList;
	}
	
	@ResponseBody
	@PostMapping(value = "getAirResPiList")
	public List<ManageAirportDTO> getAirResPiList(ManageAirportDTO air){
		List<ManageAirportDTO> getAirResPiList = service.getAirResPiList(air);
		return getAirResPiList;
	}
	
	@ResponseBody
	@PostMapping(value = "getAirResScheduleList")
	public List<ManageAirportDTO> getAirResScheduleList(ManageAirportDTO air){
		System.out.println("ㅇㅇ"+air.getReservation_id());
		List<ManageAirportDTO> getAirResScheduleList = service.getAirResScheduleList(air);
		return getAirResScheduleList;
	}
	
	
	
	//예약관리 -> 숙박 예약 리스트 가져오기 Ajax
	@ResponseBody
	@PostMapping(value = "getHotelResList")
	public List<ManageHotelDTO> getHotelResList(){
		List<ManageHotelDTO> getHotelResList = service.getHotelResList();
		return getHotelResList;
	}
	
	//예약관리 -> 티켓 예약 리스트 가져오기 Ajax
	@ResponseBody
	@PostMapping(value = "getTicketResList")
	public Map<String, Object> getTicketResList(ManageTicketDTO ticket, String currentPage){
		Map<String, Object> mapTicketRes = new HashMap<String, Object>();
		
		
		
		int total = service.totalTicketRes(ticket);
		PagingManager page = new PagingManager(total, currentPage);
		ticket.setStart(page.getStart());
		ticket.setEnd(page.getEnd());

		
		List<ManageTicketDTO> ticketRes = service.getTicketResPage(ticket);
		
		mapTicketRes.put("ticketRes", ticketRes);
		mapTicketRes.put("currentPage", currentPage);
		mapTicketRes.put("page", page);
		mapTicketRes.put("total", total);
		
		
		return mapTicketRes;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "pagingTicketRes")
	public Map<String, Object> pagingTicketRes(ManageTicketDTO ticket, String currentPage){
		Map<String, Object> mapRoomDetail = new HashMap<String, Object>();
		int total = service.totalTicketRes(ticket);
		PagingManager page = new PagingManager(total, currentPage);
		ticket.setStart(page.getStart());
		ticket.setEnd(page.getEnd());
		List<ManageTicketDTO> ticketRes = service.getTicketResPage(ticket);
		mapRoomDetail.put("ticketRes", ticketRes);
		mapRoomDetail.put("currentPage", currentPage);
		mapRoomDetail.put("page", page);
		mapRoomDetail.put("total", total);
		return mapRoomDetail;
	}
	
	
	
	
	
	
	
}
