	$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		$(".topback").click(function()
		{
			location.href = "/";
		});	
		
		$(".idTab").click(function()
		{
			 location.reload();
		});
		
		$(".pwTab").click(function()
		{
			 location.href="/Trainer/T-Pw";
		});
	});
	
	// 아이디 값 받고 출력하는 ajax
	function findId(){
		
		$.ajax({
			url:"/Trainer/T-IdOK",
			type:"POST",
			data: "t_email=" + $("#t_email").val(),
			success:function(result){
				//alert("result::"+typeof result);
				if(result == ""){
					$(".idResultContainer").css("visibility", "visible");
					$(".idResultContainer").css("opacity", "1");
					$('#idResultHere').text("회원 정보를 확인해주세요!");	
				} else  {
					$(".idResultContainer").css("visibility", "visible");
					$(".idResultContainer").css("opacity", "1");
				
					var fir = result.slice(0,4);	//결과값 앞에 4자리 잘라서 fir에 담기
					
					var sec = result.slice(4,Number.MAX_VALUE);//결과값 앞에 4자리 자르고 남은 부분 sec에 담기
					var secS = "";
					for(var i=0; i<sec.length; i++){//sec의 길이만큼 for문 돌려서 *로 채워서 secS에 담기
						secS += "*";
					}
					$('#idResultHere').text(fir+secS); //fir와 secS더한값 출력
				}
			}
		});
	}

	function idResultOK()
	{
		//alert("QR코드가 등록하신 이메일 주소로 발송되었습니다.");
		//$(".accountMakeBox").toggle();
		$(".idResultContainer").css("visibility", "hidden");
		$(".idResultContainer").css("opacity", "0");
	}