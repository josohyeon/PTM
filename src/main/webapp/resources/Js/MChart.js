
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//운동 페이지로 이동
		$(".memberexercise").click(function()
		{
			var tno = $("input[name=t_no]").val();
			var pno = $("input[name=p_no]").val();
			var mqr = $("input[name=m_qr]").val();
			
			window.location.href = "/Member/M-Round?t_no="+tno+"&p_no="+pno+"&m_qr="+mqr;
		});
		
		//상단 뒤로가기
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		})
	});