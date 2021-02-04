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
	
	function juso()
	{
		new daum.Postcode({
			oncomplete: function(data) {
			$("#addr1").val(data.address);
			}
		}).open();
	}