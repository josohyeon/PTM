<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TProfileOK.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
<!-- <script src="/resources/Js/jquery-3.5.1.min.js"></script> -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/Js/TProfileOK.js"></script>
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
		<!-- 수정 버튼 클릭시 쓸  form -->
		<form id="ModifyTrainer" method="post" action="/Trainer/TrainerModifyOK" enctype="multipart/form-data">
		<!-- 프로필 부분 div -->	
			<input type ="hidden" name="t_realP" value="${vo.t_realP}">
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
						<input type="text" id='addr1' name='t_addr1' class='form-control' value='${vo.t_addr1}'>
						<br>
						<input type='text' id='addr2' name='t_addr2' class='form-control' value='${vo.t_addr2}'>
						<button type='button' onclick='javascript:openDaumZipAddress()' class='btn btn-primary'>주소찾기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="wrap">
						</div>
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
						<div class="filebox">
							<input class="upload-name" value="파일선택" disabled="disabled">
							<label>사진 첨부<input type='file' name='fileUp' id='fileUp' class="upload-hidden"></label>
						</div>
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
						<textarea class="form-control" rows='5' cols='30' name="t_etc"></textarea>						
					</c:if>
					<c:if test="${vo.t_etc ne null}">
						<textarea class="form-control" rows='5' cols='30' name="t_etc">${vo.t_etc}</textarea>						
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
						<input type="submit" class="btn btn-primary" id="modifyProfileButton" value="저장">
					</td>
				</tr>
			</table>
		</div>
		</form>
		
	</div>
</body>
</html>