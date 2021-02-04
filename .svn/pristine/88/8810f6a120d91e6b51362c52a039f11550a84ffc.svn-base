<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//운동 T-Round.jsp로 이동
		$(".memberlist").click(function()
		{
			var m_qr = $(this).find("input[name=m_qr]").val();
			var p_no = $(this).find("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Chart?m_qr="+m_qr+"&p_no="+p_no;
		}).children().find("li:first, .memberdelete").click(function(e) {
			  return false;
		});;
		
		//List에서 PT등록된 회원 삭제(p_state->'C')해주고 해당 div 지움
		$(".memberdelete").click(function()
		{
			var name = $(this).parent().parent().find("li:last").find("b").text().trim();
			var p_no = $(this).next("input").val();
				c    = confirm(name+"을 삭제하시겠습니까?");
			if( c == true)
			{
				$.ajax
				({
					url:"/Trainer/ajaxlistUpdate",
					type:"post",
					data:"p_no="+p_no,
					success:function(data)
					{
						location.reload();
					}
				});
			}else
			{
				alert("회원삭제가 취소되었습니다");
			} 
		});
		
	});	
</script>
<style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
body
{
	font-family: 'NanumSquare', sans-serif;
	font-size:70%;
	width:100%;
	height:100vh;
	margin:0;
	padding:0;
	overflow: auto;
	background-color: #F2F2F2;
}
::-webkit-scrollbar { display: none; } 
.allcontents
{
	width:40%;
	height:100%;
	margin:auto;
	background-color: white;
	overflow: auto;
}
.topcontents
{
	border-bottom:1px solid #F2F2F2;
	top:0;
	text-align:center;
	width:100%;
	height:5vh;
	display:inline-block;
}
.toplogo
{
	display:inline-block;
	width:95%;
}
.topimg
{
	width:110px;
	height:50px;
	margin:auto;
}
.topgrid
{
	border:0;
	background: none;
	margin:0;
	padding-bottom:0.01rem;
}
.navicontents
{
	border-bottom:1px solid #F2F2F2;
	position:relative;
	font-size: 1.5rem;
	padding-top:1em;
	display: none;
}
a
{
	text-decoration:none;
	color:black;
}
a:hover
{
	color:#288CD2
}
ul
{
	list-style: none;
}
.membercontents
{
	width:100%;
	overflow: auto;
}
.membercontents ul
{
	display:inline-block;
	width: 100%;
	height: 30%;
	margin:auto;
	padding:0;
}
.membercontents ul > li
{
	margin:auto;
}
.memberlist
{
	border:3px solid #F2F2F2;
	border-radius:20px;
	height: 30%;
	width:100%;
}
.memberlist ul
{
	width:100%;
	list-style: none;
	margin:auto;
	padding:0;
}
.memberlist ul > li
{
	width:100%;
	text-align:center;
	padding:0;
	margin-top:0.5em;
	margin-bottom:1em;
}
.memberlist ul > li > b
{
	font-size: 1.5rem;
}
.memberlist > ul > li:first-child
{
	text-align:right;
	margin:0;
	z-index:50;
	width:43em;
}
img
{
	width:130px;
}

.memberdelete
{
	width:15px;
}
.angle-up
{
	position:fixed;
	right:31%;
	bottom:2%;
	color:black;
	font-size: 1rem;
}
.a
{
	width:150px;
	height:160px;
}
@media screen and (max-width:787px)
{
	body
	{
		width:100%;
		background-color: white;
	}
	.allcontents
	{
		width:100%;
		/* padding-top: 3em; */
	}
	.topgrid
	{
		position:absolute;
		right:3%;
		top:2%;
	}
	.membercontents
	{
		width:100%;
	}
	.memberlist > ul > li:first-child
	{
		width:34em;
		height:1em;
	}
	.topcontents
	{
		height:6vh;
	}
	.angle-up{
		right:3%;
		bottom:2;
	}
}
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

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>

	</div>
</body>
</html>