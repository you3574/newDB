<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		
		<%@include file="/WEB-INF/views/include/css.jsp" %>
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
			<div class="icon inOut"><i class="fa fa-cog fa-spin"></i></div>
			<h4>Choose Color</h4>
			<span class="color1"></span>
			<span class="color2"></span>
			<span class="color3"></span>
			<span class="color4"></span>
			<span class="color5"></span>
			<span class="color6"></span>
			<span class="color7"></span>
			<span class="color8"></span>
		</div>
		<!--/ ENd Mp Color -->
		
		<!-- Start Header -->
		<header id="header">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-15 col-xs-15">
						<!-- Logo -->
						<div class="logo">
				<a href="admin"><span>졸업</span>관리시스템</a>						</div>
						<!--/ End Logo -->
					</div>
					<div class="col-md-8 col-sm-12 col-xs-12">
						<div class="nav-area">
							<!-- Main Menu -->
							<nav class="mainmenu">
								<div class="mobile-nav"></div>
								<div class="collapse navbar-collapse">
									<ul class="nav navbar-nav menu">
										<li class="active"><a href="admin">메인페이지</a></li>
										<li><a href="search">학생조회</a></li>
										<li><a href="graduation_require">졸업요건</a></li>
										<li><a href="subject">대체과목 관리</a></li>	
										<li><a href="question_admin">문의사항</a></li>
										<li>${loginUser.name}</li>
										<c:if test="${loginUser != NULL }">
										<li>
											<a href="/logout"><button class="btn btn-default">로그아웃</button></a>
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
		
		<!-- Start Slider -->
		<section id="j-slider">
			<div class="slide-main">
				<!-- Single Slider -->
				<div class="single-slider" style="background-image:url(/res/images/slider/slider_bg1.jpg);" >
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-sm-12 col-xs-12">
							<!-- Slider Text -->
							<div class="slide-text left">
								<div class="slider-inner">
									<h1><span>성공회대학교</span>졸업관리시스템</h1>
									<p>이 페이지는 성공회대학교 졸업관리시스템입니다.<br><a href="www.skhu.ac.kr">www.skhu.ac.kr</a></p>
								</div>
							</div>
							<!--/ End Slider Text -->
							</div>
						</div>
					</div>
				</div>
				<!--/ End Single Slider -->
				<!-- Single Slider -->
				<div class="single-slider" style="background-image:url(/res/images/slider/slider_bg2.jpg);" >
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-sm-12 col-xs-12">
									<!-- Slider Text -->
									<div class="slide-text left">
										<div class="slider-inner">
											<h1><span>성공회대학교</span>졸업관리시스템</h1>
											<p>이 페이지는 성공회대학교 졸업관리시스템입니다.<br><a href="www.skhu.ac.kr">www.skhu.ac.kr</a></p>
										</div>
									</div>
									<!--/ End Slider Text -->
							</div>
						</div>
					</div>
				</div>
				<!--/ End Single Slider -->
				<!-- Single Slider -->
				<div class="single-slider" style="background-image:url(/res/images/slider/slider_bg3.jpg);" >
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-sm-12 col-xs-12">
								<!-- Slider Text -->
								<div class="slide-text left">
									<div class="slider-inner">
										<h1><span>성공회대학교</span>졸업관리시스템</h1>
										<p>이 페이지는 성공회대학교 졸업관리시스템입니다.<br><a href="www.skhu.ac.kr">www.skhu.ac.kr</a></p>
									</div>
								</div>
								<!--/ End Slider Text -->
							</div>
						</div>
					</div>
				</div>
				<!--/ End Single Slider -->
			</div>
		</section>
		<!--/ End Slider -->
		
		<!-- Our Skill -->
		<section id="our-skill" class="section">
			<div class="container">
				<div class="row"> 
					<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
						<!-- Info Main -->
						<div class="info-main">
							<div class="section-title left">
								<h2>공지사항</h2>
							</div>
							<div class="some-info">
								<p>성공회대학교 졸업관련 공지사항</p>
							</div>
							<ul class="info-list">
								<li><i class="fa fa-check"></i>consectetuer adipiscing elit, sed diam nonummy.</li>
								<li><i class="fa fa-check"></i>has been the industry'sstandar.</li>
								<li><i class="fa fa-check"></i>has been the industry'sstandar.</li>
								<li><i class="fa fa-check"></i>Pellentesque habitant morbi tristique senectus.</li>
							</ul>	
						</div>
						<!--/ End Info Main -->
					</div>				
					<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
						<!-- Info Main -->
						<div class="info-main">
							<div class="section-title left">
								<h2>게시판 알림</h2>
							</div>
							<div class="some-info">
								<p>문의사항 게시판 새로운 글</p>
							</div>
							<ul class="info-list">
								<li><i class="fa fa-check"></i>consectetuer adipiscing elit, sed diam nonummy.</li>
								<li><i class="fa fa-check"></i>has been the industry'sstandar.</li>
								<li><i class="fa fa-check"></i>has been the industry'sstandar.</li>
								<li><i class="fa fa-check"></i>Pellentesque habitant morbi tristique senectus.</li>
							</ul>	
						</div>
						<!--/ End Info Main -->
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
							<div class="logo" style="margin-botton">
								<a href="admin"><span>성공회</span>대학교</a>
							</div>	
						</div>
					</div>
				</div>
			</div>
			<!--/ End Footer Top -->
		</footer>
		<!--/ End Footer -->

		<%@include file="/WEB-INF/views/include/javascript.jsp" %>
    </body>

</html>