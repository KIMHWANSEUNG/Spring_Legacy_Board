package com.legacystudy.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.legacystudy.dto.BoardVO;
import com.legacystudy.dto.ComentVO;
import com.legacystudy.dto.PagingVO;

public interface BoardService {
	public int countBoard();
	public List<BoardVO> boardList(PagingVO vo);
	public void boardInsert(BoardVO vo);
	public BoardVO showBoard(int board_number);
	public List<ComentVO> showComent(int board_number);
	public void insertComent(ComentVO vo);
}
