package com.sinc.project.board.model.sql;

import java.util.List;

import com.sinc.project.board.util.PagingDTO;

public interface BoardDao {
	public List<Object> listRow(PagingDTO dto);
	public Object readRow(Object obj);
	public List<Object> listReplyRow(Object obj);
	public void replyInsertRow(Object obj);
	public int getCountRow();
}
