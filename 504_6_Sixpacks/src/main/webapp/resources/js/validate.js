//////////////////////////////////////////////////////////////////////////
// validator
// 폼객체 유효성 검사 
//
// 
///////////////////////////////////////////////////////////////////////////

/// 에러메시지 포멧 정의 ///
	var NO_BLANK = "{name+을를} 입력하여 주십시오";
	var NO_SELECT = "{name+을를} 선택하여주십시오";
	var NOT_VALID = "{name+이가} 올바르지 않습니다";
	var TOO_LONG = "{name}의 길이가 초과되었습니다 (최대 {maxbyte}바이트)";
	var TOO_SHORT = "{name}의 길이가 부족합니다 (최소 {minbyte}바이트)";
	var NO_MAX = "{name}의 길이가 초과되었습니다 (최대 {maxbyte}글자)";
	var NO_MIN = "{name}의 길이가 부족합니다 (최대 {minbyte}글자)";
	var NO_MAXVALUE = "{name}의 값이 초과되었습니다.(최대 {minbyte} 이하)";
	var NO_MINVALUE = "{name}의 값이 작습니다.(최소 {minbyte} 이상)";
	
	
/// 스트링 객체에 메소드 추가 ///
	String.prototype.trim = function(str) { 
		str = this != window ? this : str; 
		return str.replace(/^\s+/g,'').replace(/\s+$/g,''); 
	}
	
	String.prototype.hasFinalConsonant = function(str) {
		str = this != window ? this : str; 
		var strTemp = str.substr(str.length-1);
		return ((strTemp.charCodeAt(0)-16)%28!=0);
	}

	function josa(str,tail) {
		return (str.hasFinalConsonant()) ? tail.substring(0,1) : tail.substring(1,2);
	}
	
	
	function validate(form) {
		var i=0;

		for (i = 0; i < form.elements.length; i++ ) {

			var el = form.elements[i];
			if(el.tagName.toUpperCase() != "OBJECT") {
				if(el.type.indexOf("select")== -1 && el.type.indexOf("file")== -1) el.value = el.value.trim();
				
				if (el.getAttribute("REQUIRED") != null) {
					//select 구문 처리
					if(el.type.indexOf("select")>-1){
						//|| el.option[el.selectedIndex].value == ""
						if (el.selectedIndex==0 ) {
							return doError(el,NO_SELECT);
						}
					}else{
						if (el.value == null || el.value == "") {
							return doError(el,NO_BLANK);
						}
					}
				}
				
				if (el.getAttribute("MINVALUE") != null && el.value != "") {
					if (el.value < parseInt(el.getAttribute("MINVALUE"))) {
						return doError(el,NO_MINVALUE,"",parseInt(el.getAttribute("MINVALUE")));
					}
				}
				if (el.getAttribute("MAXVALUE") != null && el.value != "") {
					if (el.value > parseInt(el.getAttribute("MAXVALUE"))) {
						return doError(el,NO_MAXVALUE,"",parseInt(el.getAttribute("MAXVALUE")));
					}
				}
				
				//1024 = 1000,2000 = 1330, 1024 이하는 db길이 그대로
				if (el.getAttribute("MAXLEN") != null && el.value != "") {
					if (el.value.length > parseInt(el.getAttribute("MAXLEN"))) {
						return doError(el,NO_MAX,"",el.value.length);
					}
				}
	
				if (el.getAttribute("MINLEN") != null && el.value != "") {
					var len = 0;
					if (el.value.length < parseInt(el.getAttribute("MINLEN"))) {
						return doError(el,NO_MIN,"",el.value.length);
					}
				}
	
				if (el.getAttribute("MAXBYTE") != null && el.value != "") {
					var len = el.value.length;
					var max_len = parseInt(el.getAttribute("MAXBYTE")) / 2;
	
					if (len > max_len) {
						maxbyte = el.getAttribute("MAXBYTE");
						return doError(el,NO_MAX,"",max_len);
					}
				}
				if (el.getAttribute("MINBYTE") != null && el.value != "") {
					var len = 0;
					for(j=0; j<el.value.length; j++) {
						var str = el.value.charAt(j);
						len += (str.charCodeAt() > 128) ? 2 : 1
					}
					if (len < parseInt(el.getAttribute("MINBYTE"))) {
						minbyte = el.getAttribute("MINBYTE");
						return doError(el,TOO_SHORT,"",minbyte);
					}
				}
		
				if (el.getAttribute("OPTION") != null && el.value != "") {
					if (!funcs[el.getAttribute("OPTION").toLowerCase()](el)) return false;
				}
		
				if (el.getAttribute("FILETYPE") != null && el.value != "") {
					var validFileType = el.getAttribute("FILETYPE").split(";");
					var nFileType = el.value.substring(el.value.lastIndexOf(".")+1,el.length);
					var isValidFileType = false;
					for (j=0; j<validFileType.length ; j++) {
						if (nFileType.toUpperCase()==validFileType[j].toUpperCase().replace(/\s/g,"")) {
							isValidFileType = true;
						}
					}
					if (isValidFileType) {
						var nameString = "";
						if (el.getAttribute("hname") != null && el.getAttribute("hname") != "") {
							nameString = "{name+이가} ";
						}
						return doError(el,nameString+"적절한 파일 포맷이 아닙니다.\n(사용 불가 포맷 형식 : "+el.getAttribute("FILETYPE")+")");
					}
				}
				
				if (el.getAttribute("IMGFILETYPE") != null && el.value != "") {
					var validFileType = el.getAttribute("IMGFILETYPE").split(";");
					var nFileType = el.value.substring(el.value.lastIndexOf(".")+1,el.length);
					var isValidFileType = false;
					for (j=0; j<validFileType.length ; j++) {
						if (nFileType.toUpperCase()==validFileType[j].toUpperCase().replace(/\s/g,"")) {
							isValidFileType = true;
						}
					}
					if (!isValidFileType) {
						var nameString = "";
						if (el.getAttribute("hname") != null && el.getAttribute("hname") != "") {
							nameString = "{name+이가} ";
						}
						return doError(el,nameString+"적절한 파일 포맷이 아닙니다.\n(사용 가능 포맷 형식 : "+el.getAttribute("IMGFILETYPE")+")");
					}
				}
			}
		}
		return true;
	}
	
	function doError(el,type,action,byte) {
		var pattern = /{([a-zA-Z0-9_]+)\+?([가-힣]{2})?}/;
		var name = (hname = el.getAttribute("HNAME")) ? hname : el.getAttribute("NAME");
		pattern.exec(type);
		var tail = (RegExp.$2) ? josa(eval(RegExp.$1),RegExp.$2) : "";
		alert(type.replace(pattern,eval(RegExp.$1) + tail).replace(pattern,byte));
		if (action == "sel") {
			el.select();
		} else if (action == "del")	{
			el.value = "";
		}
		if (el.getAttribute("UNFOCUSED") == null) {
			if(el.type!="hidden"&&el.style.display.toUpperCase()!="NONE"){
				try{el.focus();}catch(e){}
			}
		}	
		return false;
	}	
	
	/// 특수 패턴 검사 함수 매핑 ///
	var funcs = new Array();
	funcs['nospace'] = isNoSpace;
	funcs['email'] = isValidEmail;
	funcs['emailfirst'] = isValidEmailFirst;
	funcs['phone'] = isValidPhone;
	funcs['userid'] = isValidUserid;
	funcs['hangul'] = hasHangul;
	funcs['number'] = isNumeric;
	funcs['number2'] = isNumeric2;
	funcs['engonly'] = alphaOnly;
	funcs['hangulonly'] = hangulOnly;
	funcs['jumin'] = isValidJumin;
	funcs['bizno'] = isValidBizNo;
	funcs['date'] = isValidDate;
	funcs['pw'] = isValidPassword;
	
	/// 패턴 검사 함수들 ///
	function isNoSpace(el) {
		var pattern = /[\s]/;
		return (!pattern.test(el.value)) ? true : doError(el,"{name+은는} 띄어쓰기 없이 입력해주시기 바랍니다");
	}
	
	function isValidEmail(el) {
		var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
		return (pattern.test(el.value)) ? true : doError(el,NOT_VALID);
	}
	
	function isValidEmailFirst(el) {
		var pattern = /^[_a-zA-Z0-9-\.]+$/;
		return (pattern.test(el.value)) ? true : doError(el,NOT_VALID);
	}
	
	
	
	//수정 필요
	function isValidUserid(el) {
		var pattern = /^[a-zA-Z]{1}[a-zA-Z0-9_]{3,11}$/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 4자이상 12자 미만이어야 하고,\n 영문,숫자, _ 문자만 사용할 수 있습니다");
	}
	
	function hasHangul(el) {
		var pattern = /[가-힣]/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 반드시 한글을 포함해야 합니다");
	}
	function hangulOnly(el) {
		var pattern = /^[가-힣]+$/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 한글만 입력가능 합니다");
	}
	
	function alphaOnly(el) {
		var pattern = /^[a-zA-Z]+$/;
		return (pattern.test(el.value)) ? true : doError(el,NOT_VALID);
	}
	
	function isNumeric(el) {
		var pattern = /^[0-9]+$/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 반드시 숫자로만 입력해야 합니다");
	}
	
	function isNumeric2(el) {
		var pattern = /^[0-9,.]+$/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 반드시 숫자로만 입력해야 합니다");
	}
	
	
	function isValidJumin(el) {
	    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
		var num = el.value;
	    if (!pattern.test(num)) return doError(el,NOT_VALID); 
	    num = RegExp.$1 + RegExp.$2;
	
		var sum = 0;
		var last = num.charCodeAt(12) - 0x30;
		var bases = "234567892345";
		for (var i=0; i<12; i++) {
			if (isNaN(num.substring(i,i+1))) return doError(el,NOT_VALID);
			sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
		}
		var mod = sum % 11;
		return ((11 - mod) % 10 == last) ? true : doError(el,NOT_VALID);
	}
	
	function isValidBizNo(el) { 
		var pattern = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/; 
		var num = el.value;
	    if (!pattern.test(num)) return doError(el,NOT_VALID); 
	    num = RegExp.$1 + RegExp.$2 + RegExp.$3;
	    var cVal = 0; 
	    for (var i=0; i<8; i++) { 
	        var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : ( _tmp  == 1 ) ? 3 : 7); 
	        cVal += (parseFloat(num.substring(i,i+1)) * cKeyNum) % 10; 
	    } 
	    var li_temp = parseFloat(num.substring(i,i+1)) * 5 + '0'; 
	    cVal += parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2)); 
	    return (parseInt(num.substring(9,10)) == 10-(cVal % 10)%10) ? true : doError(el,NOT_VALID); 
	}
	
	/*
	function isValidPhone(el) {
		var pattern = /^([0]{1}[0-9]{1,2})-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;
		if (pattern.exec(el.value)) {
			if(RegExp.$1 == "011" || RegExp.$1 == "016" || RegExp.$1 == "017" || RegExp.$1 == "018" || RegExp.$1 == "019") {
				el.value = RegExp.$1 + "-" + RegExp.$2 + "-" + RegExp.$3;
			}
			return true;
		} else {
			return doError(el,NOT_VALID);
		}
	}
	*/
	
	function isValidPhone(el) {
		var pattern = /^[0-9-]+$/;
		return (pattern.test(el.value)) ? true : doError(el,"{name+은는} 반드시 숫자로만 입력해야 합니다");
	}
	
	function isValidDate(el) {
		var oDateStr = el.value;
	
		var oDate = new Date(oDateStr.substr(0,4),oDateStr.substr(4,2)-1,oDateStr.substr(6,2));
	
		var oYearStr=oDate.getFullYear();
	
		var oMonthStr=(oDate.getMonth()+1).toString();
			
		oMonthStr = (oMonthStr.length ==1) ? "0"+ oMonthStr: oMonthStr; 
		var oDayStr=oDate.getDate().toString();
		oDayStr = (oDayStr.length ==1) ? "0"+ oDayStr: oDayStr; 
	
		return  (oDateStr == oYearStr+oMonthStr+oDayStr) ? true : doError(el,NOT_VALID); 
	}
	
	function isValidPassword(el) {
		var pattern = /^[A-Za-z0-9_\-\!@#]{4,12}$/;
		return (pattern.test(el.value)) ? true : doError(el,"비밀번호가 올바르지 않습니다.\n비밀번호는 4자이상 12자 이하의 영문, 숫자, 특수문자만 사용할 수 있습니다");
	}
	
	
	function makeValidationDate(obj,obj_year,obj_month,obj_day){
		if(obj_month.value.length==1)
			obj_month.value = "0" + obj_month.value;
		if(obj_day.value.length==1)
			obj_day.value = "0" + obj_day.value;
	
		obj.value = obj_year.value+obj_month.value+obj_day.value;
	}
	
	function makeValidationDate_Sel(obj,obj_year,obj_month,obj_day){
		if(obj_month.options[obj_month.selectedIndex].value.length==1)
			var t_month = "0" + obj_month.options[obj_month.selectedIndex].value;
		else
			var t_month = obj_month.options[obj_month.selectedIndex].value;
	
		if(obj_day.options[obj_day.selectedIndex].value.length==1)
			var t_day = "0" + obj_day.options[obj_day.selectedIndex].value;
		else
			var t_day = obj_day.options[obj_day.selectedIndex].value;
	
		obj.value = obj_year.options[obj_year.selectedIndex].value+t_month+t_day;
	}
	
	Date.prototype.toY4MDString = function(delim) {
		if (delim == undefined) delim = "";
		var year = this.getFullYear().toString();
		var month = this.getMonth() + 1;
		var day = this.getDate();
		month = (month < 10 ? "0" : "") + month;
		day = (day < 10 ? "0" : "") + day;
		return year + delim + month + delim + day;
	}


	// 허용된 byte만큼 입력도중 실시간으로 string자르기
	// <textArea>등에 사용하면 됩니다.
	// onKeyup="checkByte(this,제한할byte수,"현재byte정보뿌려줄영역의ID");"
	// 마지막 인자는 선택사항입니다.
	// ex)  onKeyup="checkByte(this,200,'nowByteShowArea');"

	function getBytes(sString) {
		var c = 0;
		for (var i=0; i<sString.length; i++) {
			c += parseInt(getByte(sString.charAt(i)));
		}
		return c;
	}
	function getByte(sChar) {
		var c = 0;
		var u = escape(sChar);
		if (u.length < 4) { // 반각문자 : 기본적인 영문, 숫자, 특수기호
			c++; // + 1byte
		} else {
			var s = parseInt(sChar.charCodeAt(0));
			if (((s >= 65377)&&(s <= 65500))||((s >= 65512)&&(s <= 65518))) // 반각문자 유니코드 10진수 범위 : 한국어, 일본어, 특수문자
				c++; // + 1byte
			else // 전각문자 : 위 조건을 제외한 모든 문자
				c += 2; // + 2byte
		}
		return c;
	}
	function cutOverText(obj,maxByte,viewAreaID) {
		var sString = obj.value;
		var c = 0;
		for (var i=0; i<sString.length; i++) {
			c += parseInt(getByte(sString.charAt(i)));
			if (c>maxByte) {
				obj.value = sString.substring(0,i);
				break;
			}
		}
		showNowByte(obj.value,viewAreaID);
	}
	function showNowByte(sString,viewAreaID) {
		var vArea = document.getElementById(viewAreaID);
		if (vArea) vArea.innerHTML = getBytes(sString);
	}
	function checkByte(obj,maxByte,viewAreaID) {
		var sString = obj.value;
		showNowByte(sString,viewAreaID);
		if (getBytes(sString) > maxByte) {
			alert("최대 "+maxByte+"Bytes(한글 "+(maxByte/2)+"자/영문 "+maxByte+"자)까지만 입력하실 수 있습니다.");
			cutOverText(obj,maxByte,viewAreaID);
		}
	}
	
	
	function removeSpace(el) {
		var pattern = /[\s]/;
		for(var i=0; i<el.length; i++){
			el = el.replace(pattern,"");
		}
		return el;
	
	}
	
	function chkNumeric(obj) {
		if ( (event.keyCode >= 48 && event.keyCode <= 57) || 
			 event.keyCode == 8 ||       // backspace
			 event.keyCode == 13 ||      // enter key
			 event.keyCode ==  37 ||     // Left Arrow
			 event.keyCode ==  38 ||     // Up Arrow
			 event.keyCode ==  39 ||     // Right Arrow
			 event.keyCode ==  40 ||     // Down Arrow
		     event.keyCode ==  46 ||     // HOME
		     event.keyCode ==  36 ||     // END
		     event.keyCode ==  18 ||     // ALT
		     event.keyCode ==  18 ||     // SHIFT
		     event.keyCode ==  35      	 // TAB
		)
		{
	    }else{
	    	alert("숫자만 입력 가능합니다.");
		    return false;
	    }
	}
	
	// lan 만큼 짤라 주고 ... 붙여 주기
	function subStr(str, lan){
		var new_str = "";
		if(!str == null || !str == ""){
			new_str = str.substring(0,lan);
			if(str.length > lan){
				new_str = new_str + "...";
			} 
		} 
		return new_str;
	}
	
    /********************************************
	 * obj - object value
	 * 
	 * 3자리마다 ","를 찍어준다.
	 * ex) 200126 -> 20,126, 200 -> 200
	 *********************************************/
	function setComma(val)
	{
		var len = "";
		var sep_val = "";
		var sep_dot = "";
		
		if( val.indexOf(".") != -1 )
		{
			sep_val = val.substring(0, val.indexOf("."));
			sep_dot = val.substring(val.indexOf("."));
			
			len = sep_val.length;
		}
		else
		{
			sep_val = val;
			len = val.length;
		}
		
		if(len <=3){			
			return val;
		}else {
			
			var loop = Math.ceil(len/3);
			var offset = len % 3;
			if(offset ==0){
				offset =3;
			}
			var fn_prc = sep_val.substring(0,offset);
			for(var i=1;i<loop;i++){
				fn_prc +="," +sep_val.substring(offset,offset+3);
				offset +=3;
			}
			
			return fn_prc+sep_dot;
		}
	}	
	
	/*
	 문자열을 인코딩 할때 사용한다. 다음과 같이 인코딩 하여 사용한다.
	 JS : encodeURL(str)
	*/
	function encodeURL(str){
	    var s0, i, s, u;
	    s0 = "";                // encoded str
	    for (i = 0; i < str.length; i++){   // scan the source
	        s = str.charAt(i);
	        u = str.charCodeAt(i);          // get unicode of the char
	        if (s == " "){s0 += "+";}       // SP should be converted to "+"
	        else {
	            if ( u == 0x2a || u == 0x2d || u == 0x2e || u == 0x5f || ((u >= 0x30) && (u <= 0x39)) || ((u >= 0x41) && (u <= 0x5a)) || ((u >= 0x61) && (u <= 0x7a))){       // check for escape
	                s0 = s0 + s;            // don't escape
	            }
	            else {                  // escape
	                if ((u >= 0x0) && (u <= 0x7f)){     // single byte format
	                    s = "0"+u.toString(16);
	                    s0 += "%"+ s.substr(s.length-2);
	                }
	                else if (u > 0x1fffff){     // quaternary byte format (extended)
	                    s0 += "%" + (0xf0 + ((u & 0x1c0000) >> 18)).toString(16);
	                    s0 += "%" + (0x80 + ((u & 0x3f000) >> 12)).toString(16);
	                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
	                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
	                }
	                else if (u > 0x7ff){        // triple byte format
	                    s0 += "%" + (0xe0 + ((u & 0xf000) >> 12)).toString(16);
	                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
	                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
	                }
	                else {                      // double byte format
	                    s0 += "%" + (0xc0 + ((u & 0x7c0) >> 6)).toString(16);
	                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
	                }
	            }
	        }
    	}
    	return s0;
	}	
	
	/*
	 문자열을 디코딩 할때 사용한다. 다음과 같이 디코딩 하여 사용한다.
	 JS : decodeURL(str)
	*/
	function decodeURL(str)
	{
	    var s0, i, j, s, ss, u, n, f;
	    s0 = "";                // decoded str
	    for (i = 0; i < str.length; i++){   // scan the source str
	        s = str.charAt(i);
	        if (s == "+"){s0 += " ";}       // "+" should be changed to SP
	        else {
	            if (s != "%"){s0 += s;}     // add an unescaped char
	            else{               // escape sequence decoding
	                u = 0;          // unicode of the character
	                f = 1;          // escape flag, zero means end of this sequence
	                while (true) {
	                    ss = "";        // local str to parse as int
	                        for (j = 0; j < 2; j++ ) {  // get two maximum hex characters for parse
	                            sss = str.charAt(++i);
	                            if (((sss >= "0") && (sss <= "9")) || ((sss >= "a") && (sss <= "f"))  || ((sss >= "A") && (sss <= "F"))) {
	                                ss += sss;      // if hex, add the hex character
	                            } else {--i; break;}    // not a hex char., exit the loop
	                        }
	                    n = parseInt(ss, 16);           // parse the hex str as byte
	                    if (n <= 0x7f){u = n; f = 1;}   // single byte format
	                    if ((n >= 0xc0) && (n <= 0xdf)){u = n & 0x1f; f = 2;}   // double byte format
	                    if ((n >= 0xe0) && (n <= 0xef)){u = n & 0x0f; f = 3;}   // triple byte format
	                    if ((n >= 0xf0) && (n <= 0xf7)){u = n & 0x07; f = 4;}   // quaternary byte format (extended)
	                    if ((n >= 0x80) && (n <= 0xbf)){u = (u << 6) + (n & 0x3f); --f;}         // not a first, shift and add 6 lower bits
	                    if (f <= 1){break;}         // end of the utf byte sequence
	                    if (str.charAt(i + 1) == "%"){ i++ ;}                   // test for the next shift byte
	                    else {break;}                   // abnormal, format error
	                }
	            s0 += String.fromCharCode(u);           // add the escaped character
	            }
	        }
	    }
	    return s0;
	}	
					