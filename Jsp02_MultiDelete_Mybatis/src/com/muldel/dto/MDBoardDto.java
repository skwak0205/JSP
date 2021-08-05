package com.muldel.dto;

import java.util.Date;

public class MDBoardDto {
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regdate;

	public MDBoardDto() {

	}

	// 글 작성할 때 사용할 생성자
	public MDBoardDto(String writer, String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	// 글 수정할 때 사용할 생성자
	public MDBoardDto(int seq, String title, String content) {
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	public MDBoardDto(int seq, String writer, String title, String content, Date regdate) {
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
