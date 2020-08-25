package com.legacystudy.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.legacystudy.dto.BoardVO;
import com.legacystudy.dto.ComentVO;
import com.legacystudy.dto.PagingVO;
import com.legacystudy.dto.UserVO;
import com.legacystudy.service.BoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class BoardController {

	@Autowired
	private BoardService boardservice;
	
	//게시판
	@RequestMapping(value="board")
	public String board(PagingVO pvo,Model model
			,@RequestParam(value="nowPage",required = false)String nowPage
			,@RequestParam(value="cntPerPage",required = false)String cntPerPage )
			 {
		
		int total= boardservice.countBoard();
		pvo.setTotal(total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		
		 pvo=new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		List<BoardVO> uv=boardservice.boardList(pvo);
		model.addAttribute("paging",pvo);
		model.addAttribute("uv",uv);
		
		return "/listboard";
	}
	
	@RequestMapping (value = "write")
	public String boardWrite(Locale locale,Model model,HttpSession session) {
		
		UserVO loginInfo= (UserVO) session.getAttribute("loginInfo");
		
		model.addAttribute("loginInfo",loginInfo);
		return "/writeboard";
	}
	
	@ResponseBody
	@RequestMapping(value = "write.ajax")
	public String boardWrite_do(HttpServletRequest req,Model model,HttpSession session)
	{
		UserVO sessionVO=(UserVO)session.getAttribute("loginInfo");
		BoardVO boardvo=new BoardVO();
		//보안 설정 
		if(Integer.parseInt(req.getParameter("user_idx"))== sessionVO.getIdx())
		{
			boardvo.setUser_idx(Integer.parseInt(req.getParameter("user_idx")));
			boardvo.setBoard_title(req.getParameter("board_title"));
			boardvo.setBoard_content(req.getParameter("board_content"));
			boardservice.boardInsert(boardvo);
		}
		
		
		return "writeboard";
	}
	
	@RequestMapping(value = "showboard")
	public String showBoard(Model model,@RequestParam("board_number")int board_number,HttpSession session) {
		UserVO loginInfo= (UserVO) session.getAttribute("loginInfo");
		
		List<ComentVO> cv=boardservice.showComent(board_number);
		BoardVO uv=boardservice.showBoard(board_number);
		
		model.addAttribute("board",uv);
		model.addAttribute("coment",cv);
		model.addAttribute("loginInfo",loginInfo);
		
		return "showboard";
	}
	
	@ResponseBody
	@RequestMapping(value="coment.ajax")
	public String comentWrite(Model model,HttpServletRequest req,HttpSession session) {
		UserVO sessionVO=(UserVO)session.getAttribute("loginInfo");
		ComentVO comentvo=new ComentVO();
		
		//보안 설정 
		if(Integer.parseInt(req.getParameter("user_idx"))== sessionVO.getIdx())
		{
			comentvo.setC_board_number(Integer.parseInt(req.getParameter("c_board_number")));
			comentvo.setUser_idx(Integer.parseInt(req.getParameter("user_idx")));
			comentvo.setComent_state(Integer.parseInt(req.getParameter("coment_state")));
			comentvo.setComent(req.getParameter("content"));
			boardservice.insertComent(comentvo);
		}
		
		return "showboard";
	}
	
	
}
