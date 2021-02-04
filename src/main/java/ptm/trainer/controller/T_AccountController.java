package ptm.trainer.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptm.team.service.TrainerService;
import ptm.team.util.SHA256;
import ptm.team.vo.TrainerVO;

@Controller
@RequestMapping(value="/Trainer") 
public class T_AccountController 
{	
	@Inject
	private TrainerService trainerService; 
	
	@RequestMapping(value = "/T-Account")//uri
	public String info( Model model, HttpServletRequest request) throws Exception
	{	
	
		HttpSession session = request.getSession();
		
		int t_no = (Integer)session.getAttribute("t_no");
			
		TrainerVO vo =  trainerService.selectTainerInfo(t_no);	
		//vo.setT_realP(UPLOAD_PATH+"\\"+vo.getT_realP());
		model.addAttribute("vo", vo);
		//model.addAttribute("list", list);				
		return "Trainer/T-Account";
	}
	
	@RequestMapping(value = "/ModifyOK",method=RequestMethod.POST)
	@ResponseBody
	public void ModifyOK(TrainerVO vo,HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		int t_no = (Integer)session.getAttribute("t_no");
		vo.setT_no(t_no);
		trainerService.updateAccount(vo);	
	}
	@RequestMapping(value = "/PwChange",method=RequestMethod.POST)
	public String PwChange(TrainerVO vo,HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		int t_no = (Integer)session.getAttribute("t_no");
		vo.setT_no(t_no);
		vo.setT_no(t_no);
		vo.setT_pw(SHA256.encrypt(vo.getT_pw()));	
		trainerService.updatePW(vo);
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경이 완료되었습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		 return "Trainer/T-Account";
	}
	
}