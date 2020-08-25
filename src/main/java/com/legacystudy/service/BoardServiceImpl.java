package com.legacystudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.legacystudy.dao.BoardMapper;
import com.legacystudy.dto.BoardVO;
import com.legacystudy.dto.ComentVO;
import com.legacystudy.dto.PagingVO;

@Repository
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;
	
	public List<BoardVO> boardList(PagingVO vo){
		
		return boardmapper.selectListboard(vo);
		
	}
	
	public void boardInsert(BoardVO vo) {
		
		 boardmapper.insertBoard(vo);
	}
	
	public BoardVO showBoard(int board_number){
		return boardmapper.showBoard(board_number);
	}
	
	public int countBoard() {
		return boardmapper.countBoard();
	}
	
	public List<ComentVO> showComent(int board_number) {
		
		return boardmapper.showComent(board_number);
	}
	public void insertComent(ComentVO vo) {
		
		boardmapper.insertComent(vo);
	}
}
