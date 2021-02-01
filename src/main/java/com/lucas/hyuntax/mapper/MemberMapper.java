package com.lucas.hyuntax.mapper;

import com.lucas.hyuntax.vo.MemberVO;

public interface MemberMapper {

	public int join(MemberVO memberVo);

	public MemberVO login(MemberVO memberVo);

	public int deleteMember(String userID);
}
