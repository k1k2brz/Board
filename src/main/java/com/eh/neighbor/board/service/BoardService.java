package com.eh.neighbor.board.service;

import java.util.List;

import com.eh.neighbor.board.service.vo.BoardVO;


public interface BoardService  {
	
	// Create
	void writeBoard(BoardVO boardVO);
	
	// Read
	List<BoardVO> selectBoard(BoardVO boardVO);
	int searchCount(BoardVO boardVO);
	BoardVO selectPrev(BoardVO boardVO);
	BoardVO selectNext(BoardVO boardVO);
	
	// Pagination
	List<BoardVO> prevPage(BoardVO boardVO);
	List<BoardVO> currPage(BoardVO boardVO);
	List<BoardVO> pageSize(BoardVO boardVO);
	List<BoardVO> firstPage(BoardVO boardVO);
	List<BoardVO> lastPage(BoardVO boardVO);
	
	// Update 
	void countBoard(BoardVO boardVO);
	BoardVO selectUpdate(BoardVO boardVO);
	void updateBoard(BoardVO boardVO);
	
	// Delete
	void deleteBoard(BoardVO boardVO);

}
