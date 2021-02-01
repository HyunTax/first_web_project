package com.lucas.hyuntax.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lucas.hyuntax.mapper.MemberMapper;
import com.lucas.hyuntax.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;

	public int join(MemberVO memberVo) {
		int result = 0;
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		try {
			result = mapper.join(memberVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public MemberVO login(MemberVO memberVo) {
		MemberVO result = null;

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		try {
			result = mapper.login(memberVo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	public int deleteMember(String userID) {
		int result = 0;
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

		try {
			result = mapper.deleteMember(userID);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

}
