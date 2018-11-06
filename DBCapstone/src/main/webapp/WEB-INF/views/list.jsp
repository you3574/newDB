<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${R}res/common.js"></script>
<link rel="stylesheet" href="${R}res/common.css">
</head>
<body>
	<div class="container">
		<h1>페이지네이션연습</h1>
		<form:form method="get" modelAttribute="pagination" class="form-inline mb5">
			<form:hidden path="now" value="1" />

			<span>정렬순서:</span>
			<form:select path="orderBy" class="form-control autosubmit"
				itemValue="value" itemLabel="label" items="${ orderBy }" />
			<form:select path="category" class="form-control ml30"
				itemValue="value" itemLabel="label" items="${ category }" />
			<form:input path="searchWord" class="form-control"
				placeholder="검색문자열" />
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i> 검색
			</button>
			<c:if test="${ pagination.category > 0 || pagination.orderBy > 0}">
				<a class="btn btn-default" href="list?now=1"> <i
					class="glyphicon glyphicon-ban-circle"></i> 검색취소
				</a>
			</c:if>
			<span class="ml30">페이지 크기:</span>
			<form:select path="size" class="form-control autosubmit">
				<form:option value="10" />
				<form:option value="15" />
				<form:option value="30" />
			</form:select>

		</form:form>
		<table id="students" class="table table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>학번</th>
					<th>이름</th>
					<th>학과코드</th>
					<th>학과</th>
					<th>학년</th>
					<th>전공이수학점</th>
					<th>교양이수학점</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${ students }">
					<tr data-url="student_details?id=${ student.id }">
						<td>${ student.id }</td>
						<td>${ student.studentId }</td>
						<td>${ student.name }</td>
						<td>${ student.dcode}</td>
						<td>${ student.dname}</td>
						<td>${ student.grade }</td>
						<td>${ student.majorCredit }</td>
						<td>${ student.culturalCredit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<my:pagination pageSize="${ pagination.size }"
			recordCount="${ pagination.recordCount }" />
	</div>
</body>
</html>

