$(document).ready(function()
	{
		$(".trainermanager").click(function()
		{
			window.location.href = "/Daejang/T-Daejang";  
		});
		
		$(".usermanager").click(function()
		{
			window.location.href = "/Daejang/M-Daejang"; 
		});
		
		$(".toplogout").hover(function()
		{
			var output = '';
			output+= '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">';
			output+= '<path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>';
			output+= '<path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>';
			output+= '</svg>';
			
			$(this).html(output);
		
		}).mouseleave(function()
		{
			var output = '';
			output+= '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-door-closed" viewBox="0 0 16 16">';
			output+= '<path d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z"/>';
			output+= '<path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z"/>';
			output+= '</svg>';
			
			$(this).html(output);
		});
		
		$(".toplogout").click(function()
		{
			var result = confirm("로그아웃 하시겠습니까?"); 
			if(result) 
			{ 	
				alert("로그아웃 되었습니다.")
				location.replace("/Trainer/T-Logout"); 
			}
		});
	});
		
	function trainerOut(link)
	{
		
		var result = confirm("정말로 탈퇴시키겠습니까?");
		if(result)
		{
			alert("정상적으로 탈퇴처리되었습니다.");
			location.href=link;
		}else
		{
			alert("취소되었습니다.");
		}
	}
	