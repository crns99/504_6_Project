<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- <%pageContext.setAttribute("crlf", "<br>"); %> --%>

<% pageContext.setAttribute("LF", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" >
	<title>게시글 상세조회</title>
	<link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/resources/js/ui.js'/>"></script>
</head>

<body>
	<div>
		<!-- #header -->
		<header id="header">
			<jsp:include page="../../com/top.jsp" >
				<jsp:param name="title" value="게시판 상세 페이지"/>
			</jsp:include>                     
		</header>
		<!-- //#header --> 
		
		<div class="container">
			<!-- s : content -->
			<section id="content">
				<form name="detail_form"  id="boardDetailForm" action="<c:url value='/baord/free/BoardDetail.do'/>" method="post">
					<input name="board_id" type="hidden" value="<c:out value='${searchVO.board_id}'/>"/>
					<input name="comment_user_id"  type="hidden" value="<c:out value='${user.id}'/>"/>
					<input name="comment_id"  type="hidden" value=""/>
				    <!-- 검색조건 유지 -->
				    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
				    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
				    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default="1"/>"/>
				    
				    <table class="tblForm">
					    <tbody>
							<tr>
								<th><span>제목</span></th>
								<td style="text-align:left;"><c:out value="${boardDetail.title}" /></td>
							</tr>
							<tr>
								<th><span>작성일자</span></th>
								<td style="text-align:left;"><fmt:formatDate value="${boardDetail.reg_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th><span>작성자</span></th>
								<td style="text-align:left;"><c:out value="${boardDetail.reg_user_id}" /></td>
							</tr>
							<tr>
								<th><span>내용</span></th>
								<td style="text-align:left;"><c:out escapeXml = "false" value = "${fn:replace(boardDetail.content, LF, '<br>')}" /></td>
							</tr>
						</tbody>
					</table>
					
					
					<div class="bbsBtnWrap"> 
						<c:if test="${user.id == boardDetail.reg_user_id}">
							<a class="btnBlack" href="javascript:fn_update_view();"><span>수정</span></a>
							<a class="btnBlack" href="javascript:fn_delete();"><span>삭제</span></a>
						</c:if>	
						<a class="btnCancel" href="javascript:fn_list();"><span>목록</span></a> 
					</div>
					
					<c:if test="${user.id != null && user.id != ''}">
						<table class="tblForm" >
						    <tbody>
								<tr>
									<td style="text-align:left">
										<textarea name="comment" id="comment" style="width:100%" rows="2" cols="10"  hname="댓글"></textarea>
									</td>
									<td style="width:100px">
										<a class="btnBlack" href="javascript:fn_insert_comment();"><span>입력</span></a>
									</td>
								</tr>
							</tbody>
						</table>
					</c:if>
					
						<table class="tblForm" style="margin-top:5px">
						    <tbody>
						    	<c:forEach items="${commentList}" var="comment" varStatus="status">
						    		<tr>
										<td style="text-align:left">
											작성 ID : ${comment.comment_user_id}&nbsp;&nbsp;&nbsp;
											등록일시 : ${comment.com_reg_date}&nbsp;
											<c:if test="${user.id == comment.comment_user_id}">
												<a class="btnBlack" href="javascript:fn_delete_comment('${comment.comment_id}');">삭제</a>
											</c:if></br>
											${comment.comment}
										</td>
									</tr>
						    	</c:forEach>
						    	
								<!-- <tr>
									<td style="text-align:left">
										작성자 : 등록일시 : 삭제버튼 </br>
										대글내용
									</td>
								</tr>
								<tr>
									<td style="text-align:left">
										작성자 : 등록일시 : 삭제버튼 </br>
										대글내용
									</td>
								</tr>
								<tr>
									<td style="text-align:left">
										작성자 : 등록일시 : 삭제버튼 </br>
										대글내용
									</td>
								</tr>
								<tr>
									<td style="text-align:left">
										작성자 : 등록일시 : 삭제버튼 </br>
										대글내용
									</td>
								</tr> -->
							</tbody>
						</table>

				</form>
			</section>
		</div>
	</div>
	
	<script type="text/javaScript" language="javascript">

		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_list(){
			var frm = document.detail_form;
			
			frm.action = "<c:url value='/board/free/boardList.do'/>";
			frm.submit()
		}
		/* ********************************************************
		 * 수정화면으로  바로가기
		 ******************************************************** */
		 function fn_update_view(){
			var frm = document.detail_form;
		    
			frm.action = "<c:url value='/board/free/boardUpdate.do'/>";
			frm.submit();
		} 
		/* ********************************************************
		 * 삭제 처리
		 ******************************************************** */
		function fn_delete(){
			var frm = document.detail_form;
			 
			if(confirm("삭제하시겠습니까?")){
				frm.action = "<c:url value='/baord/free/boardDelete.do'/>";
				frm.submit();
			} 
		}
		
		/* ********************************************************
		 * 댓글등록
		 ******************************************************** */
		function fn_insert_comment(){
			var frm = document.detail_form;
			
			if(confirm("댓글을 등록하시겠습니까?")){
				
				var comment = frm.comment.value;
				
				if(comment == ""){
					alert("댓글을 입력하세요");
					frm.comment.focus;
					return;
				}
				
				frm.action = "<c:url value='/board/free/boardComment.do'/>";
				frm.submit();
			} 
		}
		/* ********************************************************
		 * 댓글삭제
		 ******************************************************** */
		function fn_delete_comment(comment_id){
			if(confirm("댓글을 삭제하시겠습니까?")){
				var frm = document.detail_form;
				
				frm.comment_id.value = comment_id;
				frm.action = "<c:url value='/board/free/boardCommentDel.do'/>";
				frm.submit();
			} 
		}
	</script>
	
</body>
</head>