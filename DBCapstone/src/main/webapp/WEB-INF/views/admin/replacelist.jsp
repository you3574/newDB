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

<%@include file="/WEB-INF/views/include/css.jsp"%>
<style>
.menubar li ul {
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
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
									<li><a href="addadmin">관리자 추가</a></li>
									<li><a href="search">학생조회</a></li>
									<li><a href="graduation_require">졸업요건</a></li>
									<li><a href="#">예외사항 관리</a>
										<ul class="sub-menu">
											<li><a href="departreplace">대체과목 관리</a></li>
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
					<h2>대체과목 수정</h2>
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
					<div class="info-main">
						<div class="section-title left">
							<h2>${DepartmentName } 대체과목</h2>
							<div class="pull-right">
								<button type="button" class="btn btn-info" style="margin: 10px"
									data-target="#modalform1" data-toggle="modal">추가하기</button>
							</div>
						</div>
						<table class="table">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">순서</th>
									<th scope="col">대분류</th>
									<th scope="col">학과</th>
									<th scope="col">폐지 코드</th>
									<th scope="col">폐지과목 이름</th>
									<th scope="col">대체 코드</th>
									<th scope="col">대체과목 이름</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${ReplaceList}" varStatus="status">
									<tr class="replace_click" data-target="#modalform2"
										data-toggle="modal" id="${list.id}">
										<td>${status.count }</td>
										<td>${list.largeCategory }</td>
										<td>${list.departmentName }</td>
										<td>${list.abolishCode }</td>
										<td>${list.abolishName }</td>
										<td>${list.replacementCode }</td>
										<td>${list.replacementName }</td>
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
									<h2>대체과목 추가</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label>계열</label>
											<select class="form-control" id="input_largeCategory">
												<option value="0">공학계열</option>
												<option value="1">사회계열</option>
												<option value="2">인문계열</option>
												<option value="3">교양학부</option>
											</select>
										</div>
										<div class="form-group">
											<label>폐지 과목 코드</label>
											<input type="text" class="form-control" id="input_abolishCode">
										</div>
										<div class="form-group">
											<label>폐지 과목 이름</label>
											<input type="text" class="form-control" id="input_abolishName">
										</div>
										<div class="form-group">
											<label>대체 과목 분류</label>
											<select class="form-control" id="input_replacecategory">
												<option value="0">대체과목 추가</option>
												<option value="1">전공 선택과목으로 대체</option>
												<option value="2">교양사회영역 선택과목으로 대체</option>
												<option value="3">교양인문영역 선택과목으로 대체</option>
												<option value="4">교양자연영역 선택과목으로 대체</option>
												<option value="5">사회진출실 개설 교과목으로 대체</option>
												<option value="6">경제학전공 과목에서 선택</option>
												<option value="7">정치학전공 과목에서 선택</option>
												<option value="8">사회학전공 과목에서 선택</option>
											</select>
										</div>
										<div class="form-group" >
											<label>대체 과목 코드</label>
											<input type="text"class="form-control" id="input_replacementCode">
										</div>
										<div class="form-group">
											<label>대체 과목 이름</label>
											<input type="text" class="form-control" id="input_replacementName">
										</div>
										<div class="form-group">
											<label>전공 분류</label>
											<select class="form-control" id="input_category">
												<option value="0">전선</option>
												<option value="1">전필</option>
												<option value="2">교선</option>
												<option value="3">교필</option>
												<option value="4">평교</option>
												<option value="5">교직</option>
											</select>
										</div>
										<div class="form-group">
											<label>학점</label>
											<input type="text" class="form-control" id="input_credits">
										</div>
									</form>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="inputReplace"
										class="btn btn-primary" value="submit">추가하기</button>
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
									<h2>대체과목 추가</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<form>
										<input type="hidden" id="edit_id">
										<div class="form-group">
											<label>폐지 과목 코드</label>
											<input type="text" class="form-control" id="edit_abolishCode" readonly>
										</div>
										<div class="form-group">
											<label>폐지 과목 이름</label>
											<input type="text" class="form-control" id="edit_abolishName" readonly>
										</div>
										<div class="form-group">
											<label>대체 과목 분류</label>
											<select class="form-control" id="edit_replacecategory">
												<option value="0">대체과목 추가</option>
												<option value="1">전공 선택과목으로 대체</option>
												<option value="2">교양사회영역 선택과목으로 대체</option>
												<option value="3">교양인문영역 선택과목으로 대체</option>
												<option value="4">교양자연영역 선택과목으로 대체</option>
												<option value="5">사회진출실 개설 교과목으로 대체</option>
												<option value="6">경제학전공 과목에서 선택</option>
												<option value="7">정치학전공 과목에서 선택</option>
												<option value="8">사회학전공 과목에서 선택</option>
											</select>
										</div>
										<div class="form-group" >
											<label>대체 과목 코드</label>
											<input type="text"class="form-control" id="edit_replacementCode">
										</div>
										<div class="form-group">
											<label>대체 과목 이름</label>
											<input type="text" class="form-control" id="edit_replacementName">
										</div>
										<div class="form-group">
											<label>전공 분류</label>
											<select class="form-control" id="edit_category">
												<option value="0">전선</option>
												<option value="1">전필</option>
												<option value="2">교선</option>
												<option value="3">교필</option>
												<option value="4">평교</option>
												<option value="5">교직</option>
											</select>
										</div>
										<div class="form-group">
											<label>학점</label>
											<input type="text" class="form-control" id="edit_credits">
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
					<!-- 모달2 끝-->
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
	<%@include file="/WEB-INF/views/include/javascript.jsp"%>
	
	<script type="text/javascript">
	$(function() {
		
		$("#input_replacecategory").change(function(){
			//alert($("#input_category option:selected").val());
			
			if($("#input_replacecategory option:selected").val() == 0){
				$("#input_replacementCode").val("");
				$("#input_replacementName").val("");
				$("#input_replacementCode").attr("readonly", false);
				$("#input_replacementName").attr("readonly", false);
			}else{
				$("#input_replacementCode").val("");
				$("#input_replacementName").val("");
				
				$("#input_replacementName").val($("#input_replacecategory option:selected").text());
				
				$("#input_replacementCode").attr("readonly", true);
				$("#input_replacementName").attr("readonly", true);
			}
		});
		
		$("#edit_replacecategory").change(function(){
			//alert($("#edit_category option:selected").val());
			
			if($("#edit_replacecategory option:selected").val() == 0){
				$("#edit_replacementCode").val("");
				$("#edit_replacementName").val("");
				$("#edit_replacementCode").attr("readonly", false);
				$("#edit_replacementName").attr("readonly", false);
			}else{
				$("#edit_replacementCode").val("");
				$("#edit_replacementName").val("");
				
				$("#edit_replacementName").val($("#edit_replacecategory option:selected").text());
				
				$("#edit_replacementCode").attr("readonly", true);
				$("#edit_replacementName").attr("readonly", true);
			}
		});
		
		
		//대체 과목 추가
		$("#inputReplace").click(function() {
			
			var sendData1 = JSON.stringify({
				"largeCategory" : $("#input_largeCategory option:selected").text(),
				"departmentId" : '<c:out value="${DepartmentId}"/>',
				"departmentName" : '<c:out value="${DepartmentName}"/>',
				"abolishCode" : $("#input_abolishCode").val(),
				"abolishName" : $("#input_abolishName").val(),
				"category" : $("#input_category").val(),
				"credits" : $("#input_credits").val(),
				"replacementCode" : $("#input_replacementCode").val(),
				"replacementName" : $("#input_replacementName").val()
	        });	
			
			$.ajax({
				url: "replacementinput",
				method: "POST",
				data:sendData1,
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
		
		//대체 과목 수정
		$(".replace_click").click(function() {
			var id = $(this).attr("id");
			
			$.ajax({
				url: "replacementedit",
				method: "POST",
				data: id,
				dataType: "json",
				contentType: "application/json;charset=UTF-8",
				//contentType: "text/plain;charset=UTF-8",
				success:function(data){
					
					//alert(data.id);
					$("#edit_id").val(data.id);
					$("#edit_abolishCode").val(data.abolishCode);
					$("#edit_abolishName").val(data.abolishName);
					$("#edit_replacementCode").val(data.replacementCode);
					$("#edit_replacementName").val(data.replacementName);
					$("#edit_credits").val(data.credits);
					
					
					$("#edit_delete").click(function() {
						if(confirm("삭제하시겠습니까?")){
							var id = $("#edit_id").val();
							$.ajax({
								url: "replacedelete",
								method: "POST",
								data: id,
								dataType: "text",
								contentType: "application/json;charset=UTF-8",
								//contentType: "text/plain;charset=UTF-8",
								success:function(data){
									alert("삭제했습니다.");
									location.reload();
								},
								error: function(xhr, status, error){
									alert(error);
									alert(xhr.responseText);
									
				         	    }
							});
						}else{
							return false;
						}
					});
					
					$("#edit_submit").click(function() {
						
						if(confirm("수정하시겠습니까?")){
							
							var sendData2 = JSON.stringify({
								"id" : $("#edit_id").val(),
								"category" : $("#edit_category").val(),
								"credits" : $("#edit_credits").val(),
								"replacementCode" : $("#edit_replacementCode").val(),
								"replacementName" : $("#edit_replacementName").val()
							});
							
							$.ajax({
								url: "replacesubmit",
								method: "POST",
								data: sendData2,
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
							
						}else{
							return false;
						}
					});
					
					
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