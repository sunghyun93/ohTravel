package com.oracle.ohTravel.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	// 로그인
	@GetMapping(value = "/loginForm")
	public String goLoginForm() {
		return "member/loginForm";
	}
	
	// 회원가입
	@GetMapping(value = "/memberForm") 
	public String goMemberForm() {
		return "member/memberForm";
	}
	
	// 아이디 찾기
	@GetMapping(value = "/findID")
	public String goFindID() {
		return "member/findID";
	}
	
	// 비밀번호 찾기
	@GetMapping(value = "/findPassword")
	public String goFindPassword() {
		return "member/findPassword";
	}
	
	@GetMapping(value = "/myPageMain")
	public String goMyPageMain() {
		return "member/myPageMain";
	}
}
