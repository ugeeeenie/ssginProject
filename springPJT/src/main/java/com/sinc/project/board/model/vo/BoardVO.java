package com.sinc.project.board.model.vo;

import java.util.ArrayList;

public class BoardVO {
	
	private int seq;
	private String title, content, writer, regdate;
	private int viewcnt;
	private ArrayList<ReplyVO> list;
	
	public BoardVO() {
		super();
	}
	public BoardVO(int seq, String title, String content, String writer,
			String regdate, int viewcnt) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public ArrayList<ReplyVO> getList() {
		return this.list;
	}
	public void setList(ArrayList<ReplyVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", list=" + list + "]";
	}
}
