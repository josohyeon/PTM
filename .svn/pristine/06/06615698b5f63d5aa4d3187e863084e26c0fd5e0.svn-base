package ptm.trainer.controller;


import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ptm.team.service.TrainerService;
import ptm.team.util.SHA256;
import ptm.team.vo.TrainerVO;

@Controller
@RequestMapping(value="/Trainer") 
public class T_PwController 
{	
	@Inject
	private TrainerService trainerService;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/T-Pw")//uri
	public String findid() throws Exception
	{
		return "Trainer/T-Pw";
	}
	
	@RequestMapping(value = "/T-PwOK")//uri
	public String TrainerFindPw(TrainerVO trainerVO, HttpServletResponse response) throws Exception{	
		int cnt = trainerService.selectFindPw(trainerVO);
		System.out.println(cnt);
		if(cnt==0) 
		{	
			//alert메세지 한글인코딩
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하신 정보가 일치하지 않습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return "Trainer/T-Pw";
		}else 
		{
			char[] tmp = new char[6];
			for(int i=0; i<tmp.length; i++) 
			{
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0)
				{ 
					// 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else
				{ 
					//1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}

			}
		String change="";
		for (int j = 0; j < tmp.length; j++)
		{
			change += Character.toString(tmp[j]);
		}
		
			System.out.println(change);
			// 암호화된 change
			trainerVO.setT_pw(SHA256.encrypt(change));		
			trainerService.updatePw(trainerVO);
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=UTF-8");			
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('변경된 비밀번호가 메일로 전송됩니다 확인 버튼을 누르시고 전송 완료 메시지가 뜰때까지 기다려주세요');");
			script.println("</script>");
			pwmailSending(trainerVO,change);

			script.println("<script>");
			script.println("alert('비밀번호 변경이 완료되었습니다');");
			script.println("location.href='/'");
			script.println("</script>");
			script.close();
			
			return "Trainer/T-Login"; //새 비밀번호 정상적으로 발급 되면 로그인으로 이동
		}
	}
	 public void pwmailSending(TrainerVO vo,String change)throws Exception
	    {
			String setfrom = "PTM";      // 여기 수정해야 할수도
			String tomail = vo.getT_email(); // 받는 사람 이메일
			String t_name = vo.getT_name();
			//String m_qr = membervo.getM_qr();
			String title = t_name +"님의 새 비밀번호 가 발급되었습니다"; // 제목
			String contents = "임시 비밀번호는"+change+"입니다. 즉시 새 비밀번호로 변경해주세요!!!";
			System.out.println(contents);
			//String content = req.getParameter("content"); // 내용
			try
			{
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

				messageHelper.setFrom(setfrom);   // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail);      // 받는사람 이메일
				messageHelper.setSubject(title);  // 메일제목은 생략이 가능하다
				//messageHelper.setText(content); // 메일 내용  
			    messageHelper.setText(contents);
				//FileSystemResource fsr = new FileSystemResource();
				//FileSystemResource fsr = new FileSystemResource(filename);
			    //messageHelper.addAttachment(filename, fsr);
				mailSender.send(message);
			}catch (Exception e)
			{
				System.out.println(e);
			}
	    }
	@RequestMapping(value = "/Out")
	 public void Out(HttpServletRequest request,HttpServletResponse response) throws Exception
	 {
		HttpSession session = request.getSession();
		int t_no = (Integer)session.getAttribute("t_no");
		trainerService.updateOut(t_no);	
		//alert메세지 한글인코딩
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();
		session.removeAttribute("t_no");
		script.println("<script>"); script.println("alert('회원탈퇴가 완료되었습니다.');location.href='/'");
		script.println("</script>"); 
		script.close();
	 }
}