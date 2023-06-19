package com.eh.neighbor.board.service.mapper;

import java.util.List;

import com.eh.neighbor.board.service.vo.BoardVO;

public interface BoardMapper {
	
	public void writeBoard(BoardVO boardVO);
	
	public List<BoardVO> selectBoard(BoardVO boardVO);
	public int searchCount(BoardVO boardVO);
	
	public BoardVO selectUpdate(BoardVO boardVO);
	public BoardVO selectPrev(BoardVO boardVO);
	public BoardVO selectNext(BoardVO boardVO);
	public void countBoard(BoardVO boardVO);
	
	public List<BoardVO> prevPage(BoardVO boardVO);
	public List<BoardVO> currPage(BoardVO boardVO);
	public List<BoardVO> pageSize(BoardVO boardVO);
	public List<BoardVO> firstPage(BoardVO boardVO);
	public List<BoardVO> lastPage(BoardVO boardVO);
	
	public void updateBoard(BoardVO boardVO);
	public void deleteBoard(BoardVO boardVO);
}
