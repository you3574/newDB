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
        <title>졸업시켜조ver.admin</title>
		
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
							 		<!-- Single Skill -->
                                        <div class="single-skill">
                                            <div class="skill-info">
                                                <h4>전체</h4>
                                             </div>
                                            <div class="progress">
                                                <div class="progress-bar" data-percent="80"><span>80%</span></div>
                                            </div>
                                        </div>    
                                        <!--/ End Single Skill -->
                                        <!-- Single Skill -->
                                        <div class="single-skill">
                                            <div class="skill-info">
                                                <h4>전공</h4>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar" data-percent="90"><span>90%</span></div>
                                            </div>
                                        </div>    
                                        <!--/ End Single Skill -->
                                        <!-- Single Skill -->
                                        <div class="single-skill">
                                            <div class="skill-info">
                                                <h4>교양</h4>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar" data-percent="70"><span>70%</span></div>
                                            </div>
                                        </div>    
                                        <!--/ End Single Skill -->
                                        <!-- Single Skill -->
                                        <div class="single-skill">
                                            <div class="skill-info">
                                                <h4>특별과정</h4>
                                            </div>
                                            <div class="progress">
                                                <div class="progress-bar" data-percent="60"><span>95%</span></div>
                                            </div>
                                        </div>    
                                        <!--/ End Single Skill -->
                                    <!--/ End Skill Main -->
							</div>
						</div>
	</div>
					</div>
					 <div class="col-md-4 col-sm-12 col-xs-12">
						<!-- Blog Sidebar -->
						<div class="blog-sidebar">

							<form class="search" action="#">
									<div class="single-sidebar form">
										<div>${student.studentId }</div>
										<div>${student.name }</div>
										 <a href="student_review" class="btn btn-info">목록으로</a>
									</div>
								</form>

							</div>
							<!--/ End Search Form -->
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
								<a href="index.html"><span>성공회</span>대학교</a>
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