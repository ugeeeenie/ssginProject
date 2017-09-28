package com.sinc.ssgin.app.model.vo;

public class UserVO {
	//이름, 생년월일, 성별, 핸드폰번호, 
	private int		user_no;
	private String	hash;
	//private String 	sessionKey, sessionLimit;
	
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserVO(int user_no, String hash) {
		super();
		this.user_no = user_no;
		this.hash = hash;
	}
	
	public int getUser_no() {
		return user_no;
	}
	
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public String getHash() {
		return hash;
	}
	
	public void setHash(String hash) {
		this.hash = hash;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_no=" + user_no + ", hash=" + hash
				+ "]";
	}
}
