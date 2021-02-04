
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
			 location.href="/Trainer/T-Id";
		});
		
		$(".pwTab").click(function()
		{
			 location.reload();
		});
	});