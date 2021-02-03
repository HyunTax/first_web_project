package com.lucas.hyuntax.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.lucas.hyuntax.vo.BoardVO;
import com.lucas.hyuntax.vo.FileVO;
import com.lucas.hyuntax.vo.Reply;

public interface BoardMapper {

	public int write(BoardVO boardVo);

	public ArrayList<BoardVO> selectAll();

	public BoardVO selectOne(String boardSEQ);

	public int delete(String boardSEQ);

	public int update(BoardVO boardVo);

	public int deleteAll(String boardID);

	public ArrayList<HashMap<String, String>> selectReply(String boardSEQ);

	public int writeReply(Reply reply);

	public int insertFile(FileVO fileVo);

	public FileVO selectFile(String boardSEQ);

	public FileVO selectFileBySEQ(String fileSEQ);

	public int deleteReply(String boardSEQ);

	public int deleteFile(String boardSEQ);

	public int updateFile(FileVO fileVo);

	public int deleteOneReply(String replySEQ);
}
