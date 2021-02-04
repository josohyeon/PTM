<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TSearch.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Search</title>
<!-- <script src="/resources/Js/jquery-3.5.1.min.js"></script> -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/Js/TSearch.js"></script>
<script>

</script>
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
		
		<div class="searchContainer">
		
			<form id="searchReason" method="get" action="/Trainer/SearchMember">
				<div class="searchBox" style="font-size:1.5em;">
					<select class="form-select" name="searchType">
						<option value="name">이름</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="form-control" id="searchChang" name="keyword">
					<input type="submit" class="btn btn-primary" id="searchButton" value="조회">
					<button type="button" class="btn btn-primary" id="accountMakeButton" onclick="accountmake()">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
							<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</button>
				</div>
			</form>
			
			<div class="searchResult">
				<table class="searchResultTable">
					<thead>
						<tr>
							<th>이름</th>
							<th>전화번호</th>
							<th colspan="2">PT등록현황</th>
						</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
					</thead>
					<tbody>
						 <c:forEach items="${list}" var="item" varStatus="status">
							<tr>
								<td><c:out value="${item.m_name }"/></td>
								<td><c:out value="${item.m_phone }"/></td>
								<td>
								<c:if test="${item.ptState eq null }">
									<input type="button" class="btn btn-primary" id="ptMakeButton" onclick="insertPt('${item.m_qr}','${item.m_name}')" value="&nbsp;&nbsp;PT등록&nbsp;&nbsp;">
								</c:if>
								<c:if test="${item.ptState eq 'A' }">
									<b>PT진행중</b>
								</c:if>
								<c:if test="${item.ptState eq 'C' }">
									<input type="button" class="btn btn-warning" id="ptMakeButton" onclick="updatePt('${item.m_qr }','${item.m_name }',${item.p_no })" value="PT재등록">
								</c:if>
								</td>
								<td>	
									<input type="button" class="btn btn-outline-dark" id="QRremakeButton" value="QR재발급" onclick="reQR('${item.m_qr}','${item.m_email}','${item.m_name}')">
								</td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>	
		<div class="accountMakeContainer">
			<div class="accountMakeBox" >
			<form id="accountMake" name="accountMake" enctype="multipart/form-data" action="/Trainer/QRcreate" method="post">
				<table id="accountMakeTable">
					<!-- 결과를 가운데 정렬하고 싶어서 넣은 tr -->
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><h2>신규 회원 등록</h2></td>
					</tr>
					<tr>
						<td>
							<input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="전화번호">
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="m_email" id="m_email" placeholder="이메일">
						</td>
					</tr>
					<tr>
						<td>
							<img src='/resources/Images/BlankProfile.png'  id='profilimg'>
							<div class="filebox">
								<input class="upload-name" value="파일선택" disabled="disabled">
								<label>사진 첨부<input type='file' name='fileUp' id='fileUp' class="upload-hidden"></label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" class="btn btn-outline-danger" value="취소" onclick="QRclose();">
							<input type="button" class="btn btn-outline-primary" value="QR발급" onclick="qr_code_create()">
						</td>
					</tr>
				</table>
			</form>	
			</div>
		</div>
		
		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>