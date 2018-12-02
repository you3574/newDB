<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
									<li class="active"><a href="student">메인페이지</a></li>
									<li><a href="graduation">졸업관리</a></li>
									<li><a href="request">예외사항 신청</a></li>
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
					<h2>문의사항 게시판</h2>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->

	<!-- Start blog -->
	<section id="blog" class="archive section page">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12">
					<!-- Start table -->
					<div class="container">

						<div class="pull-right mb5" id="write">
							<a href="question_write" style="margin-bottom: 30px;">글쓰기</a>
						</div>
						<div class="pull-right mb5" id="mylist"
							style="margin-bottom: 30px; margin-right: 10px">
							<a href="myquestion">내 글목록</a>
						</div>


						<!--/ End Contact Form -->

						<table class="table table-bordered mt5">
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>글쓴이</th>
									<th>답변 유무</th>
									<th>작성시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${ articles }">
									<tr data-url="question_details?id=${ article.id }">
										<td class="text-center">${ article.no }</td>
										<td>${ article.subject }</td>
										<td>${ article.message }</td>
										<td>${ article.writerName }</td>
										<td><c:if test="${article.answerYN ==true }">
									답변 완료
								</c:if> <c:if test="${article.answerYN ==false }">
								답변 미완료</td>
										</c:if>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
												value="${ article.time }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- End table -->

				</div>

				<div class="clear"></div>
				<form:form method="get" modelAttribute="qpagination"
					class="form-inline mb5">




					<div class="board search-bar">

						<div class="searchboard">
							<form:select path="QnAcategory" class="form-control searchWord"
								itemValue="value" itemLabel="label" items="${ QnACategory }" />
							
								<form:input path="searchWord" class="searchWord"
									placeholder="SEACHWORD" style="width=300px;width:300px; padding-top: 3px;padding-bottom: 3px;" />

								<button type="submit" class="searchWord">검색</button>

							

						</div>
				</form:form>

			</div>
			<div class="row">
				<div class="col-md-12">
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

	</section>
	<!--/ End blog -->


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
	<!--/ End Footer -->

	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
</body>
</html>