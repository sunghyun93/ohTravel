package com.oracle.ohTravel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.oracle.ohTravel.member.model.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ManagerLoginInterCeptor implements HandlerInterceptor {
	// admin 로그인 체크 - Controller 실행 전 admin 로그인 체크
	// return false 시 Controller 를 타지 않음.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("ManagerLoginInterCeptor preHandle() start...");
		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		// 아예 로그인이 되어 있지 않다면 redirect
		if(memberDTO == null) {
			response.sendRedirect("/member/loginForm");
			return false;
		}
		else {
			// 로그인은 했지만 admin 이 아니라면 홈으로 redirect
			if(!memberDTO.getMem_id().equals("admin")) {
				response.sendRedirect("/");
				return false;
			}
		}
		
		return true;
	}
} 
