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
			
			window.location.href = "/Trainer/T-Round?m_qr="+m_qr+"&p_no="+p_no;
		});
		
		//차트 페이지로 이동
		$(".memberchart").click(function()
		{
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Chart?m_qr="+m_qr+"&p_no="+p_no;
		});
	});
	
	//운동 입력하는 모달창
	function Exerciseinsert(e_no)
	{	
		//e_no가 null일 경우 insert
		$(".modalchang").css("visibility", "visible");
		$(".modalchang").css("opacity", "1");
		$(".modalnaeyong").show();
		
		//e_no가 not null일 경우 update
		if(e_no != undefined)
		{
			modifyClick = true;
			//넘어온 e_no를 참고해서 수정을 누른 값에 대한 정보 셋팅
			var table = $("#table_"+e_no);
			var Ename = table.find("tr:eq(0)").find("td:eq(0)").text().trim();
			var Eset  = table.find("tr:eq(2)").find("td:eq(0)").text().trim();
			var Ecnt  = table.find("tr:eq(2)").find("td:eq(2)").text().trim();
			var Ekg   = table.find("tr:eq(2)").find("td:eq(4)").text().trim();
			var Etime = table.find("tr:eq(3)").find("td:eq(0)").text().trim();
			var Epart = table.find("tr:eq(3)").find("td:eq(2)").text().trim();
			var Erest = table.find("tr:eq(3)").find("td:eq(4)").text().trim();
			
			//select box 표현
			if(Epart == "어깨")
			{
				Epart = "A";
			}else if(Epart == "가슴")
			{
				Epart = "B";
			}else if(Epart == "등")
			{
				Epart = "C";
			}else if(Epart == "코어")
			{
				Epart = "D";
			}else if(Epart == "하체")
			{
				Epart = "E";
			}else if(Epart == "이두")
			{
				Epart = "F";
			}else if(Epart == "삼두")
			{
				Epart = "G";
			}
			
			$("#e_no").val(e_no);
			$("#e_name").val(Ename);
			$("#e_set").val(Eset);
			$("#e_cnt").val(Ecnt);
			$("#e_kg").val(Ekg);
			$("#e_time").val(Etime);
			$("#e_part").val(Epart);
			$("#e_rest").val(Erest);
		}
		
	}
	//운동 수정하는 모달창 닫는 버튼
	function ExerciseClose()
	{	
		$(".modalnaeyong").hide();
		$(".modalchang").css("visibility", "hidden");
		$(".modalchang").css("opacity", "0");
		location.reload();
	}
	
	//수정할 경우 데이터가 새로 쌓이지 않고 해당 데이터에서 변경되게 하기위한 전역변수
	var modifyClick = false;
	
	function ExerciseInsertOK()
	{
		// 입력 or 수정 시 null 처리
		
		if($("#e_name").val() == "")
		{
			$("#e_name").focus();
			return false;
		}
		if($("#e_set").val() == "")
		{
			$("#e_set").val(0);
		}
		if($("#e_cnt").val() == "")
		{
			$("#e_cnt").val(0);
		}
		if($("#e_kg").val() == "")
		{
			$("#e_kg").val(0);
		}
		if($("#e_time").val() == "")
		{
			$("#e_time").val(0);
		}
		if($("#e_rest").val() == "")
		{
			$("#e_rest").val(0);
		}
		$.ajax
		({
			url:"/Trainer/T-ExerciseAdd",
			type:"post",
			data:$("#Ewrite").serialize(),
			success:function(data)
			{
				if(!modifyClick)
				{
					if(data.e_part == "A")
					{
						data.e_part = "어깨";
					}else if(data.e_part == "B")
					{
						data.e_part = "가슴";
					}else if(data.e_part == "C")
					{
						data.e_part = "등";
					}else if(data.e_part == "D")
					{
						data.e_part = "코어";
					}else if(data.e_part == "E")
					{
						data.e_part = "하체";
					}else if(data.e_part == "F")
					{
						data.e_part = "이두";
					}else if(data.e_part == "G")
					{
						data.e_part = "삼두";
					}
					var output  = " ";
						output += "<table id='table_"+data.e_no+"'>";
						output += "<tr>";
						output += "<td colspan='3'><b>"+data.e_name+"</b></td>";
						output += "<td colspan='3'><button type='button' class='btn btn-default' onclick='Exerciseinsert("+data.e_no+")'>";
						output += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'>";
						output += "<path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/>";
						output += "<path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z'/>";
						output += "</svg></button>";
						output += "</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='6' height='1' style='background-color:#f2f2f2'></td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td>"+data.e_set+"</td>";
						output += "<td><span>세트</span></td>";
						output += "<td>"+data.e_cnt+"</td>";
						output += "<td><span>회</span></td>";
						output += "<td>"+data.e_kg+"</td>";
						output += "<td><span>kg</span></td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td>"+data.e_time+"</td>";
						output += "<td><span>분</span></td>";
						output += "<td>"+data.e_part+"</td>";
						output += "<td>&nbsp;</td>";
						output += "<td>"+data.e_rest+"</td>";	
						output += "<td><span>초</span></td>";				
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='6' height='1' style='background-color:#f2f2f2'></td>";
						output += "</tr>";
						output += "</table>";
					$("#ExerciseArea").prepend(output);
					location.reload();
				}else
				{
					//수정을 누른 table을 찾아서 받아온 data로 변경
					var table = $("#table_"+data.e_no);
						table.find("tr:eq(0)").find("td:eq(0)").html("<b>"+data.e_name+"</b>");
						table.find("tr:eq(2)").find("td:eq(0)").text(data.e_set);
						table.find("tr:eq(2)").find("td:eq(2)").text(data.e_cnt);
						table.find("tr:eq(2)").find("td:eq(4)").text(data.e_kg);
						table.find("tr:eq(3)").find("td:eq(0)").text(data.e_time);
						table.find("tr:eq(3)").find("td:eq(2)").text(data.e_part);
						table.find("tr:eq(3)").find("td:eq(4)").text(data.e_rest);
						
						if(data.e_part == "A")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("어깨");
						}else if(data.e_part == "B")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("가슴");
						}else if(data.e_part == "C")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("등");
						}else if(data.e_part == "D")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("코어");
						}else if(data.e_part == "E")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("하체");
						}else if(data.e_part == "F")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("이두");
						}else if(data.e_part == "G")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("삼두");
						}
						location.reload();
				}
				$(".modalnaeyong").hide();
				$(".modalchang").css("visibility", "hidden");
				$(".modalchang").css("opacity", "0");
			}
		});
		
	}