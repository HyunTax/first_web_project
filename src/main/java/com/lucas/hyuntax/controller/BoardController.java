package com.lucas.hyuntax.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lucas.hyuntax.service.BoardService;
import com.lucas.hyuntax.vo.BoardVO;
import com.lucas.hyuntax.vo.Reply;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "write_view", method = RequestMethod.GET)
	public String write_view(Model model, HttpSession session) {
		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			return "/board/write_view";
		}
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVo, Model model, HttpSession session) {

		String boardID = (String) session.getAttribute("memberID");
		boardVo.setBoardID(boardID);
		boardService.write(boardVo);

		return "redirect:/board/list";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {

		model.addAttribute("boardList", boardService.selectAll());

		return "/board/list";
	}

	@RequestMapping(value = "content_view", method = RequestMethod.GET)
	public String content_view(String boardSEQ, Model model) {

		model.addAttribute("boardVo", boardService.selectOne(boardSEQ));
		model.addAttribute("reply", boardService.selectReply(boardSEQ));
		return "/board/content_view";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(String boardSEQ, Model model, HttpSession session) {

		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			String memberID = (String) session.getAttribute("memberID");
			String boardID = boardService.selectOne(boardSEQ).getBoardID();

			if (memberID.equals(boardID)) {
				boardService.delete(boardSEQ);
			} else {
				return "redirect:/board/list";
			}
		}
		return "redirect:/board/list";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(String boardSEQ, Model model) {
		model.addAttribute("boardVo", boardService.selectOne(boardSEQ));

		return "/board/write_view";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardVO boardVo, Model model, HttpSession session) {

		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			String memberID = (String) session.getAttribute("memberID");
			String boardID = boardService.selectOne(boardVo.getBoardSEQ()).getBoardID();

			if (memberID.equals(boardID)) {
				boardService.update(boardVo);
			} else {
				return "redirect:/board/list";
			}
		}
		return "redirect:/board/list";
	}

	@RequestMapping(value = "writeReply", method = RequestMethod.POST)
	public String writeReply(Model model, Reply reply, HttpSession session) {

		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			String memberID = (String) session.getAttribute("memberID");

			reply.setReplyID(memberID);
			boardService.writeReply(reply);
		}

		return "redirect:/board/content_view?boardSEQ=" + reply.getBoardSEQ();
	}
}
