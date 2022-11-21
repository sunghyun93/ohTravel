package com.oracle.ohTravel.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	// 회원가입 페이지 이동
	@GetMapping(value = "memberForm") 
	public String goMemberForm() {
		return "member/memberForm";
	}
}
