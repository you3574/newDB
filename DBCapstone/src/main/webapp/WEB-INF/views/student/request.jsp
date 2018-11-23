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
									<li><a href="student">메인페이지</a></li>
									<li><a href="graduation">졸업관리</a></li>
									<li class="active"><a href="request">예외사항 신청</a></li>
									<li><a href="question">문의사항</a></li>
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


	<!-- Our Skill -->
	<section id="our-skill" class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
					<!-- Info Main -->
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>폐지과목</h2>
							(폐지과목을 클릭 시, 대체과목리스트가 나타납니다.)
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">과목코드</th>
									<th scope="col">과목명</th>
									<th scope="col">세부영역</th>
									<th scope="col">학점</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="replacement" items="${replacement}">
									<tr class="request_click" id="${replacement.id}"
										data-target="#layerpop_sm3" data-toggle="modal">
										<td>${ replacement.abolishCode }</td>
										<td>${ replacement.abolishName }</td>
										<td>${ replacement.category }</td>
										<td>${ replacement.credits}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<!--/ End Info Main -->
					<div class="modal fade" id="layerpop_sm3">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 70%; left: 15%;">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2>대체과목 신청</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<table class="table table-hover">
										<thead style="background-color: lightgrey;">
											<tr>
												<th scope="col">선택</th>
												<th scope="col">과목코드</th>
												<th scope="col">과목명</th>
												<th scope="col">세부영역</th>
												<th scope="col">학점</th>
											</tr>
										</thead>
										<form id="requestFrom">
										<tbody id="request">
											<tr>
												<td><input type="radio"  name="ck"/></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
										</form>
									</table>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="replaceRequest_submit"
										class="btn btn-default" value="submit">등록하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
					<!-- Info Main -->
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>신청한 과목</h2>
							대체과목을 신청한 과목이 보여집니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th colspan="2" style="border: 1px solid">폐지과목</th>
									<th colspan="2" style="border: 1px solid">대체과목</th>
								</tr>
								<tr>
									<th scope="col">과목코드</th>
									<th scope="col">과목명</th>
									<th scope="col">과목코드</th>
									<th scope="col">과목명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="replacement" items="${replacement}">
									<tr id="${replacement.id}">
										<td></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<!--/ End Info Main -->
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
							<a href="student"><span>성공회</span>대학교</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
	</footer>


	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
	<script>
	
	$('.request_click').click(function(){
		var id = $(this).attr("id");
		
		$.ajax({
			url: "replaceRequest",
			method: "POST",
			data:id,
			dataType: "json",
			contentType: "application/json;charset=UTF-8",
			success:function(data){
				if(data){
					//alert(data+"성공하셨습니다.");
					$("#request>tr>td").eq(1).text(data.abolishCode);
					$("#request>tr>td").eq(2).text(data.abolishName);
					$("#request>tr>td").eq(3).text(data.category);
					$("#request>tr>td").eq(4).text(data.credits);
					
				}else{
					alert("에러");
				}
			},
			error: function(){
        		alert("에러");
     	    }
			
		});
		
	});

      </script>

</body>
</html>