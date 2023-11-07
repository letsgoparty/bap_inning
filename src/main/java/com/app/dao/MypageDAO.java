package com.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.MemberDTO;
import com.app.dto.ReviewDTO;
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
	
	
	///////////////////////////////////
	//페이징 처리
	//게시판
	public int totalCount_text() {
		return session.selectOne("MypageMapper.textTotalCount");
	}
	
	public UpgradePageDTO selectText(int curPage, int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();				
		
		int total = totalCount_text();
		pageDTO.setEndPage((int) Math.ceil(curPage / 10.0) * 10);
        pageDTO.setStartPage(pageDTO.getEndPage() - 9);
        
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }

        pageDTO.setPrev(pageDTO.getStartPage() > 1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());

		
		List<Board> list=session.selectList("MypageMapper.selectText",null,new RowBounds(offset,limit));
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotal(total);

		
		
		return pageDTO;
		
	}
	//식당리뷰
	public int totalCount_r_review() {
		return session.selectOne("ReviewMapper.r_totalCount");
	}
	
	public UpgradePageDTO select_r_review(int curPage,int amount) {
		UpgradePageDTO pageDTO=new UpgradePageDTO();
		pageDTO.setAmount(amount);
		pageDTO.setCurPage(curPage);
		
		int offset=(curPage-1)*pageDTO.getAmount();
		int limit=pageDTO.getAmount();				
		
		int total = totalCount_r_review();
		pageDTO.setEndPage((int) Math.ceil(curPage / 10.0) * 10);
        pageDTO.setStartPage(pageDTO.getEndPage() - 9);
        
        pageDTO.setRealEnd((int) Math.ceil((total * 1.0) / pageDTO.getAmount()));
        if (pageDTO.getRealEnd() < pageDTO.getEndPage()) {
            pageDTO.setEndPage(pageDTO.getRealEnd());
        }

        pageDTO.setPrev(pageDTO.getStartPage() > 1);
        pageDTO.setNext(pageDTO.getEndPage() < pageDTO.getRealEnd());
		
		List<ReviewDTO> list=session.selectList("MypageMapper.select_r_review",null,new RowBounds(offset, limit));
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotal(total);

		
		
		return pageDTO;
		
	}
	
}
