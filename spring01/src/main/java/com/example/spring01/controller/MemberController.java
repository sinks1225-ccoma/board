package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring01.model.dao.MemberDAO;
import com.example.spring01.model.dto.MemberDTO;

@Controller
public class MemberController {
	
	@Inject
	MemberDAO memberDao;
	
	@RequestMapping("member/list")
	public String list(Model model) {
		List<MemberDTO> list = memberDao.list();
		model.addAttribute("items", list);
		return "member/list";
	}
	
	//회원등록 form
	@RequestMapping("member/write")
	public String write(Model model) {
		return "member/write";
	}
	@RequestMapping("member/insert")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/member/list";
	}
	//회원정보상세
	@RequestMapping("member/view")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberDao.detail(userid));
		return "member/detail";
	}
	//회원정보 업데이트
	@RequestMapping("member/update")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		boolean result = memberDao.check_passwd(dto.getUserid(), dto.getPasswd());
		if(result) {
			//System.out.println("updateResult : >>>>>>>>>>>>>>>>>>>>>>" + result);
			memberDao.update(dto);
			return "redirect:/member/list";
		} else {
			MemberDTO dto2 = memberDao.detail(dto.getUserid());
			dto.setJoin_date(dto2.getJoin_date());
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "member/detail";
		}
	}
	//회원정보 삭제
	@RequestMapping("member/delete")
	public String delete(@RequestParam String userid, @RequestParam String passwd, Model model) {
		boolean result = memberDao.check_passwd(userid, passwd);
		if (result) {
			//System.out.println("deleteResult : >>>>>>>>>>>>>>>>>>>>>>" + result);
			//삭제처리
			memberDao.delete(userid);
			//회원목록이동
			return "redirect:/member/list";
		} else {
			//비밀번호 틀렸을때
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto", "memberDao.detail(userid)");
			//view.jsp로 포워드
			return "member/detail";
		}
	}
	
}
