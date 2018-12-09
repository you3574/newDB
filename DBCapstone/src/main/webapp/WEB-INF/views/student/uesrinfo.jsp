<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<!-- Meta tag -->
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="welcome to codeglim">
<meta name='copyright' content='codeglim'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Title Tag -->
<title>졸업시켜조</title>

<%@include file="/WEB-INF/views/include/css.jsp"%>
<style>
.checkimg {
	display: inline;
}

#our-skill {
	padding: 10px;
}
</style>
</head>
<body>

	<!-- Preloader -->
	<div class="loader">
		<div class="l-inner">
			<div class="k-spinner">
				<div class="k-bubble-1"></div>
				<div class="k-bubble-2"></div>
			</div>
		</div>
	</div>
	<!--/ End Preloader -->

	<!-- Mp Color -->
	<div class="mp-color">
		<div class="icon inOut">
			<i class="fa fa-cog fa-spin"></i>
		</div>
		<h4>Choose Color</h4>
		<span class="color1"></span> <span class="color2"></span> <span
			class="color3"></span> <span class="color4"></span> <span
			class="color5"></span> <span class="color6"></span> <span
			class="color7"></span> <span class="color8"></span>
	</div>
	<!--/ ENd Mp Color -->

	<!-- Start Header -->
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-15 col-xs-15">
					<!-- Logo -->
					<div class="logo">
						<a href="student"><span>졸업</span>관리시스템</a>
					</div>
					<!--/ End Logo -->
				</div>
				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="nav-area">
						<!-- Main Menu -->
						<nav class="mainmenu">
							<div class="mobile-nav"></div>
							<div class="collapse navbar-collapse">
								<ul class="nav navbar-nav menu">
									<li class="active"><a href="uesrinfo">개인정보 변경</a></li>
									<li><a href="graduation">졸업관리</a></li>
									<li><a href="#">예외사항 신청</a>
										<ul class="sub-menu">
											<li><a href="request">대체과목 신청</a></li>
											<li><a href="categorychange">이수구분변경 신청</a></li>
										</ul></li>
									<li><a href="question">문의사항</a></li>
									<li>${loginUser.name}</li>
									<c:if test="${loginUser != NULL }">
										<li><a href="/logout"><button class="btn btn-default">로그아웃</button></a>
										</li>
									</c:if>
								</ul>
							</div>
						</nav>
						<!--/ End Main Menu -->
					</div>
				</div>

			</div>
		</div>
	</header>
	<!--/ End Header -->

	<!-- Start Breadcrumbs -->
	<section id="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>개인정보 변경</h2>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->


	<!-- Our Skill -->
	<section id="our-skill" class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 wow fadeIn">
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>개인 정보를 변경합니다.</h2>
							</p>

						</div>
						<form class="form-horizontal" method="POST" id="form">
							<div class="form-group">
								<label for="inputDepart" class="col-sm-2 control-label">학과</label>
								<div class="col-md-5 col-sm-5 col-xs-12">
							    	<select class="form-control" id="departmentId" name="departmentId">
										<option value="1">소프트웨어공학과</option>
										<option value="2">정보통신공학과</option>
										<option value="3">글로컬IT학과</option>
										<option value="4">컴퓨터공학과</option>
										<option value="5">사회과학부</option>
										<option value="6">사회복지학과</option>
										<option value="7">신문방송학과</option>
										<option value="8">경영학부</option>
										<option value="9">디지털컨텐츠학과</option>
										<option value="10">중어중국학과</option>
										<option value="11">일어일본학과</option>
										<option value="12">영어학과</option>
										<option value="13">신학과</option>
									</select>
							    </div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">학기</label> 
								<div class="col-md-5 col-sm-5 col-xs-12">
									<input
										type="text" name="semester" class="form-control"
										placeholder="학기">
								</div>
							</div>
							<div class="form-group">
								<label for="inputCourse" class="col-sm-2 control-label">특별과정</label>
								<div class="col-md-5 col-sm-5 col-xs-12">
									<select class="form-control" id="course" name="course">
										<option value="1">전공기초</option>
										<option value="2">전공심화</option>
										<option value="3">타과복수전공</option>
										<option value="4">타과부전공</option>
									</select>
								</div>
							</div>
							<div id="another" class="form-group hide">
								<label for="inputAnother" class="col-sm-2 control-label">특별과정 학과</label>
								<div class="col-md-5 col-sm-5 col-xs-12">
							    	<select class="form-control" id="anotherId" name="anotherId">
										<option value="1">소프트웨어공학과</option>
										<option value="2">정보통신공학과</option>
										<option value="3">글로컬IT학과</option>
										<option value="4">컴퓨터공학과</option>
										<option value="5">사회과학부</option>
										<option value="6">사회복지학과</option>
										<option value="7">신문방송학과</option>
										<option value="8">경영학부</option>
										<option value="9">디지털컨텐츠학과</option>
										<option value="10">중어중국학과</option>
										<option value="11">일어일본학과</option>
										<option value="12">영어학과</option>
										<option value="13">신학과</option>
									</select>
							    </div>
								
							</div>
							<button type="submit" id="submit"
										class="btn btn-default" value="submit">변경하기</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Our Skill -->

	<!-- Start Footer -->
	<footer id="footer" class="wow fadeIn">
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						<!-- Logo -->
						<div class="logo" style="">
							<a href="index.html"><span>성공회</span>대학교</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
	</footer>
	<!--/ End Footer -->

	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
	<script>
	$(function () {
		var status=false;
		$("#course").change(function(){

			var select = $(this).val();
			if(select == 1 || select == 2){
				$("#another").removeClass("hide");
				$("#another").addClass("hide");
				status=false;
			}else if(select == 3 || select == 4){
				$("#another").removeClass("hide");
				status=true;
			}
			
		});
		
		$("#submit").click(function(){
			var dId = $("#departmentId").val();
			var aId = $("#anotherId").val();
			
			if(status==true && dId == aId){
				alert("주전공과 특별과정 과목이 같습니다.")
				return false;
			}else{
				$('#form').submit();
			}
		});
		
	});
	</script>

</body>
</html>