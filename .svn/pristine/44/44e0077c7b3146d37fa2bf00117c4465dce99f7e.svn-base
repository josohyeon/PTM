package ptm.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ptm.team.dao.DaejangDAO;
import ptm.team.vo.MemberVO;
import ptm.team.vo.SearchVO;
import ptm.team.vo.TrainerVO;

@Service
public class DaejangServiceImpl implements DaejangService {
	@Inject
	DaejangDAO daejangDAO;
	
	
	@Override
	public List<TrainerVO> listTrainer(SearchVO searchVO) throws Exception
	{
		return daejangDAO.listTrainer(searchVO);
	}
	
	@Override
	public int countTrainer(SearchVO vo) throws Exception
	{
		return daejangDAO.countTrainer(vo);
	}
	
	@Override
	public int updateTrainer(TrainerVO vo) throws Exception {
	
		return daejangDAO.updateTrainer(vo);
	}

	@Override
	public List<MemberVO> listMember(SearchVO searchVO) throws Exception {
		return daejangDAO.listMember(searchVO);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return daejangDAO.updateMember(vo);
	}
}
