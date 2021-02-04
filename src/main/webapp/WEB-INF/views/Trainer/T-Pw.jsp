<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TPw.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TPw.js"></script>
<script>
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			<a href="/" class="toplogo"><img src=/resources/Images/LOGO.png class="topimg"></a>
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
					<a href="/Trainer/T-Login">로그인</a>
				</li>
				<li>
					<a href="/Trainer/T-Join">회원가입</a>
				</li>
			</ul>
		</div>
		
		<!-- 상단 탭 -->
		<div class="tab">
			<div class="idTab">내 아이디 찾기</div>
			<div class="pwTab">새 비밀번호 발급</div>
		</div>
		
		<!-- 패스워드 찾는 부분 -->
		<div class="pwFind">
			<form id="pw_find" name="pw_find" method="post" action="/Trainer/T-PwOK">
			<table>
				<tr>
					<td><h1>새 비밀번호 발급</h1></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름" id="t_name" name="t_name"  class="form-control" required></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="아이디" id="t_id" name="t_id"  class="form-control" required></td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="이메일 ex)john@ptm.com" id="t_email" name="t_email"  class="form-control" required>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="btn btn-primary" id="pwFindButton" value="발급")">
					</td>
				</tr>
			</table>
			</form>
		</div>
		
	</div>
</body>
</html>