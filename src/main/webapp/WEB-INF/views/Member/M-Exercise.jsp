<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/MExercise.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Exercise</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/MExercise.js"></script>
<script>
</script>
<style>

</style>
</head>
<body>
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

		<div class="ExerciseArea">
			<div class="subtitle">
				${vo.r_ct}회차-${vo.r_date }
			</div>
			<c:if test="${list.size() == 0 }">
				<h1>운동을 시작해주세요!</h1>
			</c:if>
			<c:forEach items="${list }" var="list">
			<table id="table_${list.e_no }" class="ExerciseList">
				<tr>
					<td colspan="6">
						<b>${list.e_name }</b>
					</td>
				</tr>
				<tr>
					<td colspan="6" height='1' style='background-color:#f2f2f2'></td>
				</tr>
				<tr>
					<td>${list.e_set }</td>
					<td><span>세트</span></td>
					<td>${list.e_cnt }</td>
					<td><span>회</span></td>
					<td>${list.e_kg }</td>
					<td><span>kg</span></td>
				</tr>
				<tr>
					<td>${list.e_time }</td>
					<td><span>분</span></td>
					<td>
						<c:choose>
							<c:when test="${list.e_part eq 'A' }">어깨</c:when>
							<c:when test="${list.e_part eq 'B' }">가슴</c:when>
							<c:when test="${list.e_part eq 'C' }">등</c:when>
							<c:when test="${list.e_part eq 'D' }">코어</c:when>
							<c:when test="${list.e_part eq 'E' }">하체</c:when>
							<c:when test="${list.e_part eq 'F' }">이두</c:when>
							<c:when test="${list.e_part eq 'G' }">삼두</c:when>
						</c:choose>
					</td>
					<td>&nbsp;<!-- 간격을 맞추기 위해 임의로 넣은 것 --></td>
					<td>${list.e_rest }</td>
					<td><span>초</span></td>				
				</tr>
				<tr>
					<td colspan="6" height='1' style='background-color:#f2f2f2'></td>
				</tr>
			</table>
			</c:forEach>
		</div>

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>