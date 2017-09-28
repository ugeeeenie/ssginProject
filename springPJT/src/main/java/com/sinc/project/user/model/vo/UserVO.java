package com.sinc.project.user.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String id, pwd, name;
	private int upoint;
	private String sessionKey, sessionLimit;
	private String imgSrc;
	private boolean useCookie;
	private MultipartFile file;
	
	public UserVO() {
		super();
	}
	public UserVO(String id, String pwd, String name, int upoint,
			String sessionKey, String sessionLimit, String imgSrc, boolean useCookie, MultipartFile file) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.upoint = upoint;
		this.sessionKey = sessionKey;
		this.sessionLimit = sessionLimit;
		this.imgSrc = imgSrc;
		this.useCookie = useCookie;
		this.file = file;
	}
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
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
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
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public MultipartFile getFile() {
		return file;
	}
}
