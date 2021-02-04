<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TRound.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PT Member detail</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TRound.js"></script>
<script>

</script>
<style>

</style>
</head>
<body>
	<!-- m_qr,p_no -->
	<input type="hidden" name="p_no" value="${ptvo.p_no }">
	<input type="hidden" name="m_qr" value="${ptvo.m_qr }">

	<!-- 전체 컨텐츠를 감싼 div -->
	<div class="allcontents">
		
		<!-- 상단 로고와 네비게이션 버튼 -->
		<div class="topcontents">
			<button class="topback">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
			</button>
			<a href="/Trainer/T-List" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
			<button class="topgrid">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
				<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3z"/>
				</svg>
			</button>
		</div>
		
		<!-- 네비게이션 div -->
		<div class="navicontents">
			<ul>
				<li>
					<a href="/Trainer/T-List">회원관리</a>
				</li>
				<li>
					<a href="/Trainer/T-Search">회원 조회 및 등록</a>
				</li>
				<li>
					<a href="/Trainer/T-Profile">마이페이지</a>
				</li>
				<li>
					<a href="/Trainer/T-Logout">로그아웃</a>
				</li>
			</ul>
		</div>
		
		<!-- 회원의 상세 데이터 -->
		<div class="membercontents">
			
			<!-- 이미지/왼쪽 div -->
			<div class="memberprofilimg">
				<c:if test="${ptvo.m_realP ne null }">
				<img class="profilimg" src="/resources/MemberImages/${ptvo.m_realP }">
				</c:if>
				<c:if test="${ptvo.m_realP eq null }">
				<img class="profilimg" src="/resources/Images/BlankProfile.png">
				</c:if>				
			</div>
			
			<!-- 프로필/오른쪽 div -->
			<div class="memberprofil">
				<table>
					<tr>
						<th>-회원성함</th>
					</tr>
					<tr>
						<td>${ptvo.m_name }</td>
					</tr>
					<tr>
						<th>-전화번호</th>
					</tr>
					<tr>
						<td>${ptvo.m_phone }</td>
					</tr>
					<tr>
						<th>-이메일</th>
					</tr>
					<tr>
						<td>${ptvo.m_email }</td>
					</tr>
				</table>
			</div>
			
			<div class="memberchart">
				통계
			</div>
			
			<div class="memberexercise">
				운동
			</div>
			
			<div class="Exercises">
				<input type="button" value="+" class="btn btn-outline-success" onclick="ExerciseAdd()">
				<div id="rCtBtnArea">
				<c:if test="${list.size() == 0 }">
					<h2>회차를 추가해주세요</h2>
				</c:if>
				<c:forEach items="${list }" var="list">
					<input type="button" data-r="${list.r_ct }" value="${list.r_ct }회차 -${list.r_date}-" class="btn btn-outline-primary rCtBtn" onclick="ExercisedetailView(${list.r_no},'${list.m_qr }')">
				</c:forEach>
				</div>
			</div>

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
			
		</div>
		
	</div>
</body>
</html>