package com.jt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class KrMainController {
	@GetMapping(value="/sample")
	public String s1111() {
		return "sample";
	}
}
