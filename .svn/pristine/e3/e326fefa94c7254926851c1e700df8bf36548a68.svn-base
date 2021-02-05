package ptm.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ptm.team.service.M_ManagementService;
import ptm.team.vo.M_ListVO;
import ptm.team.vo.M_PtVO;
import ptm.team.vo.TrainerVO;



@Controller
@RequestMapping(value="/Member") 
public class M_ListController 
{	
	@Inject
	M_ManagementService m_managementService;
	
	//PT등록된 트레이너 리스트
	@RequestMapping(value = "/M-List")
	public String list(M_ListVO vo, Model model,String m_qr) throws Exception {	
		//System.out.println(m_qr);
		//vo.setM_qr(m_qr);
		List<M_PtVO> list = m_managementService.selectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("m_qr",m_qr);
		return "Member/M-List";
	}
	
	//PT등록된 트레이너 상세보기
		@RequestMapping(value = "/M-ListDetail")
		@ResponseBody
		public TrainerVO listDetail(String t_no) throws Exception
		{
			TrainerVO trainerVO = m_managementService.selectDetail(t_no);
			//System.out.println("etc::"+ trainerVO.getT_etc());
			return trainerVO;
		}
}