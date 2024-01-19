/**
 * 
 */
 
 
 /**
 * 
 */
 
 function inputCheck() {
	

	if(document.review_frm.rcontent.value.length == 0) {
		alert("한줄평에 리뷰내용을 입력해주세요");
		breg_frm.rcontent.focus();
		return;		
	}
	
	if(document.review_frm.ruser.value.length == 0) {
		alert("닉네임을 입력해주세요");
		breg_frm.rcontent.focus();
		return;		
	}
	
	if(document.review_frm.rcontent.value.length < 5) {
		alert("리뷰 내용은 5글자 이상 입력해주세요 ");
		breg_frm.rcontent.focus();
		return;		
	}
	
		if(document.review_frm.rcontent.value.length >40) {
		alert("리뷰내용은 40자 이하로 입력해주세요 ");
		breg_frm.rcontent.focus();
		return;		
	}
	
	
	document.review_frm.submit();

	
}
	
	
function qnaCheck() {
	
	if(document.qna_frm.qname.value.length == 0) {
		alert("성함을 입력해주세요");
		breg_frm.qname.focus();
		return;		
	}
	
	if(document.qna_frm.qtitle.value.length == 0) {
		alert("글제목을 입력해주세요");
		breg_frm.qtitle.focus();
		return;		
	}

	if(document.qna_frm.qcontent.value.length == 0) {
		alert("질문내용을 입력해주세요");
		breg_frm.qcontent.focus();
		return;		
	}
	
	if(document.qna_frm.qphone.value.length == 0) {
		alert("연락처를 입력해주세요");
		breg_frm.qphone.focus();
		return;		
	}
	
	else{
		alert("문의내용이 등록되었습니다. 확인 후 답변 드리겠습니다.");
		}	
	document.qna_frm.submit();
}	
	