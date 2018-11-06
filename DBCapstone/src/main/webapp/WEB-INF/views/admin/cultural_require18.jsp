<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<style>
		table{
		border:1px solid black;
		text-align:center;
		}
		tr,td{
		border:1px solid black;
		hegiht:30px;
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
							<h2>졸업요건<span>페이지</span></h2>
							<p>학과 클릭 시, 그 학과 졸업요건 페이지로 넘어갑니다.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- Single Service -->
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-delay="0.4s">
							<div class="single-service">
								<i class="fa fa-check"></i>
								<h2>소프트웨어공학과 졸업요건</h2>
								<div class="single-service">
								<h3>18학번 이전 졸업요건</h3>
								<textarea name="content" id="content"></textarea>
								
								
								</div>
								<h3>학년별 수료학점</h3>
								<div class="single-service">
									<table>
									  	<thead>
										 	<th>구분</th>
									     	<th>교양학점</th>
										 	<th>전공학점</th>
										 	<th>총취득학점</th>
									 	</thead>
									 <tbody>
									 	<tr>
									 		<td>1학년수료</td>
									 		<td></td>
									 		<td></td>
									 		<td></td>
									 	</tr>
									 	<tr>
									 		<td>2학년수료</td>
									 		<td></td>
									 		<td></td>
									 		<td></td>
									 	</tr>
									 	<tr>
									 		<td>3학년수료</td>
									 		<td></td>
									 		<td></td>
									 		<td></td>
									 	</tr>
									 	<tr>
									 		<td>4학년수료</td>
									 		<td></td>
									 		<td></td>
									 		<td></td>
									 	</tr>
									 </tbody>
									 </table>
									</div>
						</div>
						</div>
						<!--/ End Single Service -->
					
			
			<button class="btn btn-default" id="popbutton">수정</button><br/>
								<div class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- remote ajax call이 되는영역 -->
										<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
											  <button type="button" class="close" data-dismiss="modal">×</button>
											  <!-- header title -->
											  <h4 class="modal-title">소프트웨어 공학과 졸업요건 수정</h4>
										</div>
										<!-- body -->
										<div class="modal-body">
										<form:form action="" method="post" modelAttribute=""/>
											<table style="width:300px; border:1px solid black">
											<tr>
											<td><form:textarea style="width:300px; height:200px;" path="content"/></td>
											</tr>
										</div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" >저장</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
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