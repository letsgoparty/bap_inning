package com.app.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.Board;
import com.app.dto.Reply;



@Repository
public class ReplyDAO {

	
	@Autowired
	SqlSessionTemplate session;
	
	
	
		// 등록
		public int replyInsert(Reply reply) {
			return session.insert("ReplyMapper.replyInsert", reply);
		}
		// 삭제
		public int replyDelet(int no) {
			return session.delete("ReplyMapper.replyDelet", no);
		}
		// 목록
		public List<Reply> replyList(int no){
			
			return session.selectList("ReplyMapper.replyList", no);
		}
		public int replyNo(int no) {
			return session.selectOne("ReplyMapper.replyNo", no);
		}

}
