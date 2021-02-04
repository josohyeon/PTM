<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="/resources/CSS/TChart.css" rel="stylesheet" type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PT Member detail</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script src="/resources/Js/TChart.js"></script>
<script>
</script>
<script src="//www.google.com/jsapi"></script>
<script>
	//인바디
	//첫번째 차트(체중)
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic1);
	function drawBasic1()
	{
		//체중
		var kg = $("input[name=kg]").val();
		
		if(kg == 0)
		{
			document.getElementById('charts1').innerHTML = '<b>체중을 입력해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(kg)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 205
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts1'));
			chart.draw(data, options);
		}
	}
	
	//두번째 차트(근골격량)
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic2);
	function drawBasic2()
	{
		//근골격량
		var bone = $("input[name=bone]").val();

		if(bone == 0)
		{
			document.getElementById('charts2').innerHTML = '<b>근골격량을 입력해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(bone)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 170
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts2'));
			chart.draw(data, options);
		}
	}
	
	//세번째 차트(체지방량)
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic3);
	function drawBasic3()
	{
		//체지방량
		var fat = $("input[name=fat]").val();
		
		if(fat == 0)
		{
			document.getElementById('charts3').innerHTML = '<b>체지방량을 입력해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(fat)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 520
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts3'));
			chart.draw(data, options);
		}
	}
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	//운동 차트
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() 
	{	
		var P1 = $("input[name=Apart]").val();
		var P2 = $("input[name=Bpart]").val();
		var P3 = $("input[name=Cpart]").val();
		var P4 = $("input[name=Dpart]").val();
		var P5 = $("input[name=Epart]").val();
		var P6 = $("input[name=Fpart]").val();
		var P7 = $("input[name=Gpart]").val();
		if(P1 == 0 && P2 == 0 && P3 == 0 && P4 == 0 && P5 == 0 && P6 == 0 && P7 == 0)
  		{
  			document.getElementById('piechart').innerHTML = '<b>운동을 기입하시면 자극부위별 빈도 차트가 보입니다.</b>';
  			
  		}else
  		{
			var data = google.visualization.arrayToDataTable
			([
				['Task', 'Count Ex'],
				['어깨', Number(P1)],
				['가슴', Number(P2)],
				['등',  Number(P3)],
				['코어', Number(P4)],
				['하체', Number(P5)],
				['이두', Number(P6)],
				['삼두', Number(P7)]
			]);

			var options = {
				chartArea: {width: '100%', height:'300'}
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart'));

			chart.draw(data, options);
		    
			}
  		}

	$(window).resize(function()
	{ 
		if(this.resizeTO) clearTimeout(this.resizeTO);
		this.resizeTO = setTimeout(function()
			{ $(this).trigger('resizeEnd'); 
			}, 00)
	}); // redraw graph when window resize is completed

	$(window).on('resizeEnd', function() 
	{
		drawVisualization(); 
	});

</script>
<style>

</style>
</head>
<body>
	<!-- 인바디 값들 체중(kg)/근골격량(bone)/체지방량(fat) -->
	<input type="hidden" name="kg"   value="${ptVO.p_kg}">
	<input type="hidden" name="bone" value="${ptVO.p_bone}">
	<input type="hidden" name="fat"  value="${ptVO.p_fat}">
	
	<!-- 운동 자극 부위 -->
	<input type="hidden" name="Apart" value="${evo.A }">
	<input type="hidden" name="Bpart" value="${evo.B }">
	<input type="hidden" name="Cpart" value="${evo.C }">
	<input type="hidden" name="Dpart" value="${evo.D }">
	<input type="hidden" name="Epart" value="${evo.E }">
	<input type="hidden" name="Fpart" value="${evo.F }">
	<input type="hidden" name="Gpart" value="${evo.G }">
	
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
				<c:if test="${ptVO.m_realP ne null }">
				<img class="profilimg" src="/resources/MemberImages/${ptVO.m_realP }">
				</c:if>
				<c:if test="${ptVO.m_realP eq null }">
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
						<td>${ptVO.m_name }</td>
					</tr>
					<tr>
						<th>-전화번호</th>
					</tr>
					<tr>
						<td>${ptVO.m_phone }</td>
					</tr>
					<tr>
						<th>-이메일</th>
					</tr>
					<tr>
						<td>${ptVO.m_email }</td>
					</tr>
				</table>
			</div>
			
			<div class="memberchart">
				통계
			</div>
			
			<div class="memberexercise">
				운동
			</div>
			
			<!-- 인바디 차트 -->
			<div class="Charts">
				<table>
					<tr>
						<td>
							<b>${ptVO.m_name }</b>회원의 인바디 차트
						</td>
						<td>
							<button type="button" class="btn btn-default" onclick="updateinbody()">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" height='1' style='background-color:#f2f2f2'></td>
					</tr>
					<tr>
						<td>체중</td>
						<td>[표준] 85-115</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="charts1">
								
							</div>
						</td>
					</tr>
					<tr>
						<td>근골격량</td>
						<td>[표준] 90-110</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="charts2">
								
							</div>
						</td>
					</tr>
					<tr>
						<td>체지방량</td>
						<td>[표준] 80-160</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="charts3">
								
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" height='1' style='background-color:#f2f2f2'></td>
					</tr>
				</table>
			</div>
				
			<!-- 운동 기록 차트 -->
			<div class="ExerciseChart">
				<table>
					<tr>
						<td>
							<b>${ptVO.m_name }</b>님의 운동표
						</td>
						<td>
							<button type="submit" class="btn btn-default" onclick="updatecomment()">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" height='1' style='background-color:#f2f2f2'></td>
					</tr>
					<tr>
						<td colspan="2" class="tdlist">
							 <div id="piechart"></div>
						</td>									
					</tr>
					<tr>
						<td colspan="2" height='1' style='background-color:#f2f2f2'></td>
					</tr>
					<tr>
						<td>트레이너 소견 : </td>
						<td> ${ptVO.p_comment }</td>								
					</tr>
					<tr>
						<td colspan="2" height='1' style='background-color:#f2f2f2'></td>
					</tr>
				</table>
			</div>
	
		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
			
		</div>

		
	</div>
	
	<!-- 인바디 입력창 -->	
	<div class="modalchang">
		<div class="modalnaeyong">
			<form id="inbody" name="inbody" action="/Trainer/T-Inbody" method="post">
			<input type="hidden" name="p_no" value="${ptVO.p_no }">
			<input type="hidden" name="m_qr" value="${ptVO.m_qr }">
			<table>
				<tr>
					<td colspan="2"><b>${ptVO.m_name }</b>님의 인바디</td>
				</tr>
				<tr>
					<td colspan="2"><input type="number" placeholder="체중 (kg)"    id="p_kg"  name="p_kg" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="number" placeholder="골격근량 (kg)" id="p_bone" name="p_bone" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="number" placeholder="체지방량 (kg)" id="p_fat"  name="p_fat"  class="form-control"></td>
				</tr>
				<tr>
					<td><input type="submit" value="SAVE"   class="btn btn-outline-success"></td>
					<td><input type="button" value="CLOSE" class="btn btn-outline-danger" onclick="CloseModal()"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>

	<!-- 트레이너 소견 입력창 p_comment -->
	<div class="modalchang2">
		<div class="modalnaeyong2">
			<form id="comment" name="comment" action="/Trainer/T-Comment" method="post">
			<input type="hidden" name="p_no" value="${ptVO.p_no }">
			<input type="hidden" name="m_qr" value="${ptVO.m_qr }">
				<table>
					<tr>
						<td colspan="2"><b>${ptVO.m_name }</b>님의<br>운동 comment</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" class="form-control" id="p_comment" name="p_comment"></td>
					</tr>
					<tr>
						<td><input type="submit" value="SAVE" class="btn btn-outline-success"></td>
						<td><input type="button" value="CLOSE" class="btn btn-outline-danger" onclick="CloseModal2()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>