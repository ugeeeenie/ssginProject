package com.sinc.project.board.service;

import java.util.List;

import com.sinc.project.board.util.PagingDTO;

public interface BoardService {
	public List<Object> listService(PagingDTO dto);
	public Object readService(Object obj);
	public List<Object> replyInsertService(Object obj);
	public int getCount();
}
