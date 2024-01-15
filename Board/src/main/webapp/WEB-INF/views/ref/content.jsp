<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="/css/base.css" />
</head>
<body>
<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1>게시판 상세보기</h1>
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container">
		
			<div class="table_grp">
				<div class="table_type_01">
					<table>
						<colgroup>
							<col style="width:120px;" />
							<col />
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">글번호</th>
								<td>${article.no}</td>
								<th scope="row">조회수</th>
								<td>${article.readcount}</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${article.id}</td>
								<th scope="row">작성일</th>
								<td>${article.regdate}</td>
							</tr>
							<tr>
								<th scope="row">글제목</th>
								<td colspan="3">${article.subject}</td>
							</tr>
							<tr>
								<th scope="row">글내용</th>
								<td colspan="3">${article.content}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_align_02">
	
					<span class="btn btnF_03 btnC_02 mr5">
						<input type="button" value="답글쓰기" 
						onclick="location.href='/ref/write?no=${article.no}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'" />
					</span>
					<span class="btn btnF_03 btnC_02">
						<input type="button" value="목록" onclick="location.href='../list'" />
					</span>		
				</div>
			
		</div>
	</div><!-- // container -->
</div><!-- // wrap -->
</body>
</html>