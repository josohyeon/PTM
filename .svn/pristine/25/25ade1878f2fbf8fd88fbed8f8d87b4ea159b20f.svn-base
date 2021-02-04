<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR PAGE</title>
<style>
div
{
	margin:auto;
	text-align: center;
	padding-top:120px;
}
table
{
	margin:auto;
	text-align:center;
}
@media screen and(max-width:787px)
{
	div
	{
		width:100%;
		heigh:100%;
	}
	table center > p
	{
		font-size: 5em;
	}
}
</style>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><img src="/resources/Images/error.png" id="logo" width="700px" height="500px"></td>
			</tr>
			<tr>
				<td>
					<h1>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h1>
					<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
				        <center><h2>400 에러가 발생했습니다.</h2></center>
				    </c:if>
				    <c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
				        <center><h2>403 에러가 발생했습니다.</h2></center>
				    </c:if>
				    <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
				        <center><h2>404 에러가 발생했습니다.</h2></center>
				    </c:if>
				    <c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
				        <center><h2>405 에러가 발생했습니다.</h2></center>
				    </c:if>
				    <c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
				        <center><h2>500 에러가 발생했습니다.</h2></center>
				    </c:if>
				    <c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
				        <center><h2>503 에러가 발생했습니다.</h2></center>
				    </c:if>
					<a href="javascript:window.history.back()"><h1>뒤로가기</h1></a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>