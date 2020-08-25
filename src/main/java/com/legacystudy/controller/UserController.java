package com.legacystudy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.legacystudy.dto.UserVO;
import com.legacystudy.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;

	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String register(Locale locale,Model model) throws Exception {
		
		
		return "/register";
	}
	//CREATE
	@ResponseBody
	@RequestMapping(value = "register.ajax",method = RequestMethod.POST)
	public String join(@ModelAttribute UserVO vo) throws Exception {
		userservice.insert(vo);
		logger.info("ff");
		return "register";
	}
	//READ
	@RequestMapping(value = "/list")
	public String list(Locale locale,Model model)throws Exception {
		List<UserVO> uv=userservice.userList();
		model.addAttribute("uv",uv);
		logger.info(uv.get(0).toString());
		return "/listuser";
	}
    //UPDATE
	@ResponseBody
	@RequestMapping(value = "/userUpdate.ajax",method = {RequestMethod.POST,RequestMethod.GET})
	public UserVO update_user(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		UserVO uservo=new UserVO();
		UserVO uservo1= (UserVO) session.getAttribute("loginInfo");
		
		//보안 로직
		if(Integer.parseInt(req.getParameter("idx"))== uservo1.getIdx())
		{
			uservo.setIdx(Integer.parseInt(req.getParameter("idx")));
			uservo.setId(req.getParameter("id"));
			uservo.setPw(req.getParameter("pw"));
			uservo.setName(req.getParameter("name"));
			uservo.setPhone_number(req.getParameter("phone_number"));
			uservo.setEmail(req.getParameter("email"));
			uservo.setPost_code(req.getParameter("post_code"));
			uservo.setAddr1(req.getParameter("addr1"));
			uservo.setAddr2(req.getParameter("addr2"));
			userservice.update(uservo);
		}
		
			
		
		
		
		return uservo;
	}
	//DELETE
	@ResponseBody
	@RequestMapping(value = "/userDelete.ajax", method = {RequestMethod.POST,RequestMethod.GET})
	public UserVO delete_user(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
		UserVO uservo=new UserVO();
		
		uservo.setIdx(Integer.parseInt(req.getParameter("index")));
		userservice.delete(uservo);
		
		return uservo;
		
	}
	
	@RequestMapping(value = "/mypage",method= RequestMethod.GET)
	public String mypage(Model model,UserVO vo,HttpServletRequest req,HttpSession session)throws Exception {
		//로그인 후 세션을 가지고 와서 uservo1에 담아준다 이떄 캐스팅을 해줘야 한다 ! 
		UserVO uservo1= (UserVO) session.getAttribute("loginInfo");
		//vo2라는 새로운 VO를 만들어주고 
		UserVO vo2=userservice.mypage(uservo1);
		//vo2를 모델을 통해 넘겨준다
		model.addAttribute("mv",vo2);
		
		return "/mypage";
	}
	
	//LOGIN
	@RequestMapping(value = "login")
	public String login(Locale locale,Model model) throws Exception{
		
		return "/login";
	}
	@ResponseBody
	@RequestMapping(value = "login.do")
	public 
	HashMap<String, Object> login_do(@ModelAttribute UserVO vo,HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		UserVO vo1=userservice.loginCheck(vo);
		if(vo1!=null) {
			map.put("canLogin",vo);
			session.setAttribute("loginInfo",vo1);
		}
		return map;
	}
	
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session) throws Exception{
		session.invalidate();
		ModelAndView mv=new ModelAndView("redirect:/");
		return mv;
		
	}
	


	
}
