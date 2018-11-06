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
        <title>관리자페이지</title>
		
		<%@include file="/WEB-INF/views/include/css.jsp" %>
		<!-- 
		<style>
		table{
		border:1px solid black;
		text-align:center;
		}
		tr,td{
		border:1px solid black;
		hegiht:30px;
		}
		</style>  -->
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
							<a href="index.html"><span>졸업</span>관리시스템</a>
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
										<li class="active"><a href="graduation_require">졸업요건</a></li>
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
						<h2>졸업요건 페이지</h2>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Breadcrumbs -->
		
		<!-- Start Service -->
		<section id="service" class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 wow fadeIn">
						<div class="section-title center">
							<h2>~~과<span>졸업 요건</span></h2>
							<p>~~~</p>
						</div>
					</div>
				</div>
				<div class="row">
				<!-- Single Service -->
					<div class="col-md-6 col-md-offset-3 wow fadeIn" data-wow-delay="0.4s">
	
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>순서</th>
									<th>이름</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="connectList" items="${ConnectList }" varStatus="status">
									<tr >
										<td>${status.count}</td>
										<td><a href="major_require?id=${connectList.id}">${connectList.name }</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Service -->
		
		
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
		<%@include file="/WEB-INF/views/include/javascript.jsp" %>

    </body>
</html>