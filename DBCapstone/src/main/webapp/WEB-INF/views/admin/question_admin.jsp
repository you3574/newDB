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

<%@include file="/WEB-INF/views/include/css.jsp"%>

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
						<a href="admin"><span>졸업</span>관리시스템</a>
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
									<li><a href="admin">메인페이지</a></li>
									<li><a href="student_review">학생조회</a></li>
									<li><a href="graduation_require">졸업요건</a></li>
									<li class="active"><a href="subject">대체과목 관리</a></li>
									<li class="active"><a href="question_admin">문의사항</a></li>

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
					<h2>문의사항 게시판</h2>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->


	<!-- Start Project -->
	<section id="portfolio" class="section archive page">
		<div class="container">
			<div class="notice">
				<a href="question_write">공지사항 작성</a>
			</div>
			<div class="row">
				<c:forEach var="article" items="${ articles }">
					<div class="col-md-4 col-sm-4 col-xs-12">
						<!-- Single Portfolio -->
						<div class="portfolio-single">
							<a href="" class="zoom">
								<div class="portfolio-head">
									<img src="" alt="" /> <i class="fa fa-search"></i>
								</div>
							</a>
							<div class="text">
								<h4>
									<a href="question_details_admin?id=${ article.id }">${article.subject}</a>
								</h4>
								<p>${article.message}</p>
								<c:if test="${article.answerYN ==true }">
									<p id="yes">답변 완료</p>
								</c:if>
								<c:if test="${article.answerYN ==false }">
									<p id="no">답변 미완료</p>
								</c:if>
							</div>
						</div>
						<!--/ End Portfolio -->
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<!-- Start Pagination -->
					<ul class="pagination">
						<li class="prev"><a href="#"><span
								class="fa fa-angle-left"></span></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li class="next"><a href="#"><span
								class="fa fa-angle-right"></span></a></li>
					</ul>
					<!--/ End Pagination -->
				</div>
			</div>
		</div>
		<div class="gmap">
			<div class="map"></div>
		</div>
	</section>
	<!--/ End Project -->


	<!-- Start Footer -->
	<footer id="footer" class="wow fadeIn">
		<!-- Footer Top -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						<!-- Logo -->
						<div class="logo" style="">
							<a href="skhu.ac.kr"><span>성공회</span>대학교</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
	</footer>


	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
</body>
</html>