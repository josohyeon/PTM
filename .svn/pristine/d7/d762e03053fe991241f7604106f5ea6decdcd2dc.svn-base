package ptm.member.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptm.team.service.M_ManagementService;
import ptm.team.service.T_ManagementService;
import ptm.team.vo.ExerciseVO;
import ptm.team.vo.RoundVO;

@Controller
@RequestMapping(value="/Member") 
public class M_ExerciseController 
{	
	@Inject
	M_ManagementService m_managementService;
	
	//운동 상세 기록창 
	@RequestMapping(value = "/M-Exercise")
	public String selectmemberinfo(Model model, ExerciseVO exerciseVO, RoundVO vo) throws Exception
	{
		List<ExerciseVO> list = m_managementService.selectMexercise(exerciseVO);
		
		System.out.println(exerciseVO.getR_ct());
		
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		return "Member/M-Exercise";
	}
	
}