package com.example.proj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.proj.service.FreeBoardService;
import com.example.proj.util.PaginationInfo;
import com.example.proj.vo.FreeBoardVO;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@SessionAttributes("user")
public class FreeBoardController {
	
	@Autowired
	FreeBoardService FreeboardService;
	
	//목록
	@RequestMapping("board/free/boardList.do")
	public String boardList(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<FreeBoardVO> resultList = FreeboardService.boardList(searchVO);				
		int totCnt = FreeboardService.boardCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		return "board/free/boardList";
	}
	
	//등록
	@RequestMapping("board/free/boardWrite.do")
	public String boardWrite(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		return "board/free/boardWrite";
	}
	
	//등록_저장
	@RequestMapping("board/free/boardWriteSave.do")
	public String boardWriteSave(FreeBoardVO freeboardvo){
		FreeboardService.boardWriteSave(freeboardvo);
		return "redirect:/board/free/boardList.do";	// 글목록;
	}
	
	//상세조회
	@RequestMapping("/board/free/boardDetail.do")
	public String boardDetail(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		FreeBoardVO boardDetail = FreeboardService.boardInfo(searchVO);
		
		//댓글조회도 추가
		List<FreeBoardVO> boardCommentList = FreeboardService.boardCommentList(searchVO);
		
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("commentList", boardCommentList);
		FreeboardService.boardAddView(searchVO);
		return "board/free/boardDetail";
	}
	
	//삭제 
	@RequestMapping("/baord/free/boardDelete.do")
	public String boardDelete(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		FreeboardService.boardDelete(searchVO);
		return "redirect:/board/free/boardList.do";	// 글목록;
	}
	
	//수정
	@RequestMapping("/board/free/boardUpdate.do")
	public String boardUpdate(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		FreeBoardVO boardDetail = FreeboardService.boardInfo(searchVO);
		model.addAttribute("boardDetail", boardDetail);
		return "/board/free/boardUpdate";
	}
	
	//수정_저장
	@RequestMapping("/board/free/boardUpdateSave.do")
	public String boardUpdateSave(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		FreeboardService.boardUpdateSave(searchVO);
		return "redirect:/board/free/boardList.do";	// 글목록;
	}
	
	//댓글 등록
	@RequestMapping("/board/free/boardComment.do")
	public String boardComment(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
		//댓글 insert
		FreeboardService.boardComment(searchVO);
		return "forward:/board/free/boardDetail.do";
	}
	
	//댓글 삭제
		@RequestMapping("/board/free/boardCommentDel.do")
		public String boardCommentDel(@ModelAttribute("searchVO") FreeBoardVO searchVO, ModelMap model) {
			//댓글 insert
			FreeboardService.boardCommentDel(searchVO);
			return "forward:/board/free/boardDetail.do";
		}
}