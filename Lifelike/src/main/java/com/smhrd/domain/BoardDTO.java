package com.smhrd.domain;

import java.sql.Date;

public class BoardDTO {
	private int boardNum;
	private String title;
	private String content;
	private String boardFile;
	private String id;
	private Date createDate;
	private int views;
	private int likes;
	
	
	public BoardDTO(int boardNum, String title, String content, String boardFile, String id, Date createDate,
			int views, int likes) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.boardFile = boardFile;
		this.id = id;
		this.createDate = createDate;
		this.views = views;
		this.likes = likes;
	}

	
	
	

	public BoardDTO(int boardNum, String title, String content, String boardFile, String id, Date createDate,
			int views) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.boardFile = boardFile;
		this.id = id;
		this.createDate = createDate;
		this.views = views;
	}





	public BoardDTO(int boardNum, String title, String content, String id, Date createDate) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.id = id;
		this.createDate = createDate;
	}





	public BoardDTO(int boardNum, String title, String content, String boardFile) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.boardFile = boardFile;
	}



	public BoardDTO(int boardNum, int views) {
		super();
		this.boardNum = boardNum;
		this.views = views;
	}





	public BoardDTO(String title, String content, String id) {
		super();
		this.title = title;
		this.content = content;
		this.id = id;
	}





	public BoardDTO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}





	public BoardDTO(int boardNum) {
		super();
		this.boardNum = boardNum;
	}





	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", boardFile="
				+ boardFile + ", id=" + id + ", createDate=" + createDate + ", views=" + views + ", likes=" + likes
				+ "]";
	}





	public BoardDTO() {
		super();
		this.boardNum = boardNum;
	}


	public int getBoardNum() {
		return boardNum;
	}


	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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


	public String getBoardFile() {
		return boardFile;
	}


	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


   
}