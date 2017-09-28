package com.sinc.project.board.model.vo;

public class ReplyVO {
	private int bno;
	private String author, msg;
	private int seq;
	
	public ReplyVO() {
		super();
	}
	public ReplyVO(int bno, String author, String msg, int seq) {
		super();
		this.bno = bno;
		this.author = author;
		this.msg = msg;
		this.seq = seq;
	}
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", author=" + author + ", msg=" + msg
				+ ", seq=" + seq + "]";
	}

}

