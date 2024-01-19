$(document).ready(function(){
	$('.menu > li').each(function(e){
		if ($(this).children('ul').length) {
			$(this).addClass('has-child');
		}
		if ($(this).hasClass('active')) {
			$(this).addClass('__open');
		}
	});

	$('.menu > li > a').on('click',function(e){		
		if ($(this).next('ul').length) {
			e.preventDefault();
			if ($(this).parent('li').hasClass('__open')) {
				$(this).parent('li').removeClass('__open');
			} else {
				$(this).parent('li').addClass('__open');
			}
		}
	});
	
	datepicker();
	
	var $tabList = $('.tablist li a'),
	$tabCont = $('.tab-cont');
	$('.tablist li').eq(0).addClass('active');
	$tabCont.hide();
	$tabCont.eq(0).show();
	$tabList.on('click', function (e) {
		e.preventDefault();
		$(this).parent('li').addClass('active').siblings('li').removeClass('active');
		$tabCont.hide();
		$($(this).attr('href')).show();
	});
	
	if ($('.timepicker').length) {
		$('.timepicker').timepicker({ 'timeFormat': 'H:i' });
	}	
});

function datepicker(){
	/* 캘린더 */
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		changeMonth: true,
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		monthNamesShort: ['1 월', '2 월', '3 월', '4 월', '5 월', '6 월', '7 월', '8 월', '9 월', '10 월', '11 월', '12 월'],
		monthNames: ['1 월', '2 월', '3 월', '4 월', '5 월', '6 월', '7 월', '8 월', '9 월', '10 월', '11 월', '12 월'],
		weekHeader: 'Wk',
		dateFormat: 'yy/mm/dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: ' 년',
		showOn: 'both',
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-99:c+99'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	var datepicker_default = {
		showOn: 'both',
		buttonText: "달력",
		currentText: "이번달",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: false,
		yearRange: 'c-99:c+99',
		showOtherMonths: true,
		selectOtherMonths: true
	}

	datepicker_default.closeText = "선택";
	datepicker_default.dateFormat = "yy-mm-dd";
	datepicker_default.buttonImageOnly = false;
	datepicker_default.buttonImage = 'images/icon_calendar.png';
	datepicker_default.buttonImageOnly = true;

	var $datePicker = $('.datepicker');
	$datePicker.each(function(){
		$(this).datepicker(datepicker_default);
	});
}

