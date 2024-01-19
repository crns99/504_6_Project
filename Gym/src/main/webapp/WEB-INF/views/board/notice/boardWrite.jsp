<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" >
	<title>게시글등록</title>
	<link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css">
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/resources/js/ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/validate.js'/>"></script>
</head>

<body>
	<div>
		<!-- #header -->
		<header id="header">
			<jsp:include page="../../com/top.jsp" >
				<jsp:param name="title" value="공지사항 등록"/>
			</jsp:include>                     
		</header>
		<!-- //#header --> 
		<div class="container">
			<!-- s : content -->
			<section id="content">
				<form name="write_form"  action="<c:url value='/sym/bat/addBatchOpert.do'/>" method="post">
					<!-- 검색조건 유지 -->
					<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}' default="1"/>"/>
					
					<table class="tblForm">
						<tbody>
							<tr>
								<th><span>*제목</span></th>
								<td style="text-align:left;"><input type="text" style="width:700px;" name="title" value="" maxlength="60" REQUIRED hname="제목"/></td>
							</tr>
							<tr>
								<th><span>*작성자</span></th>
								<td style="text-align:left;"><input type="text" style="width:700px;" name="id" value="" maxlength="255" REQUIRED hname="작성자"/></td>
							</tr>
							<tr>
								<th><span>*내용</span></th>
								<td style="text-align:left;">
									<textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 700px" REQUIRED hname="내용"></textarea></td>
							</tr>
						</tbody>
					</table>
					
					<div class="bbsBtnWrap"> 
						<a class="btnBlack" href="javascript:fn_save();"><span>저장</span></a>
						<a class="btnCancel" href="javascript:fn_get_list();"><span>목록</span></a> 
					</div>
				</form>
			</section>
		</div>
	</div>
		
	<script type="text/javaScript" language="javascript">

		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_get_list(){
			var frm = document.write_form;
			frm.action = "<c:url value='/board/notice/boardList.do'/>";
			frm.submit();    
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		function fn_save(){
			var frm = document.write_form;
			frm.action =  "<c:url value='/board/notice/saveboardwrite.do'/>";
			
		    if(confirm("저장하시겠습니까?")){
		    	if(!validate(frm)){            
		            return;
		        }else{
		        	frm.submit();
		        } 
		    }
		}
	</script>

</body>
</html>