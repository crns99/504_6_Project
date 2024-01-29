package com.login.board.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.login.board.vo.FreeBoardVO;

@Mapper
public interface FreeBoardDao {
	List<FreeBoardVO> boardList(FreeBoardVO searchVO);			//목록
	int boardCnt(FreeBoardVO searchVO);							//전체 글 개수
	
	int boardWriteSave(FreeBoardVO freeboardVO);				//등록_저장
	
	FreeBoardVO boardInfo(FreeBoardVO searchVO);
	void boardAddView(FreeBoardVO searchVO);					//조회수
	void boardDelete(FreeBoardVO searchVO);						//게시글_삭제
		
	void boardUpdateSave(FreeBoardVO searchVO);					//수정_저장
	
	List<FreeBoardVO> boardCommentList(FreeBoardVO searchVO);	//댓글_목록
	void boardComment(FreeBoardVO searchVO);					//댓글_저장
	void boardCommentDel(FreeBoardVO searchVO);					//댓글_저장
}