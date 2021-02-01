package com.lucas.hyuntax.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucas.hyuntax.dao.BoardDAO;
import com.lucas.hyuntax.dao.MemberDAO;
import com.lucas.hyuntax.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BoardDAO boardDao;

	public int join(MemberVO memberVo) {
		return memberDao.join(memberVo);
	}

	public MemberVO login(MemberVO memberVo) {
		return memberDao.login(memberVo);

	}

	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}

	public int deleteMember(String userID) {

		int boardResult = boardDao.deleteAll(userID);
		int memberResult = memberDao.deleteMember(userID);

		if (boardResult == 1 && memberResult == 1) {
			return 1;
		} else {
			return 0;
		}
	}
}
