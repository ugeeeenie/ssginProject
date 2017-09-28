package com.sinc.project.board.model.sql;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sinc.project.board.util.PagingDTO;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Resource(name="sqlSession")
	private SqlSession session;
	
	private static final String BOARD_PREFIX = "com.sinc.project.mapper.board.";
	private static final String REPLY_PREFIX = "com.sinc.project.mapper.reply.";
	
	@Override
	public List<Object> listRow(PagingDTO dto) {
		System.out.println("Dao ListRow");
		
		return session.selectList(BOARD_PREFIX + "list", dto);
	}

	@Override
	public Object readRow(Object obj) {
		System.out.println("Dao readRow");
		
		return session.selectOne(BOARD_PREFIX + "read", obj);
	}

	@Override
	public List<Object> listReplyRow(Object obj) {
		System.out.println("Dao listReplyRow");
		
		return session.selectList(REPLY_PREFIX + "list", obj);
	}

	@Override
	public void replyInsertRow(Object obj) {
		System.out.println("Dao replyInsertRow");
		
		session.insert(REPLY_PREFIX + "insert", obj);
	}

	@Override
	public int getCountRow() {
		System.out.println("Dao getCountRow");
		
		return session.selectOne(BOARD_PREFIX + "cnt");
	}

}
