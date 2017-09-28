package com.sinc.bootstrap.model.vo;

public class ImgVO {
	private String 	imgPath, title, content;
	private int 	badgeValue;

	public ImgVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImgVO(String imgPath, String title, String content,
			int badgeValue) {
		super();
		this.imgPath = imgPath;
		this.title = title;
		this.content = content;
		this.badgeValue = badgeValue;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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

	public int getBadgeValue() {
		return badgeValue;
	}

	public void setBadgeValue(int badgeValue) {
		this.badgeValue = badgeValue;
	}

	@Override
	public String toString() {
		return "ImgVO [imgPath=" + imgPath + ", title=" + title
				+ ", content=" + content
				+ ", badgeValue=" + badgeValue
				+ "]";
	}

}
