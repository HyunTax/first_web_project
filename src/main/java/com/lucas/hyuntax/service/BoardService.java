package com.lucas.hyuntax.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucas.hyuntax.dao.BoardDAO;
import com.lucas.hyuntax.vo.BoardVO;
import com.lucas.hyuntax.vo.Reply;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDao;

	public int write(BoardVO boardVo) {
		return boardDao.write(boardVo);
	}

	public ArrayList<BoardVO> selectAll() {
		return boardDao.selectAll();
	}

	public BoardVO selectOne(String boardSEQ) {
		return boardDao.selectOne(boardSEQ);
	}

	public int delete(String boardSEQ) {
		return boardDao.delete(boardSEQ);
	}

	public int update(BoardVO boardVo) {
		return boardDao.update(boardVo);
	}

	public ArrayList<HashMap<String, String>> selectReply(String boardSEQ) {
		return boardDao.selectReply(boardSEQ);
	}

	public int writeReply(Reply reply) {
		return boardDao.writeReply(reply);
	}
}
