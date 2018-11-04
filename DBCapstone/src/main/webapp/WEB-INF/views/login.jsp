<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="description" content="welcome to codeglim">
   <meta name='copyright' content='codeglim'>
   <meta name="viewport" content="width=device-width, initial-scale=1">   

      <!-- Favicon -->
      <link rel="icon" type="image/png" href="/res/images/favicon.png">   
      
        <!-- Google Font -->
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,700,900" rel="stylesheet"> 

      <!-- Google Map Api -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM" type="text/javascript"></script>   
   
      <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="/res/css/font-awesome.min.css">

      <!-- Animate CSS -->
        <link rel="stylesheet" href="/res/css/animate.min.css">

      <!-- Slicknav CSS -->
        <link rel="stylesheet" href="/res/css/slicknav.min.css">

      <!-- Owl Carousel CSS -->
      <link rel="stylesheet" href="/res/css/owl.theme.default.css">
        <link rel="stylesheet" href="/res/css/owl.carousel.min.css">
      
      <!-- Magnific Popup CSS -->
      <link rel="stylesheet" href="/res/css/magnific-popup.css">
      
      <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="/res/css/bootstrap.min.css">
      
      <!-- Bizpro Style CSS -->
        <link rel="stylesheet" href="/res/style.css">
        <link rel="stylesheet" href="/res/css/default.css">   
        <link rel="stylesheet" href="/res/css/responsive.css">
      <style>
      h1{
      color:#555 ;
      }
      </style>

