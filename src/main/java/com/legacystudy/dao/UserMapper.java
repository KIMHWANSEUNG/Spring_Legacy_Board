package com.legacystudy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.legacystudy.dto.UserVO;

@Mapper
public interface UserMapper {
	void insertUser(UserVO vo);
	List<UserVO> selectUserList();
	void updateUser(UserVO vo);
	void deleteUser(UserVO vo);
	UserVO loginCheck(UserVO vo);
	UserVO mypage(UserVO vo);
	
	
}
