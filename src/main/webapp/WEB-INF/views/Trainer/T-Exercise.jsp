<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TExercise.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PT Member Exercise detail</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TExercise.js"></script>
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
				<c:if test="${roundvo.m_realP ne null }">
				<img class="profilimg" src="/resources/MemberImages/${roundvo.m_realP }">
				</c:if>
				<c:if test="${roundvo.m_realP eq null }">
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
						<td>${roundvo.m_name }</td>
					</tr>
					<tr>
						<th>-전화번호</th>
					</tr>
					<tr>
						<td>${roundvo.m_phone }</td>
					</tr>
					<tr>
						<th>-이메일</th>
					</tr>
					<tr>
						<td>${roundvo.m_email }</td>
					</tr>
				</table>
			</div>
			
			<div class="memberchart">
				통계
			</div>
			
			<div class="memberexercise">
				운동
			</div>
			
			<!-- 운동 상세 기록 부분 -->
			<div class="Exercises">
				<input type="button" value="+" class="btn btn-success" onclick="Exerciseinsert()">
			</div>
			<div id="ExerciseArea">
				<c:if test="${list.size() == 0 }">
					<h1>운동을 시작해주세요!</h1>
				</c:if>
				<c:forEach items="${list }" var="list">
				<table id="table_${list.e_no }">
					<tr>
						<td colspan="3">
							<b>${list.e_name }</b>
						</td>
						<td colspan="3">
							<button type="button" class="btn btn-default" onclick="Exerciseinsert(${list.e_no })">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</button>
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
		
	</div>
	
	<!-- e_no의 유/무에따라 운동 입력/수정하는 div -->
	<div class="modalchang">
		<div class="modalnaeyong">
			<form id="Ewrite" name="Ewrite" method="post" onsubmit="return ExerciseCheck()">
			<input type="hidden" name="p_no" value="${roundvo.p_no }">
			<input type="hidden" name="m_qr" value="${roundvo.m_qr }">
			<input type="hidden" name="r_no" value="${roundvo.r_no }">
			<input type="hidden" id="e_no" name="e_no" value="0"> <!-- 수정시 넘겨 받은 e_no를 받는 부분 -->
			<table>
				<tr>
					<td colspan="3">
						<input type="text" id="e_name" name="e_name" class="form-control" placeholder="운동명" >
					</td>
				</tr>
				<tr>
					<td><input type="number" id="e_set" name="e_set" class="form-control" placeholder="세트" ></td>
					<td><input type="number" id="e_cnt" name="e_cnt" class="form-control" placeholder="횟수" ></td>
					<td><input type="number" id="e_kg"  name="e_kg"  class="form-control" placeholder="무게" ></td>
				</tr>
				<tr>
					<td><input type="number" id="e_time" name="e_time" class="form-control" placeholder="소요시간" ></td>
					<td>
						<select id="e_part" name="e_part" class="form-select" >	
							<option value="A" selected>어깨</option>
							<option value="B">가슴</option>
							<option value="C">등</option>
							<option value="D">코어</option>
							<option value="E">하체</option>
							<option value="F">이두</option>
							<option value="G">삼두</option>
						</select>
					</td>
					<td><input type="number" id="e_rest" name="e_rest" class="form-control" placeholder="세트간 휴식" ></td>					
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><input type="button" value="SAVE" class="btn btn-outline-success" onclick="ExerciseInsertOK()"></td>
					<td>&nbsp;</td>
					<td><input type="button" value="CLOSE" class="btn btn-outline-danger" onclick="ExerciseClose()"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	
</body>
</html>