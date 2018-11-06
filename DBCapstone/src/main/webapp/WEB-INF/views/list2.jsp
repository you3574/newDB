<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<!-- Title Tag -->
        <title>관리자 페이지</title>
		
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
		
		<!-- You Can Use 8 Different color Just remove bottom of the comment tag -->
		
		<link rel="stylesheet" href="/res/css/skin/green.css">
		<link rel="stylesheet" href="/res/css/skin/pink.css">
		<link rel="stylesheet" href="/res/css/skin/yellow.css">
		<link rel="stylesheet" href="/res/css/skin/red.css">
		<link rel="stylesheet" href="/res/css/skin/pink.css">
		<link rel="stylesheet" href="/res/css/skin/orange.css">
		<link rel="stylesheet" href="/res/css/skin/blaze.css">
		<link rel="stylesheet" href="/res/css/skin/blue.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="#" id="colors">
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
										<li class="active"><a href="student_review">학생조회</a></li>
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
						<h2>관리자 페이지</h2>
						<ul>
							<li><a href="admin">Home</a></li>
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
					<div class="col-md-8 col-sm-12 col-xs-12">
						<!-- Single blog -->
						<div class="single-blog">
							<div class="blog-content">
								<h2 style="margin-bottom:30px">학생조회</h2>
                                    
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
								<<form:form method="get" modelAttribute="pagination" class="form-inline mb5">
			<form:hidden path="now" value="1" />

			<span>정렬순서:</span>
			<form:select path="orderBy" class="form-control autosubmit"
				itemValue="value" itemLabel="label" items="${ orderBy }" />
			<form:select path="category" class="form-control ml30"
				itemValue="value" itemLabel="label" items="${ category }" />
			<form:input path="searchWord" class="form-control"
				placeholder="검색문자열" />
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i> 검색
			</button>
			<c:if test="${ pagination.category > 0 || pagination.orderBy > 0}">
				<a class="btn btn-default" href="list?now=1"> <i
					class="glyphicon glyphicon-ban-circle"></i> 검색취소
				</a>
			</c:if>
			<span class="ml30">페이지 크기:</span>
			<form:select path="size" class="form-control autosubmit">
				<form:option value="10" />
				<form:option value="15" />
				<form:option value="30" />
			</form:select>

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
							<div class="logo" style="margin-botton">
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
		<script  type="text/javascript" src="/res/js/gmap.js"></script>
		
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
    </body>
</html>