package com.eh.neighbor.board.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eh.neighbor.board.service.BoardService;
import com.eh.neighbor.board.service.vo.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	// READ
	
	@RequestMapping("/")
	public String boardView(BoardVO boardVO, ModelMap model) throws Exception {
		List<BoardVO> selectBoard = boardService.selectBoard(boardVO);
		
		model.addAttribute("selectBoard", selectBoard);
		model.addAttribute("searchWritten", boardVO.getSearchWriter());
		
		return "/board/BoardList";
	}
	
	// Create
	
	@RequestMapping("/write")
	public String boardWrite(BoardVO boardVO, ModelMap model) throws Exception {
		
		return "/board/BoardWrite";
	}
	
	@ResponseBody
	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public Map<String, Object> boardWriteAction(BoardVO boardVO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boardService.writeBoard(boardVO);
		
		try {
			map.put("resultFlag", "1");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}
	
	// Update
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVO, ModelMap model) throws Exception {
		boardService.countBoard(boardVO);
		BoardVO selectUpdate = boardService.selectUpdate(boardVO);
		
		model.addAttribute("selectUpdate", selectUpdate);
		
		return "/board/BoardUpdate";
	}
	
	@RequestMapping(value = "/updateWrite", method = RequestMethod.POST)
	public String boardUpdateWrite(BoardVO boardVO, ModelMap model) throws Exception {
		
		BoardVO selectUpdate = boardService.selectUpdate(boardVO);
		model.addAttribute("selectUpdate", selectUpdate);
		
		return "/board/BoardUpdateWrite";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public Map<String, Object> boardUpdateAction(BoardVO boardVO, ModelMap model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boardService.updateBoard(boardVO);
		
		try {
			map.put("resultFlag", "1");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}
	
	// Delete
	@ResponseBody
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public Map<String, Object> boardDelete(BoardVO boardVO, ModelMap model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boardService.deleteBoard(boardVO);
		
		try {
			map.put("resultFlag", "1");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}
}
