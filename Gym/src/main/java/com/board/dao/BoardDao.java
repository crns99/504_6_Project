package com.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.vo.BoardVO;

@Mapper
public interface BoardDao {

	int insert(BoardVO vo);
	List<BoardVO> noticeBoardList(BoardVO searchVO);
	int noticeBoardCount(BoardVO searchVO);//전체 글 개수
	BoardVO boardDetail(BoardVO searchVO);

//	BoardDto boardOne(int no);
//	int updateBoard(BoardDto dto);
//	int deleteBoard(int no);
	

//	List<BoardDto> boardListSearch(Map<String, Object> m);
//	int countSearch(Map<String, Object> m);//검색 글 갯수
//	
//	int addReadcount(int no);//조회수 증가

//	List<BoardVO> noticeBoardList();	
	
}