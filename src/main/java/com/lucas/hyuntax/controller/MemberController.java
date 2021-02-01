package com.lucas.hyuntax.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lucas.hyuntax.service.MemberService;
import com.lucas.hyuntax.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MemberService memberService;

	@RequestMapping("login_view")
	public String login_view() {
		return "/member/login_view";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO memberVo, Model model, HttpSession session) {

		MemberVO result = memberService.login(memberVo);

		if (result == null) {
			model.addAttribute("message", "error");
			return "/member/login_view";
		} else {
			session.setAttribute("memberID", result.getUserID());
			return "redirect:/home";
		}

	}

	@RequestMapping("join_view")
	public String join_view() {
		return "/member/join_view";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(MemberVO memberVo, Model model) {
		int result = memberService.join(memberVo);

		if (result == 0) {
			model.addAttribute("message", "error");
			return "/member/join_view";
		}
		return "redirect:/member/login_view";
	}

	/*
	 * @RequestMapping(value = "logout", method = RequestMethod.GET) public String
	 * logout(MemberVO memberVo, Model model, HttpSession session) {
	 * session.invalidate(); return "redirect:/home"; }
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		memberService.logout(response);
	}

	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public String deleteMember(HttpSession session) {

		String memberID = (String) session.getAttribute("memberID");
		memberService.deleteMember(memberID);
		session.invalidate();
		return "redirect:/";
	}

}
