package ptm.team.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ptm.team.vo.ExerciseVO;

//VO 전부 import 했으니 쓸것만 쓰시고 안쓰면 지워주세요

import ptm.team.vo.M_ListVO;
import ptm.team.vo.M_PtVO;
import ptm.team.vo.RoundVO;
import ptm.team.vo.TrainerVO;

@Repository
public class M_ManagementDAO 
{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "ptm.team.mapper.M_ManagementMapper";
	
	//PT등록된 트레이너 리스트
	public List<M_PtVO> selectList(M_ListVO vo) 
	{
		return sqlSession.selectList(Namespace+".selectList",vo);
	}
	
	//PT등록된 트레이너 상세정보
	public TrainerVO selectDetail(String t_no) throws Exception
	{
		return sqlSession.selectOne(Namespace+".selectDetail",t_no);
	}
	
	//PT등록된 회원의 정보
	public M_PtVO selectPtm(M_PtVO vo) 
	{
		return sqlSession.selectOne(Namespace+".selectPtm", vo);
	}
	
	//PT등록된 회원의 운동 정보
	public Map<String, Object> selectPtm2(ExerciseVO vo)
	{
		return sqlSession.selectOne(Namespace+".selectPtm2", vo);
	}
	
	//PT 등록된 운동 회차
	public List<RoundVO> selectMround(RoundVO vo)
	{
		return sqlSession.selectList(Namespace+".selectMround", vo);
	}
	
	//PT 등록된 운동
	public List<ExerciseVO> selectMexercise(ExerciseVO vo)
	{
		return sqlSession.selectList(Namespace+".selectMexercise", vo);
	}
}
