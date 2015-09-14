function regnoValidation(regno){
	//주민번호 검증
	//1 1 1 1 1 1 - 1 1 1 1 1 1 		1(매직넘버)
	//* * * * * *   * * * * * * 
	//2+3+4+5+6+7 + 8+9+2+3+4+5 = 값1
	//값1%11 = 값2
	//11-값2 = 값3
	//값3%10 = 최종값
	//if(최종값 == 매직넘버) 유효한 주민번호
	//else 무효한 주민번호
	
	var one = regno.substring(0,1);
	var two =regno.substring(1,2);
	var three =regno.substring(2,3);
	var four =regno.substring(3,4);
	var five =regno.substring(4,5);
	var six =regno.substring(5,6);
	
	var seven =regno.substring(7,8);
	var eight =regno.substring(8,9);
	var nine =regno.substring(9,10);
	var ten =regno.substring(10,11);
	var eleven =regno.substring(11,12);
	var twelve =regno.substring(12,13);
	var thirteen =regno.substring(13,14);//매직넘버

	
	var val1 = one*2+two*3+three*4+four*5+five*6+six*7+seven*8+eight*9+nine*2+ten*3+eleven*4+twelve*5;
	var val2 = val1%11;
	var val3 = 11-val2;
	var result = val3%10;
	
	if(result==thirteen){
		return true;
	}else{
		return false;
	}
	
	
}

//브라우져별 XMLHttpRequest 취득
function createXMLHttpRequest(){
	var xmlHttp;
	//IE에서  XMLHttpRequest취득
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');	
	}else{
	//IE이외브라우져에서 XMLHttpRequest취득
		xmlHttp = new XMLHttpRequest();
	}
	return xmlHttp;
}



