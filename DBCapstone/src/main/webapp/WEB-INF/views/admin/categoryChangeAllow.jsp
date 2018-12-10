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
<style>
.checkimg {
	display: inline;
}

#our-skill {
	padding: 10px;
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
									<li><a href="student">메인페이지</a></li>
									<li><a href="graduation">졸업관리</a></li>
									<li><a href="#">예외사항 관리</a>
											<ul class="sub-menu">
												<li><a href="departreplace">대체과목 관리</a></li>
												<li><a href="categoryChangeAllow">이수구분변경 관리</a></li>	
											</ul>
									</li>	
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
					<h2>이수구분변경 목록</h2>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Breadcrumbs -->


	<!-- Our Skill -->
	<section id="our-skill" class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 wow fadeIn">
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>신청 목록</h2>
							클릭하여 허가합니다.
							</p>
						</div>
						<table class="table">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">학번</th>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">이수 구분</th>
									<th scope="col">신청</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="list" items="${Status0}">
									<tr class="category_click" id="${list.id}"
										data-target="#modalform" data-toggle="modal">
										<td>${ list.studentId }</td>
										<td>${ list.year }</td>
										<td>${ list.semester }</td>
										<td>${ list.courseId }</td>
										<td>${ list.subjectName}</td>
										<td>${ list.category}</td>
										<td>${ list.changeCategory}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div class="modal fade" id="modalform">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2 class="modal-title">신청 정보</h2>
								</div>
								<!-- body -->
								<div id="modal-body" class="modal-body">
									<table class="table">
										<tbody>
											<tr>
												<th scope="row" style="width: 30%">이름</th>
												<td id="stname"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">학번</th>
												<td id="t1"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">학과</th>
												<td id="departname"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">년도</th>
												<td id="t2"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">학기</th>
												<td id="t3"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">과목코드</th>
												<td id="t4"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">이름</th>
												<td id="t5"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">이수 구분</th>
												<td id="t6"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">신청</th>
												<td id="t7"></td>
											</tr>
											<tr>
												<th scope="row" style="width: 30%">신청 사유</th>
												<td id="t8"></td>
										</tbody>
									 </table>
									 <div class="form-group">
										<label>허가 또는 거절 사유</label>
										<input type="text" class="form-control" id="comment" placeholder="사유를 입력하세요.">
								  	</div>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="change_allow"
										class="btn btn-primary" >허가</button>
										&nbsp;
									<button type="button" id="change_reject"
										class="btn btn-danger" >거절</button>
									
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
					<!-- 
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>신청 과목</h2>
							관리자의 승인을 대기 중입니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">신청 구분</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="MyRecord" items="${MyRecord}">
									<tr class="request_click" id="${MyRecord.id}"
										data-target="#layerpop_sm3" data-toggle="modal">
										<td>${ MyRecord.year }</td>
										<td>${ MyRecord.semester }</td>
										<td>${ MyRecord.courseId }</td>
										<td>${ MyRecord.subjectName}</td>
										<td>${ MyRecord.subjectName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					 -->

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
						<div class="logo" style="">
							<a href="index.html"><span>성공회</span>대학교</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Footer Top -->
	</footer>
	<!--/ End Footer -->

	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
	<script>
	$(function () {
		
		var id;
		var studentId;
		var changeCategory;
		
		$('.category_click').click(function() {
			id = $(this).attr("id");
			studentId = $(this).children('td').eq(0).text();
			changeCategory = $(this).children('td').eq(6).text();
			//alert(id+" "+studentId);
			
			var sendData = "id="+id+"&studentId="+studentId;
			
			$.ajax({
				url: "getChangeOne",
				method: "GET",
				data:	sendData,
				dataType: "json",
				success:function(data){
					//alert(data.reason);
					
					//$("#modal-body").html("<h5>신청자 학번 :"+data.studentId+"</h5>"+
					//		"<h5>년도 :"+data.year+"</h5>"
					$("#t1").text(data.ChangeOne.studentId);
					$("#t2").text(data.ChangeOne.year);
					$("#t3").text(data.ChangeOne.semester);
					$("#t4").text(data.ChangeOne.courseId);
					$("#t5").text(data.ChangeOne.subjectName);
					$("#t6").text(data.ChangeOne.category);
					$("#t7").text(data.ChangeOne.changeCategory);
					$("#t8").text(data.ChangeOne.reason);
					$("#stname").text(data.StudentName);
					$("#departname").text(data.DepartName);
					
				},
				error: function(xhr, status, error){
					alert(error);
					alert(xhr.responseText);
					
         	   }
			}); //ajax 끝

		});//클릭 끝
			
		//허가
		$('#change_allow').click(function() {
			
			if(confirm('허가하시겠습니까?')){
				var comment = $("#comment").val();
				
				if(comment=="")
					comment="허가합니다.";
				
				var sendData = "id="+id+"&changeCategory="+changeCategory+"&comment="+comment;
				
				$.ajax({
					url: "changeallow",
					method: "GET",
					data: sendData,
					dataType: "text",
					contentType: "application/json;charset=UTF-8",
					success:function(data){
						alert(data);
						location.reload();
					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	   }
				}); //ajax 끝
			}
			else
				return false;
		});
		
		//거절
		$('#change_reject').click(function() {
			if(confirm('거절하시겠습니까?')){
				var comment = $("#comment").val();
				
				if(comment=="")
					comment="거절합니다.";
				
				var sendData = "id="+id+"&comment="+comment;
				
				$.ajax({
					url: "changereject",
					method: "GET",
					data: sendData,
					dataType: "text",
					contentType: "application/json;charset=UTF-8",
					success:function(data){
						alert(data);
						location.reload();
					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	   }
				}); //ajax 끝
			}
			else
				return false;
		});
		
	});
	</script>

</body>
</html>