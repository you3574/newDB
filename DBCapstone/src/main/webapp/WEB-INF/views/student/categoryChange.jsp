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
									<li class="active"><a href="#">예외사항 신청</a>
										<ul class="sub-menu">
											<li><a href="request">대체과목 신청</a></li>
											<li><a href="categorychange">이수구분변경 신청</a></li>
										</ul></li>
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
					<h2>이수구분변경 신청</h2>
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
							<h2>신청 가능 과목</h2>
							학점을 취득한 과목만 신청이 가능합니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">이수 구분</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="MyRecord" items="${MyRecord}">
									<tr class="category_click" id="${MyRecord.id}"
										data-target="#modalform" data-toggle="modal">
										<td>${ MyRecord.year }</td>
										<td>${ MyRecord.semester }</td>
										<td>${ MyRecord.courseId }</td>
										<td>${ MyRecord.subjectName}</td>
										<td>${ MyRecord.category}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>신청 과목</h2>
							이수 구분 변경을 신청한 과목을 보여줍니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">변경 신청</th>
									<th scope="col">신청 사유</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${ApplyList}">
									<tr>
										<td>${ list.year }</td>
										<td>${ list.semester }</td>
										<td>${ list.courseId }</td>
										<td>${ list.subjectName}</td>
										<td>${ list.category}->${ list.changeCategory}</td>
										<td>${ list.reason}</td>
										<td><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>승인 과목</h2>
							이수 구분 변경이 승인된 과목을 보여줍니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">변경 신청</th>
									<th scope="col">신청 사유</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${AllowList}">
									<tr>
										<td>${ list.year }</td>
										<td>${ list.semester }</td>
										<td>${ list.courseId }</td>
										<td>${ list.subjectName}</td>
										<td>${ list.category}->${ list.changeCategory}</td>
										<td>${ list.reason}</td>
										<td><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="info-main">
						<div class="section-title left">
							<p>
							<h2>거절 과목</h2>
							이수 구분 변경 신청이 거절된 과목을 보여줍니다.
							</p>
						</div>
						<table class="table table-hover">
							<thead style="background-color: lightgrey;">
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">과목코드</th>
									<th scope="col">이름</th>
									<th scope="col">변경 신청</th>
									<th scope="col">신청 사유</th>
									<th scope="col">거절 사유</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${RejectList}">
									<tr>
										<td>${ list.year }</td>
										<td>${ list.semester }</td>
										<td>${ list.courseId }</td>
										<td>${ list.subjectName}</td>
										<td>${ list.category}->${ list.changeCategory}</td>
										<td>${ list.reason}</td>
										<td>${ list.comment}</td>
										<td><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span></td>
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
									<h2>이수 변경 신청</h2>
								</div>
								<br />
								<!-- body -->
								<div class="modal-body">
									<table class="table table-hover">
										<thead style="background-color: lightgrey;">
											<tr>
												<th scope="col">년도</th>
												<th scope="col">학기</th>
												<th scope="col">과목코드</th>
												<th scope="col">이름</th>
												<th scope="col">이수 구분</th>
												<th scope="col">신청 구분</th>
											</tr>
										</thead>
										<tbody id="categoruChange">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td id="select">
													
												</td>
											</tr>
										</tbody>
									</table>
									<div class="form-group">
										<label>신청 사유</label>
										<input type="text" class="form-control" id="reason" placeholder="사유를 입력하세요.">
								  	</div>
								</div>
								<br />
								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" id="change_submit"
										class="btn btn-default" value="submit">신청하기</button>
									&nbsp;
									<button type="button" class="btn btn-default"
										data-dismiss="modal">되돌아가기</button>
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
		var id ;
		var year;
		var semester;
		var courseId;
		var subjectName;
		var categoty;
		
		$('.category_click').click(function() {
			id = $(this).attr("id");
			year = $(this).children('td').eq(0).text();
			semester = $(this).children('td').eq(1).text();
			courseId = $(this).children('td').eq(2).text();
			subjectName = $(this).children('td').eq(3).text();
			categoty = $(this).children('td').eq(4).text();

			$("#categoruChange>tr>td").eq(0).text(year);
			$("#categoruChange>tr>td").eq(1).text(semester);
			$("#categoruChange>tr>td").eq(2).text(courseId);
			$("#categoruChange>tr>td").eq(3).text(subjectName);
			$("#categoruChange>tr>td").eq(4).text(categoty);
			
			$("#select").html("<select class='form-control' id='selectform'>"+
				"<option>전필</option><option>전선</option>"+
				"<option>교필</option><option>교선</option>"+
				"<option>복필</option><option>복선</option>"+
				"<option>부필</option><option>부선</option>"+
				"</select>");
			

			//같은 이수 구분으로 선택했으면 불가능하게 하기

		});
		
		$("#change_submit").click(function(){
			//alert($("#selectform option:selected").val());
			var selectVal = $("#selectform option:selected").val();
			var reason = $("#reason").val();
			if(categoty == selectVal){
				alert("이수 구분이 같습니다.");
				return false;
			}else if(reason==""){
				alert("변경 사유를 입력하세요.");
				return false;
			}
			
			
			//var itemString = '<c:out value="${ItemString}"/>';
			var sendData;
			sendData = JSON.stringify({
				"studentId":		'<c:out value="${loginUser.studentId}"/>',
	            "recordId":			id,
	            "courseId":			courseId,
	            "subjectName": 		subjectName,
	            "category":			categoty,
	            "changeCategory":	selectVal,
	            "semester":			semester,
	            "year":				year,
	            "reason":			reason
	        });	
			
			$.ajax({
				url: "categorychangeapply",
				method: "POST",
				data:sendData,
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
			});
		});
		
	});
	</script>

</body>
</html>