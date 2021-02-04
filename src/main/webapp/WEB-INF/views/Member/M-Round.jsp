<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/MRound.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Exercise Round</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/MRound.js"></script>
<script>

</script>
<style>

</style>
</head>
<body>
	<!-- t_no/p_no/m_qr -->
	<input type="hidden" name="p_no" value="${vo.p_no }">
	<input type="hidden" name="t_no" value="${vo.t_no }">
	<input type="hidden" name="m_qr" value="${vo.m_qr }">
	
	<!-- 전체 컨텐츠를 감싼 div -->
	<div class="allcontents">
		
		<!-- 상단 로고와 네비게이션 버튼 -->
		<div class="topcontents">
			<button class="topback">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
			</button>
			<a href="/Member/M-List?m_qr=${vo.m_qr }" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
		</div>
		
		<div class="memberchart">
			통계
		</div>
		
		<div class="memberexercise">
			운동
		</div>
		
		<div class="Exercises">
			<c:if test="${rvo.size() == 0 }">
				<h1>운동을 시작해주세요!</h1>
			</c:if>
			<c:forEach items="${rvo}" var="list">
				<input type="button" value="${list.r_ct }회차 -${list.r_date }-" class="btn btn-primary" onclick="ExercisedetailView(${list.r_no},${list.t_no },'${list.m_qr }',${list.r_ct },'${list.r_date }')">
			</c:forEach>
		</div>
		
		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>