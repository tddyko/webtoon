function loginCheck(value,url){
	if(value){
		alert('로그인이 필요합니다.');
		location.href="../member/login";
	}else{
		location.href=url;
	}
}
	