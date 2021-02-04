<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TProfile.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TProfile.js"></script>
<script>

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

</style>
</head>
<body>
	<!-- t_no -->
	<input type="hidden" value="${sessionScope.t_no }">
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
		
		<!-- 상단 탭 -->
		<div class="tab">
			<div class="profileTab">프로필 관리</div>
			<div class="accountTab">계정 관리</div>
		</div>
		<!-- 프로필 부분 div -->
		<div class="trainerProfile">
			<table class="trainerProfileTable">
				<tr>
					<th>이름</th>
					<td>${vo.t_name}</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<th>근무지</th>
					<td id="addr">
						${vo.t_addr1}<br>${vo.t_addr2}
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<td class="imghover" colspan="2">
						<c:if test="${vo.t_realP eq null or vo.t_realP eq ''}">
							<img src="/resources/Images/BlankProfile.png" class="profilimg">
						</c:if>
						<c:if test="${vo.t_realP ne null and vo.t_realP ne ''}">
							<img src="/resources/TrainerImages/${vo.t_realP}" class="profilimg">
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td id="description">				
						<c:if test="${vo.t_etc eq null}">
							자기소개 글을 적어주세요
						</c:if>
						<c:if test="${vo.t_realP ne null}">
							${vo.t_etc}
						</c:if>		
					</td>
				</tr>
				<tr>
					<td>
						<hr style="height:0.05em; color:white"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" class="btn btn-primary" id="modifyProfileButton" value="수정" onclick="location.href='/Trainer/TrainerModify'">
					</td>
				</tr>
			</table>
		</div>	
	</div>
</body>
</html>