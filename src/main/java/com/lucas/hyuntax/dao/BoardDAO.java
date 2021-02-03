package com.lucas.hyuntax.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lucas.hyuntax.mapper.BoardMapper;
import com.lucas.hyuntax.vo.BoardVO;
import com.lucas.hyuntax.vo.FileVO;
import com.lucas.hyuntax.vo.Reply;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;

	public int write(BoardVO boardVo) {

		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.write(boardVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<BoardVO> selectAll() {

		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			boardList = mapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
			return boardList;
		}
		return boardList;
	}

	public BoardVO selectOne(String boardSEQ) {

		BoardVO result = null;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.selectOne(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int delete(String boardSEQ) {
		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.delete(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int update(BoardVO boardVo) {
		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		try {
			result = mapper.update(boardVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int deleteAll(String boardID) {
		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		try {
			result = mapper.deleteAll(boardID);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int writeReply(Reply reply) {
		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.writeReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public ArrayList<HashMap<String, String>> selectReply(String boardSEQ) {
		ArrayList<HashMap<String, String>> result = null;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.selectReply(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int insertFile(FileVO fileVo) {
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.insertFile(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public FileVO selectFile(String boardSEQ) {

		FileVO result = null;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.selectFile(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;

	}

	public FileVO selectFileBySEQ(String fileSEQ) {
		FileVO result = null;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.selectFileBySEQ(fileSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int deleteReply(String boardSEQ) {

		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.deleteReply(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}

		return result;
	}

	public int deleteFile(String boardSEQ) {

		int result = 0;

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		try {
			result = mapper.deleteFile(boardSEQ);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public int updateFile(FileVO filVo) {
		int result = 0;
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		try {
			result = mapper.updateFile(filVo);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}