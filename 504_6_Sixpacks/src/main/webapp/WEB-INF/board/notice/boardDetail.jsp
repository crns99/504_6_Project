<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- <%pageContext.setAttribute("crlf", "\r\n"); %> --%>

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
				<form name="detail_form"  id="boardDetailForm" action="<c:url value='/baord/notice/BoardDetail.do'/>" method="post">
					<input name="no" type="hidden" value="<c:out value='${searchVO.no}'/>"/>
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
								<td style="text-align:left;"><fmt:formatDate value="${boardDetail.regdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th><span>작성자</span></th>
								<td style="text-align:left;"><c:out value="${boardDetail.id}" /></td>
							</tr>
							<tr>
								<th><span>내용</span></th>
								<td style="text-align:left;"><c:out value="${boardDetail.content}" escapeXml="false" /></td>
							</tr>
						</tbody>
					</table>
					
					
					<div class="bbsBtnWrap"> 
						<a class="btnBlack" href="javascript:fn_update_view();"><span>수정</span></a>
						<!-- <a class="btnBlack" href="javascript:fn_delete();"><span>삭제</span></a> -->
						<a class="btnCancel" href="javascript:fn_list();"><span>목록</span></a> 
					</div>
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
			
			frm.action = "<c:url value='/board/notice/boardList.do'/>";
			frm.submit()
		}
		/* ********************************************************
		 * 수정화면으로  바로가기
		 ******************************************************** */
		 function fn_update_view(){
			var frm = document.detail_form;
		    
			frm.action = "<c:url value='/baord/notice/boardUpdate.do'/>";
			frm.submit();
		} 
		/* ********************************************************
		 * 삭제 처리
		 ******************************************************** */
		/*  function fn_delete(){
			var frm = document.detail_form;
			 
			if(confirm("삭제하시겠습니까?")){
				frm.action = "<c:url value='/sym/bat/deleteBatchOpert.do'/>";
				frm.submit();
			} 
		}*/
	</script>
	
</body>
</head>