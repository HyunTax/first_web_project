package com.lucas.hyuntax.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@RequestMapping(value = "/chat_view", method = RequestMethod.GET)
	public String chat_view(HttpSession session, Model model) {
		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			return "/chat_view";
		}
	}
}
