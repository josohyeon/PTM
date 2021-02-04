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
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Chart?m_qr="+m_qr+"&p_no="+p_no;
		});
		
		//차트 페이지로 이동
		$(".memberchart").click(function()
		{
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Chart?m_qr="+m_qr+"&p_no="+p_no;
		});
		
		
	});
	
	//PT회차 추가 ajax
	function ExerciseAdd()
	{
		var rCtBtn = $(".rCtBtn:eq(0)"); // 첫번째 인덱스의 rCtBtn 찾아옴
		var r_ct_s = rCtBtn.data("r");   // 문자열
		if(r_ct_s == undefined)
		{
			r_ct_s = 0;
		}
		var r_ct_n = (Number(r_ct_s)+1); // 숫자   /r_ct + 1 계산 작업
		var qr = $("input[name=m_qr]").val();
		var no = $("input[name=p_no]").val();
		$.ajax
		({
			url:"/Trainer/ajaxroundAdd",
			type:"post",
			data:"m_qr=" + qr + "&p_no=" + no + "&r_ct=" + r_ct_n,
			success:function(data)
			{
				var output  = "";
					output += "<input type='button' data-r='"+data.r_ct+"' class='btn btn-outline-primary rCtBtn' value='"+data.r_ct+"회차 -"+data.r_date+"-' onclick=ExercisedetailView("+data.r_no+",'"+data.m_qr+"')>";

				$("#rCtBtnArea").prepend(output);
				location.reload();
			}
		});
	}
	
	//운동 상세 보기 창으로 이동
	function ExercisedetailView(r_no, m_qr)
	{
		var no = $("input[name=p_no]").val();
		window.location.href = "/Trainer/T-Exercise?r_no="+r_no+"&m_qr="+m_qr+"&p_no="+no;
	}