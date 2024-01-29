package com.example.proj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.proj.dao.BoardDao;
import com.example.proj.dao.FreeBoardDao;
import com.example.proj.vo.BoardVO;
import com.example.proj.vo.FreeBoardVO;

@Service
public class FreeBoardService {
	
	@Autowired
	FreeBoardDao dao;
	
	//게시글 리스트
	public List<FreeBoardVO> boardList(FreeBoardVO searchVO){
		return dao.boardList(searchVO);
	}
	//전체 게시글 개수
	public int boardCnt(FreeBoardVO searchVO) {
		return dao.boardCnt(searchVO);
	}	
	//게시글 저장
	public int boardWriteSave(FreeBoardVO freeboardVO) {
		return dao.boardWriteSave(freeboardVO);
	}
	
	public FreeBoardVO boardInfo(FreeBoardVO searchVO) {
		return dao.boardInfo(searchVO);
	}
	
	//조회수
	public void boardAddView(FreeBoardVO searchVO) {
		dao.boardAddView(searchVO);
	}
	
	//삭제
	public void boardDelete(FreeBoardVO searchVO) {
		dao.boardDelete(searchVO);
	}
	
	//수정_저장
	public void boardUpdateSave(FreeBoardVO searchVO) {
		dao.boardUpdateSave(searchVO);
	}
	public List<FreeBoardVO> boardCommentList(FreeBoardVO searchVO) {
		return dao.boardCommentList(searchVO);
	}
	public void boardComment(FreeBoardVO searchVO) {
		dao.boardComment(searchVO);	
	}
	public void boardCommentDel(FreeBoardVO searchVO) {
		dao.boardCommentDel(searchVO);	
	}
}