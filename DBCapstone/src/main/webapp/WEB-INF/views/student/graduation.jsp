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
									<li class="active"><a href="graduation">졸업관리</a></li>
									<li><a href="request">예외사항 신청</a></li>
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
				<div class="col-md-12 col-sm-12 col-xs-12 wow fadeIn">
					<div class="info-main" style="margin-bottom: 30px">
						<div class="section-title">
							<h2>
									${loginUser.dname } / ${loginUser.course }<br />
							</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
					<!-- Info Main -->
					<div class="info-main" style="margin-bottom: 30px">
						<div class="section-title left">
							<h2>
								나의 이수내역<br />
							</h2>
							<p style="padding-left: 0%">이수하지 않은 과목은 빨간색으로 보입니다.</p>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">학기</th>
									<th scope="col">전공 필수 과목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="nameList" items="${NameList }" varStatus="status">
									<tr>
										<th scope="row" style="width: 20%">${status.count}학기</td>
										<td>
										<c:forEach var="semester" items="${nameList}">
											<c:choose>
												<c:when test="${semester.check == false }">
													<font color="red">${semester.name}</font>
												</c:when>
												<c:otherwise>
													${semester.name}
												</c:otherwise>
											</c:choose>
											
										</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<p>
					<h4>사회봉사</h4>
					(아이콘갯수로 이수횟수를 나타냅니다.)
					</p>

					<img style="width: 30px; margin-top: 20px"
						src="/res/images/success.png">

					<p style="margin-bottom: 30px">
					<h4>채플</h4>
					(아이콘갯수로 이수횟수를 나타냅니다.)
					</p>
					<img style="width: 30px; margin-top: 20px"
						src="/res/images/success.png">
					<!--/ End Info Main -->
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12">
					<!-- Skill Main -->
					<div class="skill-main">
						<div class="section-title left">
							<h2>나의 졸업현황</h2>
						</div>
						<div class="some-info">
						</div>
						<!-- Single Skill -->
						<div class="single-skill">
							<div class="skill-info">
								<h4>전체</h4>
							</div>
							<div class="progress">
								<div class="progress-bar" data-percent="${Map.totalPercentage}"
									data-target="#alllayerpop" data-toggle="modal">
									<span>${Map.totalPercentage}%</span>
								</div>
							</div>
						</div>
						<!--/ End Single Skill -->
						<!--/ 모달구현 -->
						<div class="modal fade" id="alllayerpop">
							<div class="modal-dialog">
								<div class="modal-content">
									<!-- header -->
									<div class="modal-header">
										<!-- header title -->
										<h4 class="modal-title">수강과목 목록</h4>
										총 수강 학점 : ${Map.totalSum }
										<!-- body -->
										<div class="modal-body">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">년도</th>
														<th scope="col">학기</th>
														<th scope="col">과목코드</th>
														<th scope="col">과목이름</th>
														<th scope="col">학점</th>
														<th scope="col">성적</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${Map.AllList }">
														<tr>
															<td>${list.year }</td>
															<td>${list.semester}</td>
															<td>${list.courseId}</td>
															<td>${list.name}</td>
															<td>${list.credits}</td>
															<td>${list.grade}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Single Skill -->
						<div class="single-skill">
							<div class="skill-info">
								<h4>전공</h4>
							</div>
							<div class="progress">
								<div class="progress-bar" data-percent="${Map.majorPercentage}"
									data-target="#layerpop" data-toggle="modal">
									<span>${Map.majorPercentage}%</span>
								</div>
							</div>
						</div>
						<!--/ End Single Skill -->
						<!--/ 모달구현 -->
						<div class="modal fade" id="layerpop">
							<div class="modal-dialog">
								<div class="modal-content">
									<!-- header -->
									<div class="modal-header">
										<!-- header title -->
										<h4 class="modal-title">전공과목 수강 목록</h4>
										총 수강 학점 : ${Map.majorSum }
										<!-- body -->
										<div class="modal-body">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">년도</th>
														<th scope="col">학기</th>
														<th scope="col">과목코드</th>
														<th scope="col">과목이름</th>
														<th scope="col">학점</th>
														<th scope="col">성적</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${Map.MajorList }">
														<tr>
															<td>${list.year }</td>
															<td>${list.semester}</td>
															<td>${list.courseId}</td>
															<td>${list.name}</td>
															<td>${list.credits}</td>
															<td>${list.grade}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Single Skill -->
						<div class="single-skill">
							<div class="skill-info">
								<h4>교양</h4>
							</div>
							<div class="progress">
								<div class="progress-bar"
									data-percent="${Map.culturalPercentage}"
									data-target="#layerpop1" data-toggle="modal">
									<span>${Map.culturalPercentage}%</span>
								</div>
							</div>
						</div>
						<!--/ End Single Skill -->

						<!--/ 모달구현 -->
						<div class="modal fade" id="layerpop1">
							<div class="modal-dialog">
								<div class="modal-content">
									<!-- header -->
									<div class="modal-header">
										<!-- header title -->
										<h4 class="modal-title">교양과목 수강 목록</h4>
										총 수강 학점 : ${Map.culturalSum }
										<!-- body -->
										<div class="modal-body">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">년도</th>
														<th scope="col">학기</th>
														<th scope="col">과목코드</th>
														<th scope="col">과목이름</th>
														<th scope="col">학점</th>
														<th scope="col">성적</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${Map.CulturalList }">
														<tr>
															<td>${list.year }</td>
															<td>${list.semester}</td>
															<td>${list.courseId}</td>
															<td>${list.name}</td>
															<td>${list.credits}</td>
															<td>${list.grade}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 특별과정(복전 같은것)이 있을 경우 추가적인 상황 보여줘야함 -->
						<!-- Single Skill -->
						<c:if test="${loginUser.course == '복수전공' }">
							<div class="single-skill">
								<div class="skill-info">
									<h4>복수전공</h4>
								</div>
								<div class="progress">
									<div class="progress-bar"
										data-percent="${Map.doublePercentage}"
										data-target="#layerpop2" data-toggle="modal">
										<span>${Map.doublePercentage}%</span>
									</div>
								</div>
							</div>
							<!--/ End Single Skill -->
	
							<!--/ 모달구현 -->
							<div class="modal fade" id="layerpop2">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- header -->
										<div class="modal-header">
											<!-- header title -->
											<h4 class="modal-title">복수전공 과목 수강 목록</h4>
											총 수강 학점 : ${Map.doubleSum }
											<!-- body -->
											<div class="modal-body">
												<table class="table">
													<thead>
														<tr>
															<th scope="col">년도</th>
															<th scope="col">학기</th>
															<th scope="col">과목코드</th>
															<th scope="col">과목이름</th>
															<th scope="col">학점</th>
															<th scope="col">성적</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="list" items="${Map.DoubleList }">
															<tr>
																<td>${list.year }</td>
																<td>${list.semester}</td>
																<td>${list.courseId}</td>
																<td>${list.name}</td>
																<td>${list.credits}</td>
																<td>${list.grade}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- Footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>	
						</c:if>
	
						<!-- Single Skill -->
						<!-- 
							<div class="single-skill">
								<div class="skill-info">
									<h4>특별과정</h4>
								</div>
								<div class="progress">
									<div class="progress-bar" data-percent="60" data-target="#layerpop2" data-toggle="modal"><span>95%</span></div>
								</div>
							</div>	 -->
						<!--/ End Single Skill -->

						<!--/ 모달구현 -->
						<div class="modal fade" id="layerpop2">
							<div class="modal-dialog">
								<div class="modal-content">
									<!-- header -->
									<div class="modal-header">
										<!-- header title -->
										<h4 class="modal-title">수강과목 목록</h4>
										<!-- body -->
										<div class="modal-body"></div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!--/ End Skill Main -->
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
</body>
</html>