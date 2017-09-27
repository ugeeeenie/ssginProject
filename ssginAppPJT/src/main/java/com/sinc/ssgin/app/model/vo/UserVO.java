package com.sinc.ssgin.app.model.vo;

public class UserVO {
	private String 	id, pwd, name;
	private String 	sessionKey, sessionLimit;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public String getSessionLimit() {
		return sessionLimit;
	}
	public void setSessionLimit(String sessionLimit) {
		this.sessionLimit = sessionLimit;
	}
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String id, String pwd, String name,
			String sessionKey, String sessionLimit) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.sessionKey = sessionKey;
		this.sessionLimit = sessionLimit;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pwd=" + pwd + ", name="
				+ name + ", sessionKey="
				+ sessionKey
				+ ", sessionLimit="
				+ sessionLimit + "]";
	}
}
