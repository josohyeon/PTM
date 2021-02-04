	$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		$(".profileTab").click(function()
		{
			 location.reload();
		});
		$(".accountTab").click(function()
		{
			 location.href="/Trainer/T-Account";
		});
		$(".topback").click(function()
		{
			window.history.back();
		});
		
		$("#fileUp").change(function(){
			LoadImg(this);
		});
	});
	
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
	
	function LoadImg(value)
	{
		if(value.files && value.files[0])
		{
			var reader = new FileReader();
			reader.onload = function(e)
			{
				$(".profilimg").attr('src',e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	function openDaumZipAddress() {
		 
	    // 우편번호 찾기 화면을 넣을 element를 지정
	    var element_wrap = document.getElementById("wrap");
	 
	    // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
	    if(jQuery("#wrap").css("display") == "none") {
	        new daum.Postcode({
	            oncomplete:function(data)
	            {
	                jQuery("#addr1").val(data.address);
	                jQuery("#addr2").focus();
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