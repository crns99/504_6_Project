<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@ taglib prefix="ui" uri="http://www.springframework.org/tags/ui" %> --%>

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
				<jsp:param name="title" value="공지사항 목록"/>
			</jsp:include>                     
		</header>
		<!-- //#header -->
		<div class="container">
			<!-- s : content -->
			<section id="content">
				<form name="frm" id="frm" action="<c:url value='/sym/bat/getBatchOpertList.do'/>" method="post">
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}' default="1"/>">
					
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
						<col style="width:20%" />
						<col style="width:10%" />
					</colgroup>
					<thead>
						<tr>
						   <th scope="col">번호</th>
						   <th scope="col">제목</th>
						   <th scope="col">작성자</th>
						   <th scope="col">작성일</th>
						   <th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(resultList) == 0}">
					        <tr>
					            <td colspan="5">
					            자료가 없습니다. 다른 검색조건을 선택해주세요.
					            </td>
					        </tr>
				        </c:if>
				        <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				        	<tr>
				                <td>
				                    <%-- <form name="item" method="post" action="<c:url value='/sym/bat/getBatchOpert.do'/>">
				                        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
				                        <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>">
				                        <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
				                        <input type="hidden" name="no" value="<c:out value='${resultInfo.no}'/>">
				                        <a href="javascript:fn_get_detail_view('<c:out value="${resultInfo.no}"/>');">${resultInfo.no}</a>
				                    </form> --%>
				                    <a href="javascript:fn_get_detail_view('<c:out value="${resultInfo.no}"/>');">${resultInfo.no}</a>
				                </td>
				                <td>${resultInfo.title}</td>
				                <td>${resultInfo.id}</td>
				                <td>${resultInfo.regdate}</td>
				                <td>0</td>
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
                <!-- 페이징 -->
                <div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>
                
				<div class="bbsBtnWrapRight">
					<a class="btnBlack" href="javascript:fn_get_regist_view();">등록</a>
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
	        document.frm.action = "<c:url value='/board/notice/boardList.do'/>";
	        document.frm.submit();
	    }
	
	    function fn_get_detail_view(batchOpertId) {
	    	document.frm.batchOpertId.value = batchOpertId;
	        document.frm.action = "<c:url value='/sym/bat/getBatchOpert.do'/>";
	        document.frm.submit();
	    }
	    /* ********************************************************
	     * 등록 처리 함수
	     ******************************************************** */
	    function fn_get_regist_view(){
	        document.frm.action = "<c:url value='/board/notice/boardwrite.do'/>";
	        document.frm.submit();
	    }
	</script>

</body>
</html>