function checking() {
	if(frm.pid.value.length == 0) {
		alert("선수번호 입력안됨 ㅇㅇ");
		frm.pid.focus();
		return false;
	}
	
	 else if(frm.pname.value.length == 0) {
		alert("선수이름 입력안됨 ㅇㅇ");
		frm.pname.focus();
		return false;
	}
	
	if(frm.pposition.value.length == 0) {
		alert("선수포지션 입력안됨 ㅇㅇ");
		frm.pposition.focus();
		return false;
	}
	
	if(frm.pdate.value.length == 0) {
		alert("선수등록일 입력안됨 ㅇㅇ");
		frm.pdate.focus();
		return false;
	}
	
	if(frm.pgrade.value.length == 0) {
		alert("선수등급 입력안됨 ㅇㅇ");
		frm.pgrade.focus();
		return false;
	}
	
	if(frm.pgrade.value.length == 0) {
		alert("선수등급 입력안됨 ㅇㅇ");
		frm.pgrade.focus();
		return false;
	}
	else {
		alert("정보를 입력합니다.")
		frm.submit();
		return true;
	}
	
	alert("등록 완료 ㅊㅋㅊㅋ");
	return true;
}

function modifing() {
	if(frm.pname.value.length == 0) {
		alert("선수이름 입력안됨 ㅇㅇ");
		frm.pname.focus();
		return false;
	}
	
	if(frm.pposition.value.length == 0) {
		alert("선수포지션 입력안됨 ㅇㅇ");
		frm.pposition.focus();
		return false;
	}
	
	if(frm.pdate.value.length == 0) {
		alert("선수등록일 입력안됨 ㅇㅇ");
		frm.pdate.focus();
		return false;
	}
	
	if(frm.pgrade.value.length == 0) {
		alert("선수등급 입력안됨 ㅇㅇ");
		frm.pgrade.focus();
		return false;
	}
	
	if(frm.pgrade.value.length == 0) {
		alert("선수등급 입력안됨 ㅇㅇ");
		frm.pgrade.focus();
		return false;
	}
	else {
		alert("정보를 수정합니다.")
		frm.submit();
		return true;
	}
	
	alert("수정 완료 ㅊㅋㅊㅋ");
	return true;
}



	
