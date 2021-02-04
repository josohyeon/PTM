package ptm.team.service;

import java.util.List;
import java.util.Map;

import ptm.team.vo.ExerciseVO;
//VO 전부 import 했으니 쓸것만 쓰시고 안쓰면 지워주세요
import ptm.team.vo.ListVO;
import ptm.team.vo.PtVO;
import ptm.team.vo.RoundVO;

public interface T_ManagementService 
{
	public List<PtVO>         selectList(ListVO vo)            throws Exception; //PT등록된 회원 리스트
	public int                updateList(RoundVO vo)           throws Exception; //PT등록된 회원 삭제
	public PtVO               selectPtm(RoundVO vo)		       throws Exception; //PT등록된 회원의 정보
	public Map<String,Object> selectPtm2(ExerciseVO vo)		   throws Exception; //PT 등록된 회원의 운동 정보
	public int 			      updateInbody(PtVO vo)  	       throws Exception; //PT등록된 회원의 인바디 입력
	public int 			      updateComment(PtVO vo) 	       throws Exception; //PT등록된 회원의 트레이너 소견 입력
	public int                insertRound(RoundVO vo)          throws Exception; //PT받고있는 회원의 회차 추가
	public List<RoundVO>      selectRoundcnt(RoundVO vo)       throws Exception; //PT받고있는 회원의 회차 수
	public RoundVO            selectRound(int r_no)            throws Exception; //PT받고있는 회원의 회차 추가 후 가장 마지막 회차 불러올때
	public int			      insertExercise(ExerciseVO vo)    throws Exception; //PT받고있는 회원의 운동 입력
	public int 				  updateExercise(ExerciseVO vo)	   throws Exception; //PT받고있는 회원의 운동 기록 수정
	public List<ExerciseVO>   selectExercisecnt(ExerciseVO vo) throws Exception; //운동 상세 기록 리스트로 불러오기
	public ExerciseVO		  selectExercise(int e_no)		   throws Exception; //운동 상세 기록 후 마지막 운동 기록 가져오기
}
