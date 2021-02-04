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
import ptm.team.vo.MemberVO;

@Controller
@RequestMapping(value="/Daejang") 
public class M_DaejangController {
	
	@Inject
	private DaejangService daejangService;
	
	@RequestMapping(value = "/M-Daejang")
	public String M_list(Model model, SearchVO searchVO) throws Exception
	{	
	
		
		int total = daejangService.countTrainer(searchVO);
		
		List<MemberVO> list = daejangService.listMember(searchVO);
		
		System.out.println("list::"+ list.size());
		model.addAttribute("list", list);
		
		return "Daejang/M-Daejang";
	
	}
	
  @RequestMapping(value = "/M-Out") 
  public String M_Out(Model model, MemberVO memberVO) throws Exception
  { 	
		 daejangService.updateMember(memberVO);
  
	  return "redirect:M-Daejang"; //결과값이 반영된 화면이동
  }
	 

}