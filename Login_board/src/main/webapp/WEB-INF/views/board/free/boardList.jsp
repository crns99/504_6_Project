<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>공지사항 목록조회</title>
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
				<jsp:param name="title" value="자유게시판 목록"/>
			</jsp:include>                     
		</header>
		<!-- //#header -->
		<div class="container">
			<!-- s : content -->
			<section id="content">
				<form name="frm" id="frm" action="<c:url value='/board/free/boardList.do'/>" method="post">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default="1"/>">
					<%-- <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>">
				    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"> --%>
				    <input type="hidden" name="board_id" value="">
					
					<div class="topSearchArea">
						<ul class="topSearch">
							<li class="condition">
								<div class="labelInfoTitle">
									<select name="searchCondition">
						      			<option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if> >제목</option>
										<option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if> >작성자</option>
						            </select>
								</div>
							</li>
							<li class="condition">
								<div class="labelInfoTitle">
									<input type="text" name="searchKeyword" value='<c:out value="${searchVO.searchKeyword}"/>' size="35" onkeypress="press(event);" title="검색키워드" />
								</div>
							</li>
							<li class="condition">
								<div class="btnInline"><a class="btnGray" href="javascript:fn_get_list('1');"><span>조회</span></a></div>
							</li>
						</ul>
					</div>
				</form>
				
				<table class="tblList1">
					<colgroup>
						<col style="width:10%" />
						<col style="width:40%" />
						<col style="width:20%" />
						<col style="width:16%" />
						<col style="width:14%" />
						<%-- <col style="width:7%" /> --%>
					</colgroup>
					<thead>
						<tr>
						   <th scope="col">번호</th>
						   <th scope="col">제목</th>
						   <th scope="col">작성자</th>
						   <th scope="col">작성일</th>
						   <th scope="col">조회수</th>
						   <!-- <th scope="col">좋아요</th> -->
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(resultList) == 0}">
					        <tr>
					            <td colspan="6">
					            게시글이 없습니다.
					            </td>
					        </tr>
				        </c:if>
				        <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				        	<tr>
				                <td>
				                    <%-- <form name="item" method="post" action="<c:url value='/board/notice/boardList.do'/>">
				                        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
				                        <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>">
				                        <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
				                        <input type="hidden" name="no" value="<c:out value='${resultInfo.no}'/>">
				                        <a href="javascript:fn_get_detail_view('<c:out value="${resultInfo.no}"/>');">${resultInfo.no}</a>
				                        <a href="javascript:fn_get_detail_view('${resultInfo.no}');">${resultInfo.no}</a>
				                    </form> --%>
				                    <a href="javascript:fn_get_detail_view('${resultInfo.board_id}');"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></a>
				                    
				                </td>
				                <td><a href="javascript:fn_get_detail_view('${resultInfo.board_id}');">${resultInfo.title}</a></td>
				                <td>${resultInfo.reg_user_id}</td>
				                <td><fmt:formatDate value="${resultInfo.reg_date}" pattern="yyyy-MM-dd" /></td>
				                <td>${resultInfo.view_cnt}</td>
				                <%-- <td>${resultInfo.like_cnt}</td> --%>
				          </tr>
				        </c:forEach>
					</tbody>
				</table>
				<!-- 페이지 네비게이션 시작 -->
                <%-- <div id="paging_div">
                    <ul class="paging_align">
                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_get_list" />    
                    </ul>
                </div> --%>
                <!-- //페이지 네비게이션 끝 --> 
                <!-- pagination{s} -->
                	
				<div id="paginationBox" style="width:100%;">
					<ul class="pagination" style="text-align:center;padding-top:16px;">
						<c:if test="${paginationInfo.currentPageNo > paginationInfo.pageSize }">
							<li class="page-item" >
								<%-- <a class="page-link" href="#" onClick="fn_egov_select_noticeList('${paginationInfo.firstPageNoOnPageList-1}')">Previous</a> --%>
									<a class="page-link" href="#" onClick="fn_get_list('${paginationInfo.firstPageNoOnPageList-1}')">
										<img src="/resources/images/icon/icon_prev.gif" border="0">
									</a>
							</li>			
						</c:if>
									
						<c:forEach begin="${paginationInfo.firstPageNoOnPageList}" end="${paginationInfo.lastPageNoOnPageList}" var="idx">
							<c:if test="${paginationInfo.currentPageNo == idx}">
								<li class="page-item" ><strong style="color:#0989a5;font-weight:bold;"> ${idx}</strong> </li>
							</c:if>
							<c:if test="${paginationInfo.currentPageNo != idx}">
								<li class="page-item" ><a class="page-link" href="#" onClick="fn_get_list('${idx}')"> ${idx} </a></li>
							</c:if>
						</c:forEach>
									
						<c:if test="${paginationInfo.lastPageNoOnPageList != paginationInfo.totalPageCount}">
							<li class="page-item">
								<%-- <a class="page-link" href="#" onClick="fn_egov_select_noticeList('${paginationInfo.lastPageNoOnPageList+1}')">Next</a> --%>
								<a class="page-link" href="#" onClick="fn_get_list('${paginationInfo.lastPageNoOnPageList+1}')">
									<img src="/resources/images/icon/icon_next.gif" border="0">
								</a>
							</li>
						</c:if>		
					</ul>	
				</div>	
							<!-- pagination{e} -->
				<div class="bbsBtnWrapRight">
					<c:if test="${user.id != null && user.id != ''}">
						<a class="btnBlack" href="javascript:fn_get_regist_view();">등록</a>
					</c:if>
				</div>
			</section>
			<!-- e : content -->
		</div>
	</div>
		
	<script type="text/javascript">
	    /* OK */
	    function press(event) {
	        if (event.keyCode==13) {
	            fn_get_list('1');
	        }
	    }
	
	    function fn_get_list(pageNo) {
	        if (document.frm.searchKeyword.value != "") {
	            if (document.frm.searchCondition.value == "") {
	                alert("검색조건을 선택하세요."); //검색조건을 선택하세요.
	                return;
	            }
	        }
	        document.frm.pageIndex.value = pageNo;
	        document.frm.action = "<c:url value='/board/free/boardList.do'/>";
	        document.frm.submit();
	    }
		/* 상세 */
	     function fn_get_detail_view(boardNo){
			var frm = document.frm;
		
			frm.board_id.value = boardNo;
			frm.target= "_self";
			frm.action="<c:url value='/board/free/boardDetail.do'/>";
			frm.submit();
		} 
	     
	    /* 등록 처리 함수 */
	    function fn_get_regist_view(){
	        document.frm.action = "<c:url value='/board/free/boardWrite.do'/>";
	        document.frm.submit();
	    }
	    
	</script>

</body>
</html>