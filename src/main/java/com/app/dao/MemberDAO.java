package com.app.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate session;

	
		//id 중복체크
		public MemberDTO idCheck(String userid) {
			MemberDTO dto = session.selectOne("MemberMapper.idCheck", userid);
			return dto;
		}
		
		//닉네임 중복체크
		public MemberDTO nicknameCheck(String nickname) {
		    MemberDTO dto = session.selectOne("MemberMapper.nicknameCheck", nickname);
			return dto;
		}
		
		// 회원가입
		public int memberAdd(MemberDTO dbdto) {
			int n = session.insert("MemberMapper.memberAdd", dbdto);
			return n;
		}
		//로그인
		public MemberDTO login( HashMap<String, String> map) {
			MemberDTO dbdto = session.selectOne("MemberMapper.login", map);
			return dbdto;
		}
		
		
		
		
		//mypage
		public MemberDTO getMypage( String userid) {
			MemberDTO dbdto = session.selectOne("MemberMapper.mypage", userid);
			return dbdto;
		}
		
		
		//public int updateTemporaryPW(HashMap<String, String> map) {
		//	return session.update("MemberMapper.updateTemporaryPW", map);
		//}
		
		public String findEncodePW(HashMap<String, String> map) {
			return session.selectOne("MemberMapper.findEncodePW", map);
		}
	
		
	    
		// 인증코드 저장
		public int saveVerificode(MemberDTO code) {
			int n = session.insert("MemberMapper.saveVerificode", code);
			return n;
		}
		
		// 인증코드 조회
		public MemberDTO authcodeconfirm(MemberDTO dto) {
			MemberDTO edto = session.selectOne("MemberMapper.authcodeconfirm", dto);
			
			 if (edto != null) {
			        System.out.println("DTO 조회 결과: " + edto.toString());
			    } else {
			        System.out.println("DTO가 null입니다.");
			    }
			    
			    return edto;
			//return dto;
		}
	    
	    
}
