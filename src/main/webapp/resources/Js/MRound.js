	$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});

		$(".memberchart").click(function()
		{
			var tno = $("input[name=t_no]").val();
			var pno = $("input[name=p_no]").val();
			var mqr = $("input[name=m_qr]").val();
			
			window.location.href = "/Member/M-Chart?t_no="+tno+"&p_no="+pno+"&m_qr="+mqr;
		});
		
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		});
	});
	
	//운동 상세 보기 창으로 이동
	function ExercisedetailView(r_no, t_no, m_qr, r_ct, r_date)
	{
		var no = $("input[name=p_no]").val();
		window.location.href = "/Member/M-Exercise?r_no="+r_no+"&t_no="+t_no+"&m_qr="+m_qr+"&p_no="+no+"&r_ct="+r_ct+"&r_date="+r_date;
	}
	