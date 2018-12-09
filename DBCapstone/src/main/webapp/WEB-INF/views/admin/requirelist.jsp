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
									<li><a href="admin">메인페이지</a></li>
									<li><a href="student_review">학생조회</a></li>
									<li class="active"><a href="graduation_require">졸업요건</a></li>
									<li><a href="#">예외사항 관리</a>
										<ul class="sub-menu">
											<li><a href="subject">대체과목 관리</a></li>
											<li><a href="categoryChangeAllow">이수구분변경 관리</a></li>
										</ul></li>
									<li><a href="question_admin">문의사항</a></li>
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
					<h2>졸업 요건</h2>
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
							<h2>전공</h2>
							<div class="pull-right">
								<button type="button" class="btn btn-info" style="margin: 10px"
									data-target="#modalform2" data-toggle="modal" id="inputMajor">추가하기</button>
							</div>
						</div>
						<table class="table">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">년도</th>
									<th scope="col">학과</th>
									<th scope="col">이름</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="list" items="${MajorList}" varStatus="status">
									<!-- 
									<tr data-target="#modalform" data-toggle="modal" value="${ list.id }">
									 -->
									<tr class="major_click" data-target="#modalform1"
										data-toggle="modal" id="${ list.id }">
										<td>${status.count }</td>
										<td>${ list.year }</td>
										<td>${ list.departmentName }</td>
										<td>${ list.name }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 모달1 -->
					<div class="modal fade" id="modalform1">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2>전공 조건 수정</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label>이름</label>
											<select class="form-control" id="editname">
												<option value="1">전공기초</option>
												<option value="2">전공심화</option>
												<option value="3">타과복수전공</option>
												<option value="4">타과부전공</option>
												<option value="5">복수전공</option>
												<option value="6">부전공</option>
											</select>
										</div>
										<div class="form-group">
											<label>전공 필수 학점</label> <input type="text"
												class="form-control" id="editrequireMajor">
										</div>
										<div class="form-group">
											<label>전공 전체 학점</label> <input type="text"
												class="form-control" id="edittotalMajor">

										</div>
										<div class="form-group">
											<label>교양 전체 학점</label> <input type="text"
												class="form-control" id="edittotalCultural" readonly>

										</div>
										<div class="form-group">
											<label>전체 학점</label> <input type="text" class="form-control"
												id="edittotal">

										</div>
										<div class="form-group">
											<label>1학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editfirstSemester">

										</div>
										<div class="form-group">
											<label>2학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editsecondSemester">

										</div>
										<div class="form-group">
											<label>3학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editthirdSemester">

										</div>
										<div class="form-group">
											<label>4학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editfourthSemester">

										</div>
										<div class="form-group">
											<label>5학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editfifthSemester">

										</div>
										<div class="form-group">
											<label>6학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editsixthSemester">

										</div>
										<div class="form-group">
											<label>7학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editseventhSemester">

										</div>
										<div class="form-group">
											<label>8학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="editeighthSemester">

										</div>
									</form>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="edit_delete"
										class="btn btn-danger" value="delete">삭제하기</button>
									&nbsp;
									<button type="button" id="edit_submit"
										class="btn btn-success" value="submit">수정하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 모달1 끝-->
					
					<!-- 모달2 -->
					<div class="modal fade" id="modalform2">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2>전공 조건 추가</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label>년도</label> <input type="text" class="form-control"
												id="inputyear">
										</div>
										<div class="form-group">
											<label>이름</label>
											<select class="form-control" id="inputname">
												<option value="1">전공기초</option>
												<option value="2">전공심화</option>
												<option value="3">타과복수전공</option>
												<option value="4">타과부전공</option>
												<option value="5">복수전공</option>
												<option value="6">부전공</option>
											</select>
										</div>
										<div class="form-group">
											<label>전공 필수 학점</label> <input type="text"
												class="form-control" id="inputrequireMajor">
										</div>
										<div class="form-group">
											<label>전공 전체 학점</label> <input type="text"
												class="form-control" id="inputtotalMajor">

										</div>
										<div class="form-group">
											<label>교양 전체 학점</label> <input type="text"
												class="form-control" id="inputtotalCultural" readonly>

										</div>
										<div class="form-group">
											<label>전체 학점</label> <input type="text" class="form-control"
												id="inputtotal">

										</div>
										<div class="form-group">
											<label>1학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputfirstSemester">

										</div>
										<div class="form-group">
											<label>2학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputsecondSemester">

										</div>
										<div class="form-group">
											<label>3학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputthirdSemester">

										</div>
										<div class="form-group">
											<label>4학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputfourthSemester">

										</div>
										<div class="form-group">
											<label>5학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputfifthSemester">

										</div>
										<div class="form-group">
											<label>6학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputsixthSemester">

										</div>
										<div class="form-group">
											<label>7학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputseventhSemester">

										</div>
										<div class="form-group">
											<label>8학기 전공 필수 과목</label> <input type="text"
												class="form-control" id="inputeighthSemester">

										</div>
									</form>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="input_submit"
										class="btn btn-primary" value="submit">추가하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 모달2 끝-->


					<div class="info-main">
						<div class="section-title left">
							<h2>교양</h2>
							<div class="pull-right">
								<button type="button" class="btn btn-info" style="margin: 10px"
									data-target="#modalform4" data-toggle="modal" id="inputCul">추가하기</button>
							</div>
						</div>
						<table class="table">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">년도</th>
									<th scope="col">학과</th>
									<th scope="col">이름</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="list" items="${CulturalList}" varStatus="status">
									<tr class="cultural_click" data-target="#modalform3"
										data-toggle="modal" id="${ list.id }">
										<td>${status.count }</td>
										<td>${ list.year }</td>
										<td>${ list.departmentName }</td>
										<td>${ list.name }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 모달3 -->
					<div class="modal fade" id="modalform3">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2>교양 조건 수정</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label>이름</label>
											<select class="form-control" id="edit_cul_name">
												<option value="1">전공기초</option>
												<option value="2">전공심화</option>
												<option value="3">타과복수전공</option>
												<option value="4">타과부전공</option>
											</select>
										</div>
										<div class="form-group">
											<label>채플</label> <input type="text"
												class="form-control" id="edit_cul_chapel">
										</div>
										<div class="form-group">
											<label>사회 봉사</label> <input type="text"
												class="form-control" id="edit_cul_voluntary">

										</div>
										<div class="form-group">
											<label>교양 전체 학점</label> <input type="text"
												class="form-control" id="edit_cul_totalCultural">

										</div>
										<div class="form-group">
											<label>교양 필수 과목</label> <input type="text"
												class="form-control" id="edit_cul_requireSubject">

										</div>
										<div class="form-group">
											<label>사회 봉사 과목</label> <input type="text"
												class="form-control" id="edit_cul_voluntarySubject">

										</div>
										<div class="form-group">
											<label>학과 지정 교양 과목</label> <input type="text"
												class="form-control" id="edit_cul_additionalSubject">

										</div>
									</form>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="edit_cul_delete"
										class="btn btn-danger" value="delete">삭제하기</button>
									&nbsp;
									<button type="button" id="edit_cul_submit"
										class="btn btn-success" value="submit">수정하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 모달3 끝-->
					
					<!-- 모달4 -->
					<div class="modal fade" id="modalform4">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- header title -->
									<h2>교양 조건 추가</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label>년도</label> <input type="text"
												class="form-control" id="input_cul_year">
										</div>
										<div class="form-group">
											<label>이름</label>
											<select class="form-control" id="input_cul_name">
												<option value="1">전공기초</option>
												<option value="2">전공심화</option>
												<option value="3">타과복수전공</option>
												<option value="4">타과부전공</option>
											</select>
										</div>
										<div class="form-group">
											<label>채플</label> <input type="text"
												class="form-control" id="input_cul_chapel">
										</div>
										<div class="form-group">
											<label>사회 봉사</label> <input type="text"
												class="form-control" id="input_cul_voluntary">

										</div>
										<div class="form-group">
											<label>교양 전체 학점</label> <input type="text"
												class="form-control" id="input_cul_totalCultural">

										</div>
										<div class="form-group">
											<label>교양 필수 과목</label> <input type="text"
												class="form-control" id="input_cul_requireSubject">

										</div>
										<div class="form-group">
											<label>사회 봉사 과목</label> <input type="text"
												class="form-control" id="input_cul_voluntarySubject">

										</div>
										<div class="form-group">
											<label>학과 지정 교양 과목</label> <input type="text"
												class="form-control" id="input_cul_additionalSubject">

										</div>
									</form>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="input_cul_submit"
										class="btn btn-primary" value="submit">추가하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 모달4 끝-->

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
		$(function() {
	
			//전공 수정
			$(".major_click").click(function() {
				var id = $(this).attr("id");

				$.ajax({
					url: "getMajorById",
					method: "POST",
					data:id,
					dataType: "json",
					contentType: "application/json;charset=UTF-8",
					//contentType: "text/plain;charset=UTF-8",
					success:function(data){
						//alert(data.id);
						//alert(data.name);
						//location.reload()
						var majorId = data.id;
						$("#editrequireMajor").val(data.requireMajor);
						$("#edittotalMajor").val(data.totalMajor);
						$("#edittotalCultural").val(data.totalCultural);
						$("#edittotal").val(data.total);
						$("#editfirstSemester").val(data.firstSemester);
						$("#editsecondSemester").val(data.secondSemester);
						$("#editthirdSemester").val(data.thirdSemester);
						$("#editfourthSemester").val(data.fourthSemester);
						$("#editfifthSemester").val(data.fifthSemester);
						$("#editsixthSemester").val(data.sixthSemester);
						$("#editseventhSemester").val(data.seventhSemester);
						$("#editeighthSemester").val(data.eighthSemester);
						
						$("#edit_delete").click(function(){
							
							//alert(majorId);
							//alert(typeof(majorId));
							var sendData1 = "id="+majorId;
							$.ajax({
								url: "deleteMajorById",
								method: "GET",
								data:sendData1,
								dataType: "text",
								success:function(data){
									alert("삭제했습니다.");
									location.reload();
								},
								error: function(xhr, status, error){
									alert(error);
									alert(xhr.responseText);
									
				         	    }
							});
						});
						
						$("#edit_submit").click(function(){
							
							var sendData2 = JSON.stringify({
								"id" : data.id,
								"name" : $("#editname option:selected").text(),
								"requireMajor" : $("#editrequireMajor").val(),
								"totalMajor" : $("#edittotalMajor").val(),
								"total" : $("#edittotal").val(),
								"firstSemester" : $("#editfirstSemester").val(),
								"secondSemester" : $("#editsecondSemester").val(),
								"thirdSemester" : $("#editthirdSemester").val(),
								"fourthSemester" : $("#editfourthSemester").val(),
								"fifthSemester" : $("#editfifthSemester").val(),
								"sixthSemester" : $("#editsixthSemester").val(),
								"seventhSemester" : $("#editseventhSemester").val(),
								"eighthSemester" : $("#editeighthSemester").val()
					        });	
							
							
							$.ajax({
								url: "editMajor",
								method: "POST",
								data:sendData2,
								dataType: "json",
								contentType: "application/json;charset=UTF-8",
								//contentType: "text/plain;charset=UTF-8",
								success:function(data){
									alert("수정했습니다.");
									location.reload();
								},
								error: function(xhr, status, error){
									alert(error);
									alert(xhr.responseText);
									
				         	    }
							});
						});
						

					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	    }
				});
				

			});
			
			//전공 추가
			$("#input_submit").click(function() {
				
				var sendData3 = JSON.stringify({
					"departmentId" : '<c:out value="${departmentId}"/>',
					"year" : $("#inputyear").val(),
					"name" : $("#inputname option:selected").text(),
					"requireMajor" : $("#inputrequireMajor").val(),
					"totalMajor" : $("#inputtotalMajor").val(),
					"total" : $("#inputtotal").val(),
					"firstSemester" : $("#inputfirstSemester").val(),
					"secondSemester" : $("#inputsecondSemester").val(),
					"thirdSemester" : $("#inputthirdSemester").val(),
					"fourthSemester" : $("#inputfourthSemester").val(),
					"fifthSemester" : $("#inputfifthSemester").val(),
					"sixthSemester" : $("#inputsixthSemester").val(),
					"seventhSemester" : $("#inputseventhSemester").val(),
					"eighthSemester" : $("#inputeighthSemester").val()
		        });	
				
				$.ajax({
					url: "inputMajor",
					method: "POST",
					data:sendData3,
					dataType: "text",
					contentType: "application/json;charset=UTF-8",
					//contentType: "text/plain;charset=UTF-8",
					success:function(data){
						alert("추가했습니다.");
						location.reload();
					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	    }
				});

			});
			
			//교양 수정
			$(".cultural_click").click(function() {
				
				var id = $(this).attr("id");

				$.ajax({
					url: "getCulById",
					method: "POST",
					data:id,
					dataType: "json",
					contentType: "application/json;charset=UTF-8",
					//contentType: "text/plain;charset=UTF-8",
					success:function(data){
						//alert(data.id);
						//alert(data.name);
						//location.reload()
						var culId = data.id;
						$("#edit_cul_chapel").val(data.chapel);
						$("#edit_cul_voluntary").val(data.voluntary);
						$("#edit_cul_totalCultural").val(data.totalCultural);
						$("#edit_cul_requireSubject").val(data.requireSubject);
						$("#edit_cul_voluntarySubject").val(data.voluntarySubject);
						$("#edit_cul_additionalSubject").val(data.additionalSubject);
					
						
						$("#edit_cul_delete").click(function(){
							
							//alert(majorId);
							//alert(typeof(majorId));
							var sendData4 = "id="+culId;
							$.ajax({
								url: "deleteCulById",
								method: "GET",
								data:sendData4,
								dataType: "text",
								success:function(data){
									alert("삭제했습니다.");
									location.reload();
								},
								error: function(xhr, status, error){
									alert(error);
									alert(xhr.responseText);
									
				         	    }
							});
						});
						
						$("#edit_cul_submit").click(function(){
							
							var sendData5 = JSON.stringify({
								"id" : culId,
								"year" : data.year,
								"departmentId" : data.departmentId,
								"name" : $("#edit_cul_name option:selected").text(),
								"chapel" : $("#edit_cul_chapel").val(),
								"voluntary" : $("#edit_cul_voluntary").val(),
								"totalCultural" : $("#edit_cul_totalCultural").val(),
								"requireSubject" : $("#edit_cul_requireSubject").val(),
								"voluntarySubject" : $("#edit_cul_voluntarySubject").val(),
								"additionalSubject" : $("#edit_cul_additionalSubject").val()
					        });	
							
							
							$.ajax({
								url: "editCul",
								method: "POST",
								data:sendData5,
								dataType: "text",
								contentType: "application/json;charset=UTF-8",
								//contentType: "text/plain;charset=UTF-8",
								success:function(data){
									alert("수정했습니다.");
									location.reload();
								},
								error: function(xhr, status, error){
									alert(error);
									alert(xhr.responseText);
									
				         	    }
							});
						});
						

					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	    }
				});

			});
			
			//교양 추가
			$("#input_cul_submit").click(function() {
				
				var sendData5 = JSON.stringify({
					"departmentId" : '<c:out value="${departmentId}"/>',
					"year" : $("#input_cul_year").val(),
					"name" : $("#input_cul_name option:selected").text(),
					"chapel" : $("#input_cul_chapel").val(),
					"voluntary" : $("#input_cul_voluntary").val(),
					"totalCultural" : $("#input_cul_totalCultural").val(),
					"requireSubject" : $("#input_cul_requireSubject").val(),
					"voluntarySubject" : $("#input_cul_voluntarySubject").val(),
					"additionalSubject" : $("#input_cul_additionalSubject").val()
		        });	
				
				$.ajax({
					url: "inputCul",
					method: "POST",
					data:sendData5,
					dataType: "text",
					contentType: "application/json;charset=UTF-8",
					//contentType: "text/plain;charset=UTF-8",
					success:function(data){
						alert("추가했습니다.");
						location.reload();
					},
					error: function(xhr, status, error){
						alert(error);
						alert(xhr.responseText);
						
	         	    }
				});

			});
			
			

		});
	</script>

</body>
</html>