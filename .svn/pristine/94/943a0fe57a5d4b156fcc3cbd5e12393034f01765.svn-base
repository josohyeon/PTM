
$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		$(".topback").click(function()
		{
			window.history.back();
		});
		
		//doSubmit이 true로 return 될때만 dosubmit()으로 return;
		//submit 되기 전 체크 
		$("#join").submit(function(){
			return doSubmit();
		});
		
	});


function openDaumZipAddress() {
	 
    // 우편번호 찾기 화면을 넣을 element를 지정
    var element_wrap = document.getElementById("wrap");
 
    // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
    if(jQuery("#wrap").css("display") == "none") {
        new daum.Postcode({
            oncomplete:function(data)
            {
                jQuery("#t_addr1").val(data.address);
                jQuery("#t_addr2").focus();
                console.log(data);
            },
 			width:'350',
 			height:'500'
            // 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
            // 다음 주소록 레이어를 완전히 종료 시킨다.
            ,onclose:function(state) {
                if(state === "COMPLETE_CLOSE") {
 
                    // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
                    offDaumZipAddress(function() {
                        element_wrap.style.display = "none";
                    });
                }
            }
        }).embed(element_wrap);
 
        // 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
        jQuery("#wrap").slideDown();
    }
    
    // warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
    else {
 
        // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
        offDaumZipAddress(function() {
            element_wrap.style.display = "none";
            return false;
        });
    }
}
 
function offDaumZipAddress() {
    // 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
    jQuery("#wrap").slideUp();
 
}

 //=======================================================
 
 	var fa = true; 
	var fb = true;
	var fc = true;
	var fd = true;
	var fe = true;
	
	//비밀번호 검사(특수문자)
	function t_pwCheck()
	{
		var pw = $("#t_pw").val();     
		var sc = ["!","@","#","$","%","^","&","+","="];
		var check_sc= 0;
        for(var i=0;i<sc.length;i++)
        {
	         if(pw.indexOf(sc[i]) != -1)
	         {
	          check_sc = 1;
	         }
        }
        
	     if(check_sc == 0 )
	     {
	     	$(".pw_message").html("!,@,#,$,%,^,&,+,= 등의 특수문자가 들어가 있지 않습니다.").css("color","red");css("display","inline");
	     	fa = false;	
	     }else
	     {
	    	 $(".pw_message").html("").css("display","none");
	     	fa= true;
	     }
	 }
	
	//비밀번호확인검사(비밀번호 동일검사)
	function t_pwcCheck()
	{ 	
		if( $("#t_pw").val() != $("#t_pwc").val())
        {
             $(".pwc_message").html("비밀번호가 일치하지않습니다.").css("color","red").css("display","inline");
             fb= false;
        }else
     	{
        	 $(".pwc_message").html("").css("display","none");
             fb= true;
     	}
	}
	
	//아이디 중복확인
	function t_idCheck() 
	{
		
		var t_id = $("#t_id").val();
		//alert(t_id)
		$.ajax({
			type:'post',
			url:'/Trainer/T-JoinIdCheck',
			data:{"t_id":t_id},  
			success:function(result) 
			{	
				if(result == 1 ) 
				{	
					$(".id_message").text("이미 가입된 아이디입니다").css("color","red");
					fc= false;
					
				}else
				{
					$(".id_message").text("");
					fc= true;
				}
			}
		});
	}
	
	//이메일 중복확인
	function t_emailCheck() 
	{
	
		var t_email = $("#t_email").val();
		$.ajax({
			type:'post',
			url:'/Trainer/T-JoinEmailCheck',
			data:{"t_email":t_email}, 
			success:function(result) 
			{
				if(result == 1) 
				{	
					$(".email_message").text("이미 가입된 이메일입니다").css("color","red");
					fd= false;	
				}else
				{
					$(".email_message").text("");
					fd= true;
				}
			}
		});
	}
	
	//전화번호 중복확인
	function t_phoneCheck()
	{
		
		var t_phone = $("#t_phone").val();
		$.ajax({
			type:'post',
			url:'/Trainer/T-JoinPhoneCheck',
			data:{"t_phone":t_phone}, 
			success:function(result) 
			{	
				if(result == 1) 
				{	
					$(".phone_message").text("이미 가입된 번호입니다.").css("color","red");
					fe= false;
					
				}else
				{
					$(".phone_message").text("");
					fe= true;
				}
			}
		});

	}
	
	//조건 모두 만족할 때 회원가입
	function doSubmit()
	{
		if(fa == true && fb==true && fc == true && fd == true && fe == true)
		{
			//document.join.submit();
			return true;
		}							
		else
		{				
			alert('입력이 올바르지 않습니다.');
			return false;
		}
	}
	

	
	