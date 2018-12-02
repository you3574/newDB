<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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

<%@include file="/WEB-INF/views/include/css.jsp"%>

<!-- Title Tag -->
<title>졸업시켜조ver.admin</title>



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
									<li class="active"><a href="search">학생조회</a></li>
									<li><a href="graduation_require">졸업요건</a></li>
									<li><a href="subject">대체과목 관리</a></li>
									<li><a href="question_admin">문의사항</a></li>
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
					<h2>학생 조회</h2>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->

	<!-- Start blog -->
	<section id="blog" class="single section page">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-xs-12">
					<!-- Single blog -->
					<div class="single-blog">
						<div class="blog-content">
							<h2 style="margin-bottom: 30px">학생 조회</h2>
							<div class="order">
								<my:orderBy></my:orderBy>
							</div>
							<!-- Skill Main -->
							<div class="skill-main">
								<table class="table table-bordered mt5">
									<thead>
										<tr>
											<th>id</th>
											<th>학번</th>
											<th>이름</th>
											<th>학과</th>
											<th>학년</th>
											<th>전공이수학점</th>
											<th>교양이수학점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="student" items="${ students }">
											<tr data-url="student_details?id=${ student.id }">
												<td>${ student.id }</td>
												<td>${ student.studentId }</td>
												<td>${ student.name }</td>
												<td>${ student.dname}</td>
												<td>${ student.grade }</td>
												<td>${ student.majorCredit }</td>
												<td>${ student.culturalCredit }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>


							</div>
							<!--/ End Skill Main -->

						</div>
					</div>
					<!--/ End Single blog -->

				</div>

				<div class="col-md-4 col-sm-12 col-xs-12">
					<!-- Blog Sidebar -->
					<div class="blog-sidebar">
						<!-- Start Search Form -->
						<div class="single-sidebar form">
							<div id="title">S E A R C H</div>

							<form:form method="get" modelAttribute="pagination"
								class="form-inline mb5">
								<form:hidden path="now" value="1" />
								<div class="searchword1"
									style="color: #16A085; font-weight: bold;font-size:15px; margin-right:5px;">페이지
									크기</div>
									
								<div class="searchword1">
									<form:select path="size" class="form-control searchWord">

										<form:option value="10" />
										<form:option value="15" />
										<form:option value="30" />

									</form:select>
								</div>
								<div class="clear"></div>
								<div class="searchword1">
									<form:select path="category"
										class="form-control select searchWord" itemValue="value"
										itemLabel="label" items="${ category }" />
								</div>
								<div class="searchword1">
									<form:input path="searchWord" class="form-control searchWord"
										placeholder="SEACHWORD" style="width:160px;" />
								</div>
								<div class="searchword1">
									<button type="submit" class="searchWord">검색</button>
								</div>

							



								<c:if
									test="${ pagination.category > 0 || pagination.orderBy > 0}">
									<a class="searchWord" href="search?now=1"> 전체목록 </a>
								</c:if>


							</form:form>
						</div>
						<!--/ End Search Form -->
					</div>
					<!--/ End Blog Sidebar -->
					<my:pagination pageSize="${ pagination.size }"
						recordCount="${ pagination.recordCount }" />
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
							<a href="admin"><span>성공회</span>대학교</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
	</footer>

	</script>
	<!-- Jquery JS -->
	<script type="text/javascript" src="/res/js/jquery.min.js"></script>

	<!-- Colors JS -->
	<script type="text/javascript" src="/res/js/colors.js"></script>

	<!-- Google Map JS -->
	<script type="text/javascript" src="/res/js/gmap.js"></script>

	<!-- Modernizr JS -->
	<script type="text/javascript" src="/res/js/modernizr.min.js"></script>

	<!-- Appear JS-->
	<script type="text/javascript" src="/res/js/jquery.appear.js"></script>

	<!-- Animate JS -->
	<script type="text/javascript" src="/res/js/wow.min.js"></script>

	<!-- Onepage Nav JS -->
	<script type="text/javascript" src="/res/js/jquery.nav.js"></script>

	<!-- Yt Player -->
	<script type="text/javascript" src="/res/js/ytplayer.min.js"></script>

	<!-- Popup JS -->
	<script type="text/javascript"
		src="/res/js/jquery.magnific-popup.min.js"></script>

	<!-- Typed JS -->
	<script type="text/javascript" src="/res/js/typed.min.js"></script>

	<!-- Scroll Up JS -->
	<script type="text/javascript" src="/res/js/jquery.scrollUp.min.js"></script>

	<!-- Slick Nav JS -->
	<script type="text/javascript" src="/res/js/jquery.slicknav.min.js"></script>

	<!-- Counterup JS -->
	<script type="text/javascript" src="/res/js/waypoints.min.js"></script>
	<script type="text/javascript" src="/res/js/jquery.counterup.min.js"></script>

	<!-- Owl Carousel JS -->
	<script type="text/javascript" src="/res/js/owl.carousel.min.js"></script>

	<!-- Bootstrap JS -->
	<script type="text/javascript" src="/res/js/bootstrap.min.js"></script>

	<!-- Main JS -->
	<script type="text/javascript" src="/res/js/main.js"></script>
</body>
</html>