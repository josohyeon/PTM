package ptm.team.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


//VO 전부 import 했으니 쓸것만 쓰시고 안쓰면 지워주세요
import ptm.team.vo.PtVO;
import ptm.team.vo.SearchVO;
import ptm.team.vo.MemberVO;

@Repository
public class T_SearchDAO 
{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "ptm.team.mapper.T_SearchMapper";

	public int InsertMember(MemberVO membervo) 
	{
		return sqlSession.insert(Namespace+".InsertMember", membervo);
	}
	public int SelectQR(String m_qr)
	{
		return sqlSession.selectOne(Namespace+".SelectQR", m_qr);
	}
	public List<MemberVO> SearchMember(SearchVO searchvo)
	{
		return sqlSession.selectList(Namespace+".SearchMember", searchvo);
	}
	public int InsertPT(PtVO ptvo) 
	{
		return sqlSession.insert(Namespace+".InsertPT", ptvo);
	}
	public int UpdatePT(PtVO ptvo) 
	{
		return sqlSession.update(Namespace+".UpdatePT", ptvo);
	}
}
