package ptm.trainer.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptm.team.service.T_ManagementService;
import ptm.team.vo.PtVO;
import ptm.team.vo.RoundVO;

@Controller
@RequestMapping(value="/Trainer") 
public class T_RoundController 
{	
	@Inject
	T_ManagementService t_managementService;
	
	//PT받고있는 회원의 회차
	@RequestMapping(value = "/T-Round")
	public String selectmemberinfo(Model model, PtVO ptVO, RoundVO vo, HttpServletRequest request) throws Exception
	{	
		HttpSession session = request.getSession();
		
		int T_no = (Integer)session.getAttribute("t_no");
		
		vo.setT_no(T_no);
		
		PtVO ptvo = t_managementService.selectPtm(vo);
		
		List<RoundVO> list = t_managementService.selectRoundcnt(vo);
		
		model.addAttribute("ptvo", ptvo);
		model.addAttribute("list", list);
		
		return "Trainer/T-Round";
	}
	
	//PT받고있는 회원의 회차 추가
	//PT받고있는 회원의 회차 추가 후 가장 마지막 회차 불러올때 
	@RequestMapping(value="/ajaxroundAdd", method = RequestMethod.POST)
	@ResponseBody
	public RoundVO insertRound(RoundVO vo, HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		
		int T_no = (Integer)session.getAttribute("t_no");
		
		vo.setT_no(T_no);
		
		t_managementService.insertRound(vo);
		
		RoundVO roundVO = t_managementService.selectRound(vo.getR_no());
		
		return roundVO; 
	}
}