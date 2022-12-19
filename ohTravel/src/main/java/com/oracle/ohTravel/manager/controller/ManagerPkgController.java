package com.oracle.ohTravel.manager.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.ohTravel.airport.model.Air_ScheduleDTORM;
import com.oracle.ohTravel.hotel.model.HotelDTORM;
import com.oracle.ohTravel.manager.model.ManagePackageDTO;
import com.oracle.ohTravel.manager.service.ManagerPkgService;
import com.oracle.ohTravel.manager.service.ManagerService;
import com.oracle.ohTravel.pkage.model.AttractionDTO;
import com.oracle.ohTravel.pkage.model.Pkage_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_flightScheDTO;
import com.oracle.ohTravel.pkage.model.Pkage_hotelDTO;
import com.oracle.ohTravel.pkage.model.Pkage_sche_detailDTO;
import com.oracle.ohTravel.pkage.model.Pkage_schedulDTO;
import com.oracle.ohTravel.pkage.service.PkageService;

import lombok.extern.slf4j.Slf4j;

// form으로의 get 요청 url 의 경우 admin 로그인 여부는 interceptor 를 사용함
@RequestMapping("/manager")
@Controller
@Slf4j
public class ManagerPkgController {
	@Autowired
	private ManagerService service; // 지서님 service
	@Autowired
	private ManagerPkgService managerPkgService;
	@Autowired
	private PkageService pkageService;
	
// 패키지 상품 추가 관련 form 으로 가는 메서드들
	// 패키지 여행 일정 form
	@GetMapping("/insertPackageScheForm")
	public String insertPackagescheForm(Integer pkage_dt_id, Model model) {
		log.info("ManagerPkgController insertPackageScheForm() start...");
		log.info("pkage_dt_id = " + pkage_dt_id); // 방금 생성된 pkage_dt_id
		
		try {
			// 요일 구하기 (며칠인지 보내서 그만큼 여행 일정을 만들어야함)
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById3(pkage_dt_id);
			Date start = pkage_detailDTO.getPkage_dt_startDay();
			Date end = pkage_detailDTO.getPkage_dt_endDay();
			pkage_detailDTO.setDay(pkage_detailDTO.getDay(start, end));
			log.info("pkage_datailDTO = " + pkage_detailDTO);
			
			model.addAttribute("pkage_detailDTO", pkage_detailDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("ManagerPkgController insertPackageScheForm() end...");
		return "manager/insertPackageScheForm";
	}
	
	// 패키지 여행 일정_관광지 form
	@GetMapping("/insertPackageScheDetailForm")
	public String insertPackageScheDetailForm(String pkage_dt_id, Integer scheDays, Model model) {
		log.info("ManagerPkgController insertPackageScheDetailForm() start...");
		log.info("pkage_dt_id = " + pkage_dt_id); 	// 패키지 상세 ID
		log.info("scheDays = " + scheDays );		// 일수
		
		// 관광지 선택을 위한 해당 패키지 상세와 관련된 관광지 가져오기
		try {
			List<AttractionDTO> attrList = managerPkgService.selectAttrConnectedPkgDetail(pkage_dt_id);
			log.info("attrList = " + attrList);
			
			if(attrList == null) {
				throw new Exception("attrList select Error");
			}
			
			model.addAttribute("pkage_dt_id", pkage_dt_id);
			model.addAttribute("scheDays", scheDays);
			model.addAttribute("attrList", attrList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		log.info("ManagerPkgController insertPackageScheDetailForm() end...");
		return "manager/insertPackageScheDetailForm";
	}
	
	// 패키지 상세 관련 관광지 가져오기 ajax
	@GetMapping("/getAttrConnectedDetail")
	@ResponseBody
	public List<AttractionDTO> getAttrConnectedDetail(String pkage_dt_id) {
		log.info("ManagerPkgController getAttrConnectedDetail() start...");
		// 관광지 선택을 위한 해당 패키지 상세와 관련된 관광지 가져오기
		try {
			List<AttractionDTO> attrList = managerPkgService.selectAttrConnectedPkgDetail(pkage_dt_id);
			log.info("attrList = " + attrList);
			
			if(attrList == null) {
				throw new Exception("attrList select Error");
			}
			
			return attrList;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 비행일정 form
	@GetMapping("/insertPackageFlightScheForm")
	public String insertPackageFlightScheForm(Integer pkage_dt_id, Model model) {
		log.info("ManagerPkgController insertPackageFlightScheForm() start...");
		log.info("pkage_dt_id = " + pkage_dt_id);
		
		try {			
			// 해당 패키지 상세의 city_id 가져오기
			int city_id = managerPkgService.selectCityIdConnectedPkgDetail(pkage_dt_id);
			
			Map<String, Object> map = new HashMap<>();
			map.put("pkage_dt_id", pkage_dt_id);
			
			// 출발 비행일정 가져오기
			map.put("start_city_id", 110); // 인천ID 
			map.put("end_city_id", city_id); // 패키지 상세의 도시ID
			map.put("pkage_dt_dayGubun", "pkage_dt_startDay");
			List<Air_ScheduleDTORM> beginAirScheList = managerPkgService.selectAirScheConnectedPkgDetail(map);
			log.info("beginAirScheList = " + beginAirScheList);
			// 도착 비행일정 가져오기
			map.put("start_city_id", city_id); // 패키지 상세의 도시ID
			map.put("end_city_id", 110); // 인천ID 
			map.put("pkage_dt_dayGubun", "pkage_dt_endDay");
			List<Air_ScheduleDTORM> endAirScheList = managerPkgService.selectAirScheConnectedPkgDetail(map);
			log.info("endAirScheList = " + endAirScheList);
			
			model.addAttribute("beginAirScheList", beginAirScheList);
			model.addAttribute("endAirScheList", endAirScheList);
			model.addAttribute("pkage_dt_id", pkage_dt_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("ManagerPkgController insertPackageFlightScheForm() end...");
		return "manager/insertPackageFlightScheForm";
	}
	
	// 패키지 숙박 form
	@GetMapping("/insertPackageHotelForm")
	public String insertPackageHotelForm(Integer pkage_dt_id, Model model) {
		log.info("ManagerPkgController insertPackageHotelForm() start...");
		log.info("pkage_dt_id = " + pkage_dt_id);
		
		try {
			// 패키지 상세 도시에 속하는 호텔 리스트 가져오기
			List<HotelDTORM> hotelList = managerPkgService.selectHotelConnectedPkgDetail(pkage_dt_id);
			
			model.addAttribute("pkage_dt_id", pkage_dt_id);
			model.addAttribute("hotelList", hotelList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("ManagerPkgController insertPackageHotelForm() end...");
		return "manager/insertPackageHotelForm";
	}
	
// 상품관리 -> 패키지 한개 상세보기
	@RequestMapping(value = "managePackageDetailOne")
	public String managePackageDetailOne(ManagePackageDTO pk,String currentPage, String pkage_id, Model model) {
		log.info("pk = " + pk);
		
		try {
			// 패키지 관련 내용 모두 들어있음
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById2(pk.getPkage_dt_id());
			log.info("pkage_detailDTO = " + pkage_detailDTO);
			
			model.addAttribute("pkage_detailDTO", pkage_detailDTO);
			model.addAttribute("pkage_id", pkage_id);
			model.addAttribute("currentPage", currentPage);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "manager/managePackageDetailOne";
	}
	
// 패키지 상세 추가 insert 및 select 문들
	//상품관리 ->패키지 상세 추가하기 ( 추가 후 여행일정 form 으로 이동 )
	@PostMapping(value = "/insertPackage")
	public String insertPackage(Pkage_detailDTO pk, Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController insertPackage() start...");
		log.info("pk = " + pk);
		System.out.println("meet ->"+pk.getPkage_dt_meetDate());
		System.out.println("start ->"+pk.getPkage_dt_startDay());
		System.out.println("end ->"+pk.getPkage_dt_endDay());
		System.out.println("pkage_id->"+pk.getPkage_id());

		try {
			int result = managerPkgService.insertPackage1(pk);
			
			if(result != 1)
				throw new Exception("Insert Error");
			
			// 넣은 후에  가장 최근의 pkage_dt_id(넣은 것) 불러오기
			int pkage_dt_id = managerPkgService.selectRecentPkageDtId(pk.getPkage_id());
			
			rattr.addFlashAttribute("msg", "WRT_OK");

			// 성공 시 패키지 여행 일정으로 redirect (방금 insert 된 pkage_dt_id를 전달)
			return "redirect:/manager/insertPackageScheForm?pkage_dt_id="+pkage_dt_id;
		} catch(Exception e) {
			log.info("insert error 발생!!");
			// 쓰려고 했던 내용 그대로 들고가기
			model.addAttribute("msg", "WRT_ERR");
			model.addAttribute("pk", pk);
			
			e.printStackTrace();
			
			// 패키지 상품 작성 페이지
			return "manager/insertPackageForm";
		}

	}
	
	// 패키지 여행 일정 추가 ( 추가 후 여행일정_관광지 form 으로 이동 )
	@PostMapping("/insertPkgSche")
	public String insertPkgSche(Pkage_schedulDTO pkage_schedulDTO,Integer scheDays, Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController insertPkgSche() start...");
		log.info("pkage_schedulDTO" + pkage_schedulDTO);
		log.info("scheDays = " + scheDays);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pkage_schedulDTO", pkage_schedulDTO);
		
		int rowCnt = 0;
		try {
			rowCnt = managerPkgService.insertPkgSche(map);
			
			if(rowCnt == 0) {
				throw new Exception("Insert Error");
			}
			
			// insert 성공 시 여행 일정_관광지 form 으로 이동
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/manager/insertPackageScheDetailForm?"
					+ "pkage_dt_id="+pkage_schedulDTO.getPkage_dt_idList().get(0)
					+ "&scheDays="+scheDays;
			
		} catch(Exception e) {
			e.printStackTrace();
			
			// 에러나면 다시 여행일정 form 으로 redirect
			rattr.addFlashAttribute("msg", "WRT_ERR");
			return "redirect:/manager/insertPackageScheForm?pkage_dt_id="+pkage_schedulDTO.getPkage_dt_idList().get(0);
			
		}
	}
	
	// 패키지 여행일정_관광지 추가 ( 추가 후 비행 일정 form 으로 이동 국내 (비행일정이 없으면 숙박으로 이동)
	@PostMapping("/insertPkgScheDetail") 
	public String insertPkgScheDetail(Pkage_sche_detailDTO pkage_sche_detailDTO, Integer scheDays, RedirectAttributes rattr, Model model) {
		log.info("ManagerPkgController insertPkgScheDetail() start...");
		log.info("pkage_sche_detailDTO = " + pkage_sche_detailDTO);
		
		// pkage_dt_id 얻기
		Integer pkage_dt_id = pkage_sche_detailDTO.getPkage_dt_id();
		
		int rowCnt = 0;
		
		try {
			rowCnt = managerPkgService.insertPkgScheDetail(pkage_sche_detailDTO);
			
			if(rowCnt == 0) {
				throw new Exception("Insert Error");
			}
			
			int flightGubun = 1;
			
			// 해당 패키지 상세의 city_id 가져오기
			int city_id = managerPkgService.selectCityIdConnectedPkgDetail(pkage_dt_id);
			
			// 비행일정 존재여부를 판단할 컬럼이 없어서 하드코딩 했습니다.. 나중에 자유롭게 변경하세요.
			// 비행기가 없는 패키지이면 flightGubun = 1
			if(city_id == 110 ||city_id == 120 || city_id == 130)
				flightGubun = 0;
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			
			// 비행 일정이 있는지 없는지 구분 (사실 컬럼을 추가해서 구분해야 하지만, 지금은 어쩔 수 없기 때문에 하드 코딩 식을 구분)
			if(flightGubun == 1) {// 비행 일정
				rattr.addFlashAttribute("msg", "WRT_OK");
				return "redirect:/manager/insertPackageFlightScheForm?pkage_dt_id="+pkage_dt_id;
			}
			else { // 호텔 숙박
				rattr.addFlashAttribute("msg", "WRT_OK_NOFLIGHT");
				return "redirect:/manager/insertPackageHotelForm?pkage_dt_id="+pkage_dt_id;
			}
		} catch(Exception e) {
			e.printStackTrace();
			
			// 실패 시 form 으로 
			model.addAttribute("msg", "WRT_ERR");
			model.addAttribute("pkage_dt_id", pkage_dt_id);
			model.addAttribute("scheDays", scheDays);
			return "manager/insertPackageScheDetailForm";
		}
	}
	
	// 패키지 비행일정 추가
	@PostMapping("/insertPackageFlightSche")
	public String insertPackageFlightSche(Pkage_flightScheDTO pkage_flightScheDTO, Integer pkage_dt_id, Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController insertPackageFlightSche() start...");
		log.info("pkage_flightScheDTO = " + pkage_flightScheDTO);
		log.info("pkage_dt_id = " + pkage_dt_id);
		
		int rowCnt = 0;
		try {
			// 패키지 상세의 startDay와 endDay 가 비행시간으로 update 까지 진행
			rowCnt = managerPkgService.insertPkgFlightSche(pkage_flightScheDTO);
			
			if(rowCnt == 0) {
				throw new Exception("Insert Error");
			}
			
			// insert 성공 시 패키지 호텔 form 으로
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/manager/insertPackageHotelForm?pkage_dt_id="+pkage_dt_id;
		} catch(Exception e) {
			e.printStackTrace();
			
			rattr.addFlashAttribute("msg", "WRT_ERR");
			// 실패 시 다시 패키지 비행일정 form 으로
			return "redirect:/manager/insertPackageFlightScheForm?pkage_dt_id="+pkage_dt_id;
		}
	}
	
	// 패키지 숙박 추가
	@PostMapping("/insertPackageHotel")
	public String insertPackageHotel(Pkage_hotelDTO pkage_hotelDTO, Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController insertPackageHotel() start...");
		log.info("pkage_hotelDTO = " + pkage_hotelDTO);
		
		int rowCnt = 0;
		try {
			// 패키지 detail 리스트로 redirect 하기 위해 pkage_id 얻어 오기
			Pkage_detailDTO pkage_detailDTO = pkageService.selectPkgDetailById3(pkage_hotelDTO.getPkage_dt_id());
			
			// 패키지 호텔 insert
			rowCnt = managerPkgService.insertPkgHotel(pkage_hotelDTO);
			
			if(rowCnt == 0) {
				throw new Exception("Insert Error");
			}
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/manager/managePackageDetail?pkage_id="+pkage_detailDTO.getPkage_id()+"&currentPage=1";
		} catch(Exception e) {
			e.printStackTrace();
			
			rattr.addFlashAttribute("msg", "WRT_ERR");
			return "redirect:/manager/insertPackageHotelForm?pkage_dt_id="+pkage_hotelDTO.getPkage_dt_id();
		}
		
	}
	
//	패키지 상세 수정
	@PostMapping("/updatePackage")
	public String updatePkgDetail(Pkage_detailDTO pkage_detailDTO, Integer currentPage, 
								Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController updatePkgDetail() start...");
		log.info("currentPage = " + currentPage);
		log.info("pkage_detailDTO = " + pkage_detailDTO);
		
		int rowCnt = 0;
		
		try {
			rowCnt = managerPkgService.updatePkgDetail(pkage_detailDTO);
			log.info("rowCnt = " + rowCnt);
			// 수정 성공 시 성공 메세지와 함께 목록으로
			if(rowCnt != 0) {
				rattr.addFlashAttribute("msg", "MOD_OK");
				return "redirect:/manager/managePackageDetail?pkage_id="+pkage_detailDTO.getPkage_id()+"&currentPage="+currentPage;
			} 
			// 수정 실패 시 수정 실패 메세지 뿌려주기
			else {
				throw new Exception("Modify Error");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
			// 실패 시 등록하려던 내용을 들고 가야함.
			model.addAttribute("msg", "MOD_ERR");
			model.addAttribute("pkage_detailDTO", pkage_detailDTO);
			model.addAttribute("pkage_id", pkage_detailDTO.getPkage_dt_id());
			model.addAttribute("currentPage", currentPage);
			log.info("ManagerPkgController updatePkgDetail() end...");
			return "manager/managePackageDetailOne";
		}
	}
	
//	pkage_detail 삭제 (관련 테이블 모두 삭제)
	@PostMapping("/deletePackage")
	public String deletePackage(Integer pkage_dt_id, Integer currentPage, String pkage_id, Model model, RedirectAttributes rattr) {
		log.info("ManagerPkgController deletePackage() start...");
		log.info("pkage_id = " + pkage_id);
		log.info("pkage_dt_id = " + pkage_dt_id);
		log.info("currentPage = " + currentPage);
		
		int rowCnt = 0;
		try {
			rowCnt = managerPkgService.deletePkgDetailWithAll(pkage_dt_id);
			
			if(rowCnt == 0) {
				throw new Exception("Delete Error");
			}
			
			rattr.addFlashAttribute("msg", "DEL_OK");
		} catch(Exception e) {
			e.printStackTrace();
			
			rattr.addFlashAttribute("msg", "DEL_ERR");
		}
		
		return "redirect:/manager/managePackageDetail?pkage_id="+pkage_id+"&currentPage="+currentPage;
	}
}
