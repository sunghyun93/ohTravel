package com.oracle.ohTravel.pkage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@RequestMapping("/pkage")
public class PkageController {
	@GetMapping("/pkage/pkageDetail")
	public String pkDetail() {
		return "pkage/package_detail";
	}
}
