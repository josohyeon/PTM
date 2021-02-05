package ptm.trainer.controller;


import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class T_JoinController 
{	
	@Inject
	private TrainerService trainerService;
	
	@RequestMapping(value = "/T-Join")//uri
	public String join(){	
	
		return "Trainer/T-Join";//회원가입 화면으로 이동
	}
	
	@RequestMapping(value="/T-JoinOK",method=RequestMethod.POST)
	public String joinOK(TrainerVO trainerVO, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 암호 확인
		// 비밀번호 암호화 (sha512)
		String encryPassword = SHA256.encrypt(trainerVO.getT_pw());
		trainerVO.setT_pw(encryPassword);
		
		trainerService.insertTrainer(trainerVO);
		
		//alert메세지 한글인코딩
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 정상적으로 처리되었습니다.');");
		script.println("location.href='/'");
		script.println("</script>");
		script.close();
		
		return "Trainer/T-Login";
	}
	
	@RequestMapping(value="/T-JoinIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public int joinIdCheck(String t_id) throws Exception {
		
		int a = trainerService.selectIdCheck(t_id);
	
		return a;
	}
	
	@RequestMapping(value="/T-JoinEmailCheck", method=RequestMethod.POST)
	@ResponseBody
	public int joinEmailCheck(String t_email) throws Exception {
		
		int a = trainerService.selectEmailCheck(t_email);
	
		return a;
	}
	
	@RequestMapping(value="/T-JoinPhoneCheck", method=RequestMethod.POST)
	@ResponseBody
	public int joinPhoneCheck(String t_phone) throws Exception {
		
		int a = trainerService.selectPhoneCheck(t_phone);
	
		return a;
	}
}