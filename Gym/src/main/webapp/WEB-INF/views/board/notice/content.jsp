<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
<style>
#container {width: 70%;}
table{width: 100%;}
</style>
</head>
<body>
<div id="container">
<table border="1">
	<tr><td>제목</td><td>${resultInfo.title}</td></tr>
	<tr><td>작성자</td><td>${resultInfo.id}</td></tr>
	<tr><td>내용</td><td>${resultInfo.content}</td></tr>
	<tr><td>등록일</td><td><fmt:formatDate value="${resultInfo.regdate }" dateStyle="long"/></td></tr>
	<tr><td>조회수</td><td>${fn:escapeXml(resultInfo.readcount) }</td></tr>
	<tr><td colspan="2" align="right">
	
	<c:if test="${ user.id == dto.id }">
		<a href="/board/update/${dto.no}">글 수정 </a> 
		<a id="${dto.no}" href="#">글 삭제</a>
	</c:if>
	
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<!--  cList : List<CommDto>-->
<div>
	<div id="comm">
	<c:forEach items="${cList}" var="comm">
		<div title="${comm.cno}">
		<div>${comm.id} / <fmt:formatDate value="${comm.regdate }" dateStyle="short"/></div>
		<div>${comm.content} 
		<c:if test="${comm.id == user.id }">
		<button class="dbtn" id="${comm.cno}">삭제</button>
		</c:if>
		</div>
		<hr>
		</div>
	</c:forEach>
	</div>
	<input name="content" id="content"><button id="add">등록</button>
</div><!-- #comm -->
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");// 글번호
			$.ajax({url:"/board/delete", 
					data:"no="+no, 
					method:"delete"
					}
			).done(function(){
				location.href="/board/list";
			})
			return false;//하이퍼링크 이동 X
		})//click
		
		$("#add").click(function(){
			let id = "${user.id}"; // 세션에 저장된 id값
			let content = $("#content").val();
			let no = ${dto.no};
			
			$.ajax({url:"/comm/insert",
					data:"no="+no+"&id="+id+"&content="+content,
					method:"get",
					dataType:"json"
			}).done(function(resp){
					//location.reload();
					//console.log(resp);
					let clist = "";
					resp.forEach(function(comm,index){
			  			clist += "<div title="+comm.cno+"><div>"+comm.id+" / "+new Date(comm.regdate).toLocaleDateString()
						+"</div><div>"+comm.content;
						if(id == comm.id){
							clist +='<button class="dbtn" id="'+comm.cno+'">삭제</button>';
						}
						clist+="</div><hr></div>";
					});
					
					$("#comm").html(clist);
					$("#content").val("");
				});
			
		})//click
		$("#comm").on("click",".dbtn",function(){
			let cno = $(this).attr("id");
			$.ajax({url:"/comm/delete/"+cno,
				method:"delete"
		}).done(function(cno){
				//location.reload();		
				$("[title="+cno+"]").remove();	
			});
			
		})//click
	})//ready

</script>
</body>
</html>