package com.legacystudy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.legacystudy.dto.UserVO;

public interface UserService  {
	public void insert(UserVO vo);
	public List<UserVO> userList();
	public void update(UserVO vo);
	public void delete(UserVO vo);
	//회원 로그인 
	public UserVO loginCheck(UserVO vo);
	public UserVO mypage(UserVO vo);



}
