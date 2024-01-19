/**
 * 
 */
 
function reservationListCheck() {
	
	if(document.reservationList_frm.name.value.length == 0) {
		alert("예약자명은 필수입력사항입니다");
		reservationList_frm.name.focus();
		return;		
	}
	
	if(document.reservationList_frm.rguest.value.length == 0) {
		alert("게스트는 필수 입력사항입니다.");
		reservationList_frm.rguest.focus();
		return;		
	}
	
	document.reservationList_frm.submit();
	
}