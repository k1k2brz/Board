package com.eh.neighbor.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.eh.neighbor.board.service.BoardService;
import com.eh.neighbor.board.service.mapper.BoardMapper;
import com.eh.neighbor.board.service.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public void writeBoard(BoardVO boardVO) {
		System.out.print("VO ============>"+boardVO);
		boardMapper.writeBoard(boardVO);
	}
	
	@Override
	public List<BoardVO> selectBoard(BoardVO boardVO) {
		return boardMapper.selectBoard(boardVO);
	}
	
	
	@Override
	public int searchCount(BoardVO boardVO) {
		return boardMapper.searchCount(boardVO);
	}

	@Override
	public BoardVO selectPrev(BoardVO boardVO) {
		return boardMapper.selectPrev(boardVO);
	}
	
	@Override
	public BoardVO selectNext(BoardVO boardVO) {
		return boardMapper.selectNext(boardVO);
	}
	
	@Override
	public BoardVO selectUpdate(BoardVO boardVO) {
		return boardMapper.selectUpdate(boardVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		boardMapper.updateBoard(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardMapper.deleteBoard(boardVO);
	}

	@Override
	public void countBoard(BoardVO boardVO) {
		boardMapper.countBoard(boardVO);
	}
}
