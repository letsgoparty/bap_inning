package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.LodReviewDTO;
import com.app.dto.MemberDTO;
import com.app.dto.Reply;
import com.app.dto.ResReviewDTO;
import com.app.dto.UpgradePageDTO;

@Repository
public class MypageDAO {
	@Autowired
	SqlSessionTemplate session;

	//회원정보 수정
	public int memberUpdate(MemberDTO memberDTO) {
		int n=session.update("MemberMapper.memberUpdate",memberDTO);
		return n;
	}

	//비밀번호 변경
	public int pwChange(HashMap<String, String> hashmap) {
		int n=session.update("MemberMapper.pwChange",hashmap);
		return n;
	}
	
	//회원 탈퇴
	public int memberDelete(String userid) {
		int n=session.delete("MemberMapper.memberDelete",userid);
		return n;
	}
	
	///////////전체삭제 구현
	//게시글 전체삭제
	public int deleteAll_myText(List<Integer> list) {
		return session.delete("MypageMapper.deleteAll_myText",list);
	}
	//댓글 전체삭제 
	public int deleteAll_myReply(List<Integer> list) {
		return session.delete("MypageMapper.deleteAll_myReply",list);
	}
	

	
	
	
	///////////////////////////////////
	//페이징 처리
	//게시판
	public int totalCount_text(String userid) {
		return session.selectOne("MypageMapper.textTotalCount",userid);
	}
	
	public UpgradePageDTO selectText(String userid,int curPage, int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();				
		
		int total = totalCount_text(userid);
		pageDTO.setEndPage((int) Math.ceil(curPage / 10.0) * 10);
        pageDTO.setStartPage(pageDTO.getEndPage() - 9);
        
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }

        pageDTO.setPrev(pageDTO.getStartPage() > 1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());

		
		List<Board> list=session.selectList("MypageMapper.selectText",userid,new RowBounds(offset,limit));
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotal(total);

		
		
		return pageDTO;
		
	}
	
	
	//식당리뷰
	public int totalCount_r_review(String userid) {
		return session.selectOne("MypageMapper.r_reviewTotalCount",userid);
	}
	
	public UpgradePageDTO select_r_review(String user_id, int curPage,int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();				
		
		int total = totalCount_r_review(user_id);
		pageDTO.setEndPage((int) Math.ceil(curPage / 10.0) * 10);
        pageDTO.setStartPage(pageDTO.getEndPage() - 9);
        
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }

        pageDTO.setPrev(pageDTO.getStartPage() > 1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());
		
		List<ResReviewDTO> list=session.selectList("MypageMapper.select_r_review",user_id,new RowBounds(offset, limit));
		pageDTO.setList(list);
		/* pageDTO.setCurPage(curPage); */
		pageDTO.setTotal(total);
		
		return pageDTO;
		
	}
	
	//댓글 보기
	public int totalCount_reply(String userid) {
		return session.selectOne("MypageMapper.replyTotalCount",userid);
	}
	public UpgradePageDTO selectReply(String userid, int curPage, int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();
		
		int total=totalCount_reply(userid);
		pageDTO.setEndPage((int)Math.ceil(curPage/10.0)*10);
		pageDTO.setStartPage(pageDTO.getEndPage()-9);
		
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }
        
        pageDTO.setPrev(pageDTO.getStartPage()>1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());
        
        List<Reply> list=session.selectList("MypageMapper.selectReply",userid,new RowBounds(offset, limit));
        
        pageDTO.setList(list);
        pageDTO.setCurPage(curPage);
        pageDTO.setTotal(total);
		return pageDTO;
	}
	
	//숙소 보기
	public int totalCount_l_review(String user_id) {
		return session.selectOne("MypageMapper.l_reviewTotalCount",user_id);
	}
	public UpgradePageDTO select_l_review(String user_id,int curPage, int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();
		
		int total=totalCount_l_review(user_id);
		pageDTO.setEndPage((int)Math.ceil(curPage/10.0)*10);
		pageDTO.setStartPage(pageDTO.getEndPage()-9);
		
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }
        
        pageDTO.setPrev(pageDTO.getStartPage()>1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());
        
        List<LodReviewDTO> list=session.selectList("MypageMapper.select_l_review",user_id,new RowBounds(offset, limit));
        pageDTO.setList(list);
        pageDTO.setTotal(total);
        
        
        return pageDTO;
        
	}

	
	
}
