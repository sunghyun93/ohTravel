package com.oracle.ohTravel.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	@GetMapping(value = "/")
	public String goHome() {
		return "main/home";
	}
	
	@GetMapping(value = "element")
	public String goElement() {
		return "ref/element";
	}
	
	@GetMapping(value = "hotelmain")
	public String goHotel() {
		return "hotel/hotelMain";
	}
	
	@GetMapping(value = "blog")
	public String goBlog() {
		return "ref/blog";
	}
	
	@GetMapping(value = "justTest")
	public String goTest() {
		return "hotel/justTest";
	}
	
	@GetMapping(value = "cssTest")
	public String goCssTest() {
		return "hotel/cssTest";
	}
	
	@GetMapping(value = "loginForm")
	public String goLogin() {
		return "member/loginForm";
	}
	
}
