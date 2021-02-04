$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		$(".tinfo").click(function()
		{
			var tno = $(this).find("input[name=t_no]").val();
			var pno = $(this).find("input[name=p_no]").val();
			var mqr = $(".d-flex").find("input[name=m_qr]").val();
			
			window.location.href = "/Member/M-Chart?t_no="+tno+"&p_no="+pno+"&m_qr="+mqr;
		}).find(".pictureses").click(function(e)
		{
			  return false;
		});;

	});
	//트레이너 상세 모달창 정보 불러오기
	function TrainerDetail(t_no)
	{	
		$.ajax({	    	
	          type : "POST",
	          url : "/Member/M-ListDetail",
	          data : {"t_no":t_no},
	          success : function(data)
	          { 
	        	$("#t_addr1").html(data.t_addr1+"<br>"+data.t_addr2);
	        	$("#t_name").html(data.t_name);
	        	$("#t_etc").html(data.t_etc);
	        	$("#t_realP").html(data.t_realP);
	        	if(data.t_realP == null)
	        	{
	        		$("#t_realP").html("<img class='pictureses' src='/resources/Images/BlankProfile.png' onclick='TrainerDetail("+ data.t_no + ")'>");
	        	}else
	        	{
	        		$("#t_realP").html("<img src='/resources/TrainerImages/"+ data.t_realP +"' class='pictureses' onclick='TrainerDetail("+ data.t_no + ")'>");
	        	}
	        	$(".modalchang").css("visibility", "visible");
		      	$(".modalchang").css("opacity", "1");
		      	$(".modalnaeyong").show();
	          }
	      });
	}
	
	//모달창 닫기
	function closetrainer()
	{
		$('.modalnaeyong').hide();
		$(".modalchang").css("visibility", "hidden");
		$(".modalchang").css("opacity", "0");
	}
	