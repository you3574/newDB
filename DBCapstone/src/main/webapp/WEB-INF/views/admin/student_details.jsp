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
									<li><a href="addadmin">관리자 추가</a></li>
									<li><a href="search">학생조회</a></li>
									<li><a href="graduation_require">졸업요건</a></li>
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
			<c:choose>
				<c:when test="${check==false }">

					<p>이수 과목 데이터가 없습니다. 과목을 업로드해주세요</p>

				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12 wow fadeIn">
							<!-- Info Main -->
							<div class="info-main" style="margin-bottom: 30px">
								<div class="section-title left">
									<h2>
										나의 필수 과목 이수내역<br />
									</h2>
									<p style="padding-left: 0%">이수하지 않은 과목은 빨간색으로 보입니다.</p>
									<p style="padding-left: 0%">전공 과정에 따라 필수 과정 중 일부만 이수할 수도
										있습니다.</p>
									<p style="padding-left: 0%">입학 년도를 기준으로 필수 과목이 보여집니다.</p>
								</div>
								<h4>주전공</h4>
								<table class="table">
									<thead>
										<tr>
											<th scope="col">학기</th>
											<th scope="col">전공 필수 과목</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="nameList" items="${NameList }"
											varStatus="status">
											<tr>
												<th scope="row" style="width: 20%">${status.count}학기</th>
												<td><c:forEach var="semester" items="${nameList}">
														<c:choose>
															<c:when test="${semester.check == false }">
																<font color="red">${semester.name}</font>
															</c:when>
															<c:otherwise>
																${semester.name}
															</c:otherwise>
														</c:choose>
														,
													</c:forEach></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<c:if test="${student.course == '타과복수전공' }">
									<h4>복수전공</h4>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">학기</th>
												<th scope="col">전공 필수 과목</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="nameList" items="${DoubleNameList }"
												varStatus="status">
												<tr>
													<th scope="row" style="width: 20%">${status.count}학기</th>
													<td><c:forEach var="semester" items="${nameList}">
															<c:choose>
																<c:when test="${semester.check == false }">
																	<font color="red">${semester.name}</font>
																</c:when>
																<c:otherwise>
																	${semester.name}
																</c:otherwise>
															</c:choose>
															,
														</c:forEach></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>

								<c:if test="${student.course == '타과부전공' }">
									<h4>부전공</h4>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">학기</th>
												<th scope="col">전공 필수 과목</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="nameList" items="${minorNameList }"
												varStatus="status">
												<tr>
													<th scope="row" style="width: 20%">${status.count}학기</th>
													<td><c:forEach var="semester" items="${nameList}">
															<c:choose>
																<c:when test="${semester.check == false }">
																	<font color="red">${semester.name}</font>
																</c:when>
																<c:otherwise>
																	${semester.name}
																</c:otherwise>
															</c:choose>
															,
														</c:forEach></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>

								<c:if test="${ Cultural.RequireList != NULL}">
									<h4>교양</h4>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">교양 필수 과목</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td><c:forEach var="sub"
														items="${Cultural.RequireList }">
														<c:choose>
															<c:when test="${sub.check == false }">
																<font color="red">${sub.name}</font>
															</c:when>
															<c:otherwise>
																${sub.name}
															</c:otherwise>
														</c:choose>
														,
													</c:forEach></td>
											</tr>

										</tbody>
									</table>
								</c:if>

								<c:if test="${ Cultural.AdditionList != NULL}">
									<h4>학과 지정 교양</h4>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">학과 지정 교양 과목</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td><c:forEach var="sub"
														items="${ Cultural.AdditionList }">
														<c:choose>
															<c:when test="${sub.check == false }">
																<font color="red">${sub.name}</font>
															</c:when>
															<c:otherwise>
																${sub.name}
															</c:otherwise>
														</c:choose>
														,
													</c:forEach></td>
											</tr>

										</tbody>
									</table>
								</c:if>

							</div>

							<p>
							<h4>사회봉사</h4>
							<font style="font-weight: bold">필요 이수 횟수 : ${ Cultural.VoluntarySum }
								/ ${ Cultural.Voluntary } </font> <small>(아이콘갯수로 이수횟수를 나타냅니다.)</small>
							</p>

							<c:forEach var="num" begin="1" end="${ Cultural.VoluntarySum }"
								step="1">
								<img class="checkimg" style="width: 30px; margin-top: 20px"
									src="/res/images/success.png">
							</c:forEach>

							<p style="margin-bottom: 30px">
							<h4>채플</h4>
							<font style="font-weight: bold">필요 이수 횟수 : ${ Cultural.ChapelSum }
								/ ${ Cultural.Chapel } </font> (아이콘갯수로 이수횟수를 나타냅니다.)</small>
							</p>

							<c:forEach var="num" begin="1" end="${ Cultural.ChapelSum }"
								step="1">
								<img class="checkimg" style="width: 30px; margin-top: 20px"
									src="/res/images/success.png">
							</c:forEach>

							<!--/ End Info Main -->
						</div>
						<div class="col-md-6 col-sm-12 col-xs-12">
							<!-- Skill Main -->
							<div class="skill-main">
								<div class="section-title left">
									<h2>나의 졸업현황</h2>
								</div>
								<div class="some-info"></div>
								<!-- Single Skill -->
								<div class="single-skill">
									<div class="skill-info">
										<h4>전체</h4>
									</div>
									<div class="progress">
										<div class="progress-bar"
											data-percent="${Map.totalPercentage}"
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
												총 수강 학점 : ${Map.totalSum } / ${Map.total }
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
																	<td>${list.subjectName}</td>
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
										<h4>전공 필수</h4>
									</div>
									<div class="progress">
										<div class="progress-bar"
											data-percent="${Map.majorRequirePercentage}"
											data-target="#majorRequire" data-toggle="modal">
											<span>${Map.majorRequirePercentage}%</span>
										</div>
									</div>
								</div>
								<!--/ End Single Skill -->
								<!--/ 모달구현 -->
								<div class="modal fade" id="majorRequire">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- header title -->
												<h4 class="modal-title">전공 필수 과목 수강 목록</h4>
												총 수강 학점 : ${Map.majorRequqireSum } / ${Map.totalrequireMajor }
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
															<c:forEach var="list" items="${Map.MajorReqquireList }">
																<tr>
																	<td>${list.year }</td>
																	<td>${list.semester}</td>
																	<td>${list.courseId}</td>
																	<td>${list.subjectName}</td>
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
										<h4>전공 전체</h4>
									</div>
									<div class="progress">
										<div class="progress-bar"
											data-percent="${Map.majorPercentage}" data-target="#major"
											data-toggle="modal">
											<span>${Map.majorPercentage}%</span>
										</div>
									</div>
								</div>
								<!--/ End Single Skill -->
								<!--/ 모달구현 -->
								<div class="modal fade" id="major">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- header title -->
												<h4 class="modal-title">전공과목 수강 목록</h4>
												총 수강 학점 : ${Map.majorSum } / ${Map.totalMajor }
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
																	<td>${list.subjectName}</td>
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
											data-target="#cultural" data-toggle="modal">
											<span>${Map.culturalPercentage}%</span>
										</div>
									</div>
								</div>
								<!--/ End Single Skill -->

								<!--/ 모달구현 -->
								<div class="modal fade" id="cultural">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- header title -->
												<h4 class="modal-title">교양과목 수강 목록</h4>
												총 수강 학점 : ${Map.culturalSum } / ${Map.totalCultural }
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
																	<td>${list.subjectName}</td>
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


								<!-- 특별과정-복전이 있을 경우 -->
								<!-- Single Skill -->
								<c:if test="${student.course == '타과복수전공' }">
									<div class="single-skill">
										<div class="skill-info">
											<h4>복수전공 필수</h4>
										</div>
										<div class="progress">
											<div class="progress-bar"
												data-percent="${Map.doubleRequirePercentage}"
												data-target="#doubleMajorRequire" data-toggle="modal">
												<span>${Map.doubleRequirePercentage}%</span>
											</div>
										</div>
									</div>
									<!--/ End Single Skill -->

									<!--/ 모달구현 -->
									<div class="modal fade" id="doubleMajorRequire">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- header -->
												<div class="modal-header">
													<!-- header title -->
													<h4 class="modal-title">복수전공 필수 과목 수강 목록</h4>
													총 수강 학점 : ${Map.doubleRequqireSum } /
													${Map.totalrequireDouble }
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
																<c:forEach var="list" items="${Map.DoubleReqquireList }">
																	<tr>
																		<td>${list.year }</td>
																		<td>${list.semester}</td>
																		<td>${list.courseId}</td>
																		<td>${list.subjectName}</td>
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
									<div class="single-skill">
										<div class="skill-info">
											<h4>복수전공 전체</h4>
										</div>
										<div class="progress">
											<div class="progress-bar"
												data-percent="${Map.doublePercentage}"
												data-target="#doubleMajor" data-toggle="modal">
												<span>${Map.doublePercentage}%</span>
											</div>
										</div>
									</div>
									<!--/ End Single Skill -->

									<!--/ 모달구현 -->
									<div class="modal fade" id="doubleMajor">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- header -->
												<div class="modal-header">
													<!-- header title -->
													<h4 class="modal-title">복수전공 과목 수강 목록</h4>
													총 수강 학점 : ${Map.doubleSum } / ${Map.totalDouble }
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
																		<td>${list.subjectName}</td>
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

								<!-- 특별과정-부전공이 있을 경우 -->
								<!-- Single Skill -->
								<c:if test="${student.course == '타과부전공' }">
									<div class="single-skill">
										<div class="skill-info">
											<h4>부전공 필수</h4>
										</div>
										<div class="progress">
											<div class="progress-bar"
												data-percent="${Map.doubleRequirePercentage}"
												data-target="#minorrequire" data-toggle="modal">
												<span>${Map.doubleRequirePercentage}%</span>
											</div>
										</div>
									</div>
									<!--/ End Single Skill -->

									<!--/ 모달구현 -->
									<c:if test="${totalrequireDouble0 == false }">
										<div class="modal fade" id="minorrequire">
											<div class="modal-dialog">
												<div class="modal-content">
													<!-- header -->
													<div class="modal-header">
														<!-- header title -->
														<h4 class="modal-title">부전공 필수 과목 수강 목록</h4>
														총 수강 학점 : ${Map.doubleRequqireSum } /
														${Map.totalrequireDouble }
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
																	<c:forEach var="list"
																		items="${Map.DoubleReqquireList }">
																		<tr>
																			<td>${list.year }</td>
																			<td>${list.semester}</td>
																			<td>${list.courseId}</td>
																			<td>${list.subjectName}</td>
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

									<div class="single-skill">
										<div class="skill-info">
											<h4>부전공 전체</h4>
										</div>
										<div class="progress">
											<div class="progress-bar"
												data-percent="${Map.doublePercentage}" data-target="#minor"
												data-toggle="modal">
												<span>${Map.doublePercentage}%</span>
											</div>
										</div>
									</div>
									<!--/ End Single Skill -->

									<!--/ 모달구현 -->
									<div class="modal fade" id="minor">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- header -->
												<div class="modal-header">
													<!-- header title -->
													<h4 class="modal-title">부전공 과목 수강 목록</h4>
													총 수강 학점 : ${Map.doubleSum } / ${Map.totalDouble }
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
																		<td>${list.subjectName}</td>
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

							</div>

							<!--/ End Skill Main -->
						</div>
					</div>
				</c:otherwise>
			</c:choose>

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
	<script type="text/javascript" src="/res/js/gmap.js"></script>

	<!-- Modernizr JS -->
	<script type="text/javascript" src="/res/js/modernizr.min.js"></script>

	<!-- Appear JS-->
	<script type="text/javascript" src="/res/js/jquery.appear.js"></script>

	<!-- Animate JS -->
	<script type="text/javascript" src="/res/js/wow.min.js"></script>

	<!-- Onepage Nav JS -->
	<script type="text/javascript" src="/res/js/jquery.nav.js"></script>

	<!-- Yt Player -->
	<script type="text/javascript" src="/res/js/ytplayer.min.js"></script>

	<!-- Popup JS -->
	<script type="text/javascript"
		src="/res/js/jquery.magnific-popup.min.js"></script>

	<!-- Typed JS -->
	<script type="text/javascript" src="/res/js/typed.min.js"></script>

	<!-- Scroll Up JS -->
	<script type="text/javascript" src="/res/js/jquery.scrollUp.min.js"></script>

	<!-- Slick Nav JS -->
	<script type="text/javascript" src="/res/js/jquery.slicknav.min.js"></script>

	<!-- Counterup JS -->
	<script type="text/javascript" src="/res/js/waypoints.min.js"></script>
	<script type="text/javascript" src="/res/js/jquery.counterup.min.js"></script>

	<!-- Owl Carousel JS -->
	<script type="text/javascript" src="/res/js/owl.carousel.min.js"></script>

	<!-- Bootstrap JS -->
	<script type="text/javascript" src="/res/js/bootstrap.min.js"></script>

	<!-- Main JS -->
	<script type="text/javascript" src="/res/js/main.js"></script>
</body>
</html>