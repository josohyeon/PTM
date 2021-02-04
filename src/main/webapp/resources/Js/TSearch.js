
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//뒤로가기
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		});
		
		//바뀐 이미지 바로 변경		
		$("#fileUp").change(function()
		{
			LoadImg(this);
		});
	});
	
	//파일 이름 넣어주는 작업
	$(document).ready(function()
	{
		var fileTarget = $('.filebox .upload-hidden');
		
		fileTarget.on('change', function()
		{
			if(window.FileReader)
			{
				var filename = $(this)[0].files[0].name;
			}else
			{
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			
			$(".filebox").find('.upload-name').val(filename);
		});
	});
	
	//PT 등록
	function insertPt(m_qr,m_name){
		var m_qr = m_qr;
		var m_name = m_name;		
		var result = confirm(m_name+"님의 PT등록을 진행하시겠습니까?");
		if(result){
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/InsertPT",
	           data : {"m_qr":m_qr},
	           success : function(){ 
	        	   alert("등록이 완료되었습니다");
	        	   /* 리스트로 이동 */
	        		location.href = "/Trainer/T-List" ;
	           },
	           error:function(){
	               alert("등록 오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("PT등록이 취소되었습니다.");
		}
	}
	
	//PT 재등록
	function updatePt(m_qr, m_name, p_no)
	{
		var p_no   = p_no;
		var m_qr   = m_qr;
		var m_name = m_name;		
		var result = confirm(m_name+"님의 PT등록을 진행하시겠습니까?");
		if(result){
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/UpdatePT",
	           data : {"p_no":p_no,"m_qr":m_qr},
	           success : function(){ 
	        	   alert("등록이 완료되었습니다");
	        	   /* 리스트로 이동 */
	        		location.href = "/Trainer/T-List" ;
	           },
	           error:function(){
	               alert("등록 오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("PT등록이 취소되었습니다.");
		}
	}
	
	//회원등록 모달창 띄우기
	function accountmake()
	{
		$(".accountMakeContainer").css("visibility", "visible");
		$(".accountMakeContainer").css("opacity", "1");
		/* $(".acountMakeBox").toggle(); */
	}	

	//취소 눌렀을때
	function QRclose()
	{
		/* $(".accountMakeBox").toggle(); */
		$(".accountMakeContainer").css("visibility", "hidden");
		$(".accountMakeContainer").css("opacity", "0");
	}
	
	//파일 불러오기
	function LoadImg(value)
	{
		if(value.files && value.files[0])
		{
			var reader = new FileReader();
			reader.onload = function(e)
			{
				$("#profilimg").attr('src',e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	//QR코드 생성
	function qr_code_create(){
	    var formData = new FormData($("#accountMake")[0]);
	    if($("#m_name").val()==""||$("#m_phone").val()==""||$("#m_email").val()=="")
	    {
	    	alert("정보를 전부 기입해 주십시오");
	    	return false;
	    }
	    alert("발급이 시작됩니다. 확인 버튼을 누르시고 발급 완료 메시지가 뜰때까지 기다려주세요");
	    $.ajax({
	           type : "POST",
	           url : "/Trainer/QRcreate",
	           data : formData,
				contentType:false,
				processData:false,
	           success : function(){                     
	                alert("발급이 완료되었습니다");
	        		$(".accountMakeBox").toggle();
	        		$(".accountMakeContainer").css("visibility", "hidden");
	        		$(".accountMakeContainer").css("opacity", "0");
	        		window.location.reload();
	           },
	           error:function(){
	               alert("이메일, 전화번호는 중복될 수 없습니다")
	           }
	       });
	}
	
	//QR코드 재전송
	function reQR(m_qr,m_email,m_name){
		var m_qr = m_qr;
		var m_email= m_email;		
		var m_name= m_name;		
		var result = confirm(m_name+"님에게 QR코드를 전송하시겠습니까?");
		if(result){
			alert("발급이 시작됩니다. 확인 버튼을 누르시고 발급 완료 메시지가 뜰때까지 기다려주세요");
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/reQR",
	           data : {"m_qr":m_qr,"m_email":m_email,"m_name":m_name},
	           success : function(){ 
	        	   alert("전송이완료되었습니다");
	           },
	           error:function(){
	               alert("전송오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("QR재발급이 취소되었습니다.");
		}
	}