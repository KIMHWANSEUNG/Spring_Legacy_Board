package com.legacystudy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.legacystudy.dto.BoardVO;
import com.legacystudy.dto.ComentVO;
import com.legacystudy.dto.PagingVO;

@Mapper
public interface BoardMapper {
	public int countBoard();
	List<BoardVO> selectListboard(PagingVO vo);
	void insertBoard(BoardVO vo);
	BoardVO showBoard(int board_number);
	List<ComentVO> showComent(int board_number);
	public void insertComent(ComentVO vo);
	
}
