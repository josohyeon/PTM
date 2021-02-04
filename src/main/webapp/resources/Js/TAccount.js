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
		
		$(".profileTab").click(function()
		{
			location.href="/Trainer/T-Profile";
		});
		$(".accountTab").click(function()
		{
			 location.reload();
		});
		
/* 		$('#selfOut').click(function() 
		{ 
			var result = confirm("정말로 탈퇴하시겠습니까?"); 
			if(result) 
			{ 	
				alert("이용해주셔서 감사합니다.")
				location.href="/Trainer/T-Login";
			} else { 
				alert("취소되었습니다.")
			} 
		}); */
		
	});
	
/* 	function modifyAccount()
	{
		$("#phone").html("<input type='text' class='form-control' >");
		$("#email").html("<input type='text' class='form-control' placeholder='ex)john@ptm.com'>");
		$("#modifyAccountButton").attr("value","저장").attr("id","saveAccountButton").attr("onclick","saveAccount()");
	}
	 */
/* 	function saveAccount()
	{
		$("#phone").html("010-1234-5679");
		$("#email").html("Hong123@naver.com");
		$("#saveAccountButton").attr("value","수정").attr("id","modifyAccountButton").attr("onclick","modifyAccount()");
	}
	  */
	 
	 
	function modifyAccount(t_phone,t_email)
	{
		var t_phone = t_phone;
		var t_email = t_email;
		$("#phone").html("<input type='tel' class='form-control' name='t_phone' value='"+t_phone+"'>");
		$("#email").html("<input type='email' class='form-control' name='t_email' value='"+t_email+"'>");
		$("#modifyAccountButton").attr("value","저장").attr("id","saveAccountButton").attr("onclick","saveAccount()");
	}
	function saveAccount()
	{
		
	 	var t_phone = $("input[name=t_phone]").val();
		var t_email = $("input[name=t_email]").val();

		if(t_phone=="")
		{
			alert('휴대폰 번호를 입력해 주세요');
		}
		if(t_email=="")
		{
			alert('이메일을 입력해 주세요');
		}
		else{
 		$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/ModifyOK",
	           data : {"t_phone":t_phone,"t_email":t_email},
	           success : function(){ 
	        	   alert("변경이 완료되었습니다");
	        	   location.reload();
	           },
	           error:function(){
	               alert("변경오류 형식을 확인해주세요");
	           }
	      	 }); 
		}
	}
	var fa = false; 
	var fb = false; 
	function t_pwCheck()
	{
		var pw = $("#pw").val();     
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
	     	$(".pw_message").html("!,@,#,$,%,^,&,+,= 등의 특수문자가 들어가 있지 않습니다.").css("color","red");
	     	$(".pw_message").css("display","inline");
	     	fa= false;
	     }else
	     {
	    	 $(".pw_message").html("").css("display","none");
	     	fa= true;
	     }
	     if(pw.length < 8 || pw.length > 16)
	     {
	      	fb = false;
	     }
	     else
	     {
	       	 fb = true;
	     }
	 }
	function PwChange()
	{
		if(fa==false)
		{
			alert("특수문자를 1개이상 넣어주세요");
			document.getElementById('pw').focus();
			return false
		}
		if(fb==false)
		{
			alert("비밀번호 길이는 8자리 이상 16자리 이하로 설정해주세요");
			document.getElementById('pw').focus();
			return false
		}
	}
	function Out()
	{
		if(confirm("회원을 탈퇴하시겠습니까?")==true)
		{
			location.href="/Trainer/Out";
		}
		else
		{
			return;
		}
	}
	