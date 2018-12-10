<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
									<li><a href="search">학생조회</a></li>
									<li><a href="graduation_require">졸업요건</a></li>
									<li class="active"><a href="departreplace">대체과목 관리</a></li>
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
					<h2>문의사항 답변</h2>
					<ul>
						<li><a href="question_admin">게시판 돌아가기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->

	<!-- Start blog -->
	<section id="blog" class="single section page">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-xs-12" style="margin-left: 20%;">
					<!-- Single blog -->
					<div class="single-blog">

						<div class="blog-content">
							<h3>제목:${ article.subject }</h3>
							<hr />

							<div id="info">
								<span>no:</span> <span>${ article.no }</span> <br> <span>글쓴이:</span>
								<span>${ article.writerName }</span> <br> <span>글쓴시각:</span>
								<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${ article.time }" /></span>
							</div>
							<hr />
							<div id="body">${ article.message }</div>
							<hr />

						</div>
					</div>
					<!--/ End Single blog -->
					<!-- Comments -->
					<div class="blog-comments">
						<h2>답변</h2>
						<div class="comments-body">
							<!-- Single Comments -->
							<div class="single-comments">
								<div class="main">
								
								
									<form method="post" modelAttribute="answer">  
										<div class="body">
											<textarea name="message"  path="message">${ answer.message }</textarea>
										</div>
										<div class="btn">
											<button type="submit" class="button">완료</button>
										</div>

									</form>
									

								</div>

							</div>

						</div>
					</div>
					<!--/ End Comments -->
				</div>

			</div>
		</div>

	</section>


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