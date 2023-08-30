<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이스북 로그인 #1</title>

</head>
<body>
	<script>
	  function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    if (response.status === 'connected') {
	      testAPI();
	    } else {
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    }
	  }
		
	  // 응답을 처리하는 함수
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }
	
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '288649770522485',
	      cookie     : true,  
	      xfbml      : true,  
	      version    : 'v15.0' 
	    });
		
	    // 로그인 상태 확인. 수정한 것
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	
	  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	  }
	</script>
	
	<!--  버튼에서 onlogin 속성을 사용  -->
	<fb:login-button 
	  scope="public_profile,email"
	  onlogin="checkLoginState();">
	</fb:login-button>
	
	<div id="status">
	</div>
</body>
</html>