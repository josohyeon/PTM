package ptm.daejang.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptm.team.service.DaejangService;
import ptm.team.vo.SearchVO;
import ptm.team.vo.TrainerVO;

@Controller
@RequestMapping(value="/Daejang") 
public class T_DaejangController {
	
	@Inject
	private DaejangService daejangService;
	
	@RequestMapping(value = "/T-Daejang")
	public String T_list(Model model, SearchVO searchVO) throws Exception
	{	
	
		
		int total = daejangService.countTrainer(searchVO);
		
		List<TrainerVO> list = daejangService.listTrainer(searchVO);
		
		System.out.println("list::"+ list.size());
		model.addAttribute("list", list);
		
		return "Daejang/T-Daejang";
	
	}
	
  @RequestMapping(value = "/T-Out") 
  public String T_Out(Model model, TrainerVO trainerVO) throws Exception
  { 	
		 daejangService.updateTrainer(trainerVO);
  
	  return "redirect:T-Daejang"; //결과값이 반영된 화면이동
  }
	 

}
