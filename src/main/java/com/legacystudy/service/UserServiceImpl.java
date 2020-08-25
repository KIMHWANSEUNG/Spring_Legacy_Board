package com.legacystudy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.legacystudy.dao.UserMapper;
import com.legacystudy.dto.UserVO;

@Repository

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper usermapper;
	
	public void insert(UserVO vo) {
		usermapper.insertUser(vo);
	}
	
	public List<UserVO> userList(){
		return usermapper.selectUserList();
	}

	public void update(UserVO vo) {
		usermapper.updateUser(vo);
	}
	
	public void delete(UserVO vo) {
		usermapper.deleteUser(vo);
	}
	

	public UserVO loginCheck(UserVO vo) {
		
		UserVO result=usermapper.loginCheck(vo);
		
		return result;
	}
	
	public UserVO mypage(UserVO vo) {
		UserVO result=usermapper.mypage(vo);
		
		return result;
	}


	
	
}
