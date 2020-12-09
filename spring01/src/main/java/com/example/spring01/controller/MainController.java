package com.example.spring01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring01.model.dto.PointDTO;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("name", "홍길동");
		model.addAttribute("message", "홈페이지 방문");
		return "main";
	}
	
	@RequestMapping("gugu")
	public String write() {
		return "test/gugu";
	}
	@RequestMapping("gugu_result")
	public String gugu(/*@RequestParam(defaultValue = "3")*/ int dan, Model model) {
		String result = "";
		for (int i = 1; i <= 9; i++) {
			result += dan + "x" + i + "=" + dan * i + "<br>";
		}
		model.addAttribute("result", result);
		return "test/gugu_result";
	}
	
	@RequestMapping("point")
	public String point() {
		return "test/point";
	}
	@RequestMapping("point_result")
	public String point_result(@ModelAttribute PointDTO dto, Model model) {
		dto.setTotal(dto.getKor() + dto.getEng() + dto.getMat());
		//String average = String.format("%.2f", dto.getTotal()/3.0);
		//dto.setAverage(Double.parseDouble(average));
		//아래 2줄과 같은 소스내용
		double average = dto.getTotal()/3.0;
		dto.setAverage(average);
		model.addAttribute("dto", dto);
		return "test/point_result";
	}
	
	@RequestMapping("move")
	public String move() {
		//return "redirect:/result";
		return "redirect:/result?name=kim&age=20";
	}
	@RequestMapping("result")
	public String result(Model model, /*@RequestParam(defaultValue = "noname")*/ String name, /*@RequestParam(defaultValue = "10")*/ int age) {
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "test/result";
	}
	
	@RequestMapping("ajax")
	public String ajax() {
		return "test/ajax";
	}

	@RequestMapping("login")
	public String login() {
		return "test/login";
	}
	@RequestMapping("login_result")
	public String login_result(String id, String pw, Model model) {
		String result = "";
		if(id.equals("sinks1225") && pw.equals("1234")) {
			result = "환영합니다";
		}else {
			result = "아이디 또는 비밀번호가 틀렸습니다.";
		}
		model.addAttribute("result", result);
		return "test/login_result";
	}
	
	@RequestMapping("ajax_gugu")
	public String ajax_gugu() {
		return "test/ajax_gugu";
	}
	@RequestMapping("ajax_gugu_result")
	public String ajax_gugu_result(int dan, Model model) {
		String result = "";
		for(int i = 1; i <= 9; i++ ) {
			result += dan + "x" + i + "=" + dan * i + "<br>";
		}
		model.addAttribute("result", result);
		return "test/ajax_gugu_result";
	}

}
