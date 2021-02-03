package com.lucas.hyuntax.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.lucas.hyuntax.dao.BoardDAO;
import com.lucas.hyuntax.service.BoardService;
import com.lucas.hyuntax.vo.BoardVO;
import com.lucas.hyuntax.vo.FileVO;
import com.lucas.hyuntax.vo.Reply;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	BoardDAO boardDao;

	final static String UPLOADPATH = "C:/File/";

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
	public String write(MultipartFile upload, BoardVO boardVo, Model model, HttpSession session) {

		String boardID = (String) session.getAttribute("memberID");
		boardVo.setBoardID(boardID);
		boardService.write(boardVo);

		if (!(upload.isEmpty() || upload == null || upload.getSize() == 0)) {
			String orgName = upload.getOriginalFilename();
			String savName;

			Date date = new Date();
			savName = date.getTime() + orgName;

			try {
				upload.transferTo(new File(UPLOADPATH + savName));

				FileVO fileVo = new FileVO();
				fileVo.setOrgName(orgName);
				fileVo.setSavName(savName);
				boardService.insertFile(fileVo);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
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
		model.addAttribute("file", boardService.selectFile(boardSEQ));

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

				FileVO fileVo = boardService.selectFile(boardSEQ);
				if (fileVo != null) {
					String path = UPLOADPATH + fileVo.getSavName();
					File file = new File(path);
					file.delete();
				}

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
		model.addAttribute("file", boardService.selectFile(boardSEQ));

		return "/board/write_view";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(MultipartFile upload, BoardVO boardVo, Model model, HttpSession session) {

		if (session.getAttribute("memberID") == null) {
			model.addAttribute("noMember", "noMember");
			return "/member/login_view";
		} else {
			String memberID = (String) session.getAttribute("memberID");
			String boardID = boardService.selectOne(boardVo.getBoardSEQ()).getBoardID();

			if (memberID.equals(boardID)) {

				if (upload != null) {
					if (upload.isEmpty() || upload.getSize() == 0) {
						boardService.update(boardVo);
					} else {
						String boardSEQ = boardVo.getBoardSEQ();
						FileVO fileVo = boardService.selectFile(boardSEQ);
						String fileName = fileVo.getSavName();
						String deletepath = UPLOADPATH + fileName;
						File deleteFile = new File(deletepath);
						deleteFile.delete();

						String orgName = upload.getOriginalFilename();
						String savName;
						Date date = new Date();
						savName = date.getTime() + orgName;

						try {
							upload.transferTo(new File(UPLOADPATH + savName));

							fileVo = new FileVO();
							fileVo.setOrgName(orgName);
							fileVo.setSavName(savName);
							fileVo.setBoardSEQ(boardVo.getBoardSEQ());

							boardService.updateFile(fileVo);
							boardService.update(boardVo);

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
				boardService.update(boardVo);
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

	@RequestMapping(value = "deleteOneReply", method = RequestMethod.POST)
	public String deleteOneReply(String boardSEQ, String replySEQ) {

		boardService.deleteOneReply(replySEQ);

		return "redirect:/board/content_view?boardSEQ=" + boardSEQ;
	}

	@RequestMapping(value = "downloadFile", method = RequestMethod.GET)
	public String downloadFile(String fileSEQ, HttpServletResponse response) {

		FileVO fileVo = boardService.selectFileBySEQ(fileSEQ);
		response.setHeader("Content-Disposition", "attachment;filename=" + fileVo.getOrgName());

		File file = new File(UPLOADPATH + fileVo.getSavName());

		try {
			FileInputStream fis = new FileInputStream(file);
			ServletOutputStream sos = response.getOutputStream();
			FileCopyUtils.copy(fis, sos);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
