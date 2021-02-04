<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TList.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TList.js"></script>
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
				<c:if test="${sessionScope.t_admin == 'Y'}">
				<li>
				 	<a href="/Daejang/T-Daejang">관리자 화면</a> 
				</li> 
				</c:if>
				<li>
					<a href="javascript:location.reload(true);">회원관리</a>
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
		
		<!-- 검색 창 -->
		<nav class="navbar sticky-top navbar-light bg-light">
			<div class="container-sm">
				<a class="navbar-brand"></a>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Name" aria-label="Search" id="searchMember" name="searchMember">
					<button class="btn btn-outline-primary" type="submit">Search</button>
				</form>
			</div>
		</nav>
		
		<!-- 회원 목록 컨텐츠를 감싼 div -->
		<div class="membercontents">
			
			<c:if test="${list.size() == 0 }">
				<h1>등록된 PT회원이 없습니다.</h1>
			</c:if>
			<c:forEach items="${list}" var="item" varStatus="status">
				<!-- 회원 목록 ul -->
				<ul class="lists">	
					<li>
						<div class="memberlist">
							<ul>
								<li>
									<button class="memberdelete btn btn-default">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
										<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
										</svg>
									</button>
									<input type="hidden" name="p_no" value="${item.p_no }">
									<input type="hidden" name="m_qr" value="${item.m_qr }">
								</li>
								<li>
									<c:if test="${item.m_realP ne null }">
									<img class="a" src="/resources/MemberImages/${item.m_realP }">
									</c:if>
									<c:if test="${item.m_realP eq null }">
									<img class="a" src="/resources/Images/BlankProfile.png">
									</c:if>
								</li>
								<li>
									<b><c:out value="${item.m_name }" />회원</b>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</c:forEach>

		</div>

	</div>

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
</body>
</html>