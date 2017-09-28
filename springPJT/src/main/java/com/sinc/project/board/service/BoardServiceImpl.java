package com.sinc.project.board.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.project.board.model.sql.BoardDao;
import com.sinc.project.board.model.vo.BoardVO;
import com.sinc.project.board.util.PagingDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDao")
	private BoardDao dao;
	
	@Override
	public List<Object> listService(PagingDTO dto) {
		System.out.println("Service listService");
		
		return dao.listRow(dto);
	}

	@Override
	public Object readService(Object obj) {
		System.out.println("Service readService");
		
		Object board = dao.readRow(obj);
		if(board != null) {
			List<Object> list = dao.listReplyRow(board);
			((BoardVO)board).setList((ArrayList)list);
		}
		return board;
	}

	@Override
	public List<Object> replyInsertService(Object obj) {
		System.out.println("Service replyInsertService");
		
		dao.replyInsertRow(obj);
		return dao.listReplyRow(obj);
	}

	@Override
	public int getCount() {
		System.out.println("Service getCount");
		
		return dao.getCountRow();
	}

}
