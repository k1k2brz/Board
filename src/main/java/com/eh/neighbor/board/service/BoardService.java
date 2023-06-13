package com.eh.neighbor.board.service;

import java.util.List;

import com.eh.neighbor.board.service.vo.BoardVO;


public interface BoardService  {
	
	// Create
	void writeBoard(BoardVO boardVO);
	// Read
	List<BoardVO> selectBoard(BoardVO boardVO);
	// Update
	BoardVO selectUpdate(BoardVO boardVO);
	void updateBoard(BoardVO boardVO);
	// Delete
	void deleteBoard(BoardVO boardVO);
	
}
