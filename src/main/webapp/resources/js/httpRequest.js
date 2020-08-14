//ajaxUtil.js의 업그레이드 버전...

//XMLHttpReqeust 객체 생성 반환
function getXmlHttpRequest(){
	
	if(window.ActiveXObject){	//IE
		
		try {
			
			return new ActiveXObject("Msxml2.XMLHTTP");
			
		} catch (e) {
			
			try {
				
				return new ActiveXObject("Microsoft.XMLHTTP");
				
			} catch (e) {
				return null;
			}
			
		}
		
	}else if(window.XMLHttpRequest){
		
		return new XMLHttpRequest();
		
	}else{
		return null;
	}
	
}

//Ajax 요청
var httpRequest = null;

function sendRequest(url,params,callback,method){
	
	//function 호출하면서 생성된 객체 받기
	httpRequest = getXmlHttpRequest();
	
	//method 처리
	var httpMethod = method?method:"GET";	//method가 있으면 그 방식 그대로 쓰고, 없으면 get방식 써라
	
	if(httpMethod!="GET" && httpMethod!="POST"){
		httpMethod = "GET";
	}
	
	//value 처리
	var httpParams = (params==null || params=="")?null:params;
	
	//url 처리
	var httpUrl = url;
	
	if(httpMethod=="GET" && httpParams!=null){
		httpUrl += "?" + httpParams;
	}
	
	httpRequest.open(httpMethod,httpUrl,true);
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	//post방식일 때, 써주어야 함
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod=="POST"?httpParams:null);
	
}































