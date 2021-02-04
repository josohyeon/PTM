<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/MList.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Main</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/MList.js"></script>
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
			<a href="/Member/M-List?m_qr=${m_qr }" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
		</div>
		
		<!-- 검색창 -->
		<nav class="navbar sticky-top navbar-light bg-light">
			<div class="container-sm">
				<a class="navbar-brand"></a>
				<form class="d-flex" action="/Member/M-List" method="get">
					<input type = "hidden" value="${m_qr}" name="m_qr">
					<input class="form-control me-2" type="search" placeholder="Name" aria-label="Search" id="searchMember" name="searchMember">
					<button class="btn btn-outline-primary" type="submit">Search</button>
				</form>
			</div>
		</nav>
		
		<!-- PT를 받고 있는 트레이너의 목록이 보이는 div -->
		<div class="trainercontents">
			<!-- 트레이너 목록 ul -->
			※이미지를 누르면 해당 트레이너의<br>프로필을 보실 수 있습니다.
			<c:forEach items="${list}" var="item" varStatus="status">
			<ul class="lists">
				<li>
					<div class="trainerlist tinfo">
						<input type="hidden" name="p_no" value="${item.p_no }">
						<input type="hidden" name="t_no" value="${item.t_no }">
						<c:if test="${item.t_realP ne null }">
							<img src="/resources/TrainerImages/${item.t_realP}" class="pictureses" onclick="TrainerDetail(${item.t_no })"><p/>
						</c:if>
						<c:if test="${item.t_realP eq null }">
							<img class="pictureses" src="/resources/Images/BlankProfile.png" onclick="TrainerDetail(${item.t_no })">
						</c:if> 
						<table>
							<tr>
								<th>트레이너</th>
								<td>${item.t_name }</td>
							</tr>
							<tr>
								<th>PT등록일</th>
								<td>${item.p_ok }</td>
							</tr>
							<tr>
								<th>PT회차</th>
								<td>${item.r_ct }회차</td>
							</tr>
						</table>
					</div>
				</li>
			</ul>
			</c:forEach>
		</div>

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
	
	<!-- 트레이너 프로필이 보이는 Modal -->
	<div class="modalchang">
		<div class="modalnaeyong">
			<table class="modaletable">
				<tr>
					<th>근무지</th>	
					<td id="t_addr1"></td>
				</tr>
				<tr><td colspan='2' height='1' style='background-color:#cccccc'></tr>
				<tr>			
					<th>트레이너</th>
					<td id="t_name"></td>
				</tr>
				<tr><td colspan='2' height='1' style='background-color:#cccccc'></tr>
				<tr>			
					<th>경력사항</th>
					<td id="t_etc"></td>
				</tr>
				<tr><td colspan='2' height='1' style='background-color:#cccccc'></tr>
				<tr>
					<th id="t_realP" colspan="2">
					</th>
				</tr>
				<tr><td colspan='2' height='1' style='background-color:#cccccc'></tr>
				<tr>
					<td colspan="2">
						<input type="button" value="확인" onclick="closetrainer()" class="btn btn-primary" id="modalbtn">
					</td>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>