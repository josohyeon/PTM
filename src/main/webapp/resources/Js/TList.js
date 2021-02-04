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