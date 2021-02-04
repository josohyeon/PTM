<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/DTrainer.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Management</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/DTrainer.js"></script>
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
			<a href="" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
			<button class="toplogout">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-door-closed" viewBox="0 0 16 16">
				<path d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z"/>
				<path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z"/>
				</svg>
			</button>
		</div>
		
		<div class="trainermanager">
			트레이너
		</div>
		
		<div class="usermanager">
			일반회원
		</div>
		
		<!-- 트레이너 회원 목록 -->
		<div class="Tlist">
			<table>
				<thead>
					<tr>
						<td colspan="8" >
							<form id="trainersearch" name="trainersearch">
								<select id="searchType" class="form-select" name="searchType">
									<option value="t_id">아이디</option>
									<option value="t_name">이름</option>
								</select>
								<input type="search" placeholder="Search" class="form-control" name="keyword">
								<input type="submit" value="검색" class="btn btn-primary">
							</form>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>가입일시</th>
						<th>가입(Y)<br>탈퇴(N)</th>
						<th>회원관리</th>
					</tr>
				</thead>
				<tbody>
				 <c:forEach items="${list}" var="item" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td><c:out value="${item.t_id}"/></td>
						<td><c:out value="${item.t_name}"/></td>
						<td><c:out value="${item.t_phone}"/></td>
						<td><c:out value="${item.t_email}"/></td>
						<td><c:out value="${item.t_joindate}"/></td>
						<td><c:out value="${item.t_state}"/></td>
						<td>
							<input type="button" class="btn btn-danger" id="trainerOutButton" value="회원탈퇴" onclick="trainerOut('/Daejang/T-Out?t_id=${item.t_id}')">
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>