</head>
<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-form-title">
              <img style="width: 50%; margin-top: 20px" src="/res/images/login.png">
               <span class="login100-form-title-1">
                     졸업관리시스템
               </span>
            </div>

             <form class="login100-form">
               <div class="wrap-input100">
                  <span class="label-input100">학번</span>
                  <input class="input100" type="text" name="usernumber">
               </div>
               <br/>
               
               <div class="wrap-input100">
                  <span class="label-input100">비밀번호</span>
                  <input class="input100" type="password" name="pass">
               </div>
              

               <div class="single-service" style="padding-top:10px">
                  <button class="btn btn-default" id="loginbutton">
                     Login
                  </button>
                  &nbsp;
                  <a data-target="#layerpop_sm1" data-toggle="modal">
                       <button class="btn btn-default">Sign up</button>
                  </a>
                       
                       
                       
                      <div class="modal fade" id="layerpop_sm1">
                          <div class="modal-dialog">
                           <div class="modal-content" style="width:70%; left: 15%;">
                            <!-- header -->
                            <div class="modal-header">
                                <!-- header title -->
                                <h2>회원가입</h2>
                            </div>
                            <br/>
                            <!-- body -->
                            <div class="modal-body">
                                <form method="post" modelAttribute="student">  
                                   <div class="form-group" style="width:70%;">
                                    <label>이름</label> :</label>
                                    <input id="studentName" path="studentName" class="form-control" />
                                  </div>
                                  <div class="form-group" style="width:70%;">
                                    <label>학번 :</label>
                                    <input id="studentNumber" path="studentNumber" class="form-control"/>
                                  </div>
                                  <div class="form-group" style="width:70%;">
                                    <label>비밀번호 :</label>
                                    <input id="password" type="password" path="password" class="form-control" />
                                  </div>
                                </form>
                              </div>
                            <br/>
                            <!-- Footer -->
                            <div class="modal-footer">
                               <button type="button" id="button1" class="btn btn-default">가입하기</button>                                    
                                &nbsp;
                                <button type="button" class="btn btn-default" data-dismiss="modal" >되돌아가기</button>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
         </div>
      </div>
   </div>
   
      <!-- Jquery JS -->
      <script type="text/javascript" src="/res/js/jquery.min.js"></script>
      
      <!-- Colors JS -->
      <script type="text/javascript" src="/res/js/colors.js"></script>
      
      <!-- Modernizr JS -->
      <script type="text/javascript"  src="/res/js/modernizr.min.js"></script>
   
      <!-- Appear JS-->
      <script  type="text/javascript" src="/res/js/jquery.appear.js"></script>

      <!-- Animate JS -->
       <script  type="text/javascript" src="/res/js/wow.min.js"></script>
      
      <!-- Onepage Nav JS -->
       <script  type="text/javascript" src="/res/js/jquery.nav.js"></script>
      
      <!-- Yt Player -->
      <script  type="text/javascript" src="/res/js/ytplayer.min.js"></script>
   
      <!-- Popup JS -->
      <script type="text/javascript"  src="/res/js/jquery.magnific-popup.min.js"></script>

      <!-- Typed JS -->
      <script  type="text/javascript" src="/res/js/typed.min.js"></script>
      
      <!-- Scroll Up JS -->
      <script  type="text/javascript" src="/res/js/jquery.scrollUp.min.js"></script>
      
      <!-- Slick Nav JS -->
      <script  type="text/javascript" src="/res/js/jquery.slicknav.min.js"></script>
      
      <!-- Counterup JS -->
      <script  type="text/javascript" src="/res/js/waypoints.min.js"></script>
      <script  type="text/javascript" src="/res/js/jquery.counterup.min.js"></script>
      
      <!-- Owl Carousel JS -->
      <script  type="text/javascript" src="/res/js/owl.carousel.min.js"></script>
      
      <!-- Bootstrap JS -->
      <script  type="text/javascript" src="/res/js/bootstrap.min.js"></script>
      
      <!-- Main JS -->
      <script type="text/javascript"  src="/res/js/main.js"></script>
      
      <script>
 	 function checkVal(){
 		if($('#studentName').val()==''){
 			alert("이름을 입력해주세요.");
 			return false;	
 		}else if($('#studentNumber').val()==''){
 			alert("학번을 입력해주세요.");
 			return false;	
 		}else if($('#password').val()==''){
 			alert("비밀번호를 입력해주세요.");
 			return false;	
 		}
 		return true;				
 	};

	$('#button1').bind({
		click: function(e){
    		e.preventDefault();
			
    		//입력폼 값 검사
			if(!checkVal()){
				return false;
			}

			//전송되는 값을 정리
			//부서는 선택된 lv3만 보내기
			var sendData;
			sendData = JSON.stringify({
	            "studentName":			$('#studentName').val(),
	            "studentNumber":		$('#studentNumber').val(),
	            "password": 			$('#password').val()
	        });		

			$.ajax({
    			url: "signup",
    			method: "POST",
    			data: sendData,
    			dataType: "json",
    			contentType: "application/json;charset=UTF-8",
    			beforeSend: function(){
    				if(confirm('회원가입 하시겠습니까?')){	
						return true;
					}
					else{
						return false;
					}    				
    			},
    			success:function(data){
    				if(data){
    					alert(data+"가입에 성공하셨습니다.");
    					location.reload();
    				}else{
    					alert("에러");
    				}
				},
				error: function(){
            		alert("에러");
         	   }
			});
		}//end of click
	});
	
	$('#loginbutton').bind({
		click: function(e){
    		e.preventDefault();
    		
    		if($('input[name=usernumber]').val()==''){
    			alert("학번을 입력해주세요.")
    			return false;
    		}else if($('input[name=pass]').val()==''){
    			alert("비밀번호를 입력해주세요.")
    			return false;
    		}
    		
    		var loginForm = $('<form></form>');

    		loginForm.attr("action","login");
    		loginForm.attr("method","post");
    		loginForm.appendTo('body');
    		var idx = $("<input type='hidden' value="+$('input[name=usernumber]').val()+" name='usernumber'>");
    		var pwd = $("<input type='hidden' value="+$('input[name=pass]').val()+" name='pass'>");
    		loginForm.append(idx).append(pwd);
    		loginForm.submit();
		}
	});
	

	

      </script>
   

</body>
</html>