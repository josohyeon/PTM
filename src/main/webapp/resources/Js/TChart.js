
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//상단 뒤로가기
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		});
		
		//운동 페이지로 이동
		$(".memberexercise").click(function()
		{
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			window.location.href = "/Trainer/T-Round?m_qr="+m_qr+"&p_no="+p_no; 
		});
	});
	
	//인바디 데이터 입력하는 창
	function updateinbody()
	{	
		$(".modalchang").css("visibility", "visible");
		$(".modalchang").css("opacity", "1");
		$(".modalnaeyong").toggle();
	}
	//인바디 입력창 닫기
	function CloseModal()
	{	
		$(".modalnaeyong").toggle();
		$(".modalchang").css("visibility", "hidden");
		$(".modalchang").css("opacity", "0");
	}
	
	//트레이너 소견 입력하는 창
	function updatecomment()
	{	
		$(".modalchang2").css("visibility", "visible");
		$(".modalchang2").css("opacity", "1");
		$(".modalnaeyong2").toggle();
	}
	//트레이너 소견 입력창 닫기
	function CloseModal2()
	{
		$(".modalnaeyong2").toggle();
		$(".modalchang2").css("visibility", "hidden");
		$(".modalchang2").css("opacity", "0");
	}
	