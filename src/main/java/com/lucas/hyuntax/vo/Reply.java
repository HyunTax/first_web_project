package com.lucas.hyuntax.vo;

public class Reply {

	private String replySEQ;
	private String boardSEQ;
	private String replyID;
	private String replyContent;
	private String replyDate;

	public Reply() {
		super();
	}

	public Reply(String replySEQ, String boardSEQ, String replyID, String replyContent, String replyDate) {
		super();
		this.replySEQ = replySEQ;
		this.boardSEQ = boardSEQ;
		this.replyID = replyID;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

	public String getReplySEQ() {
		return replySEQ;
	}

	public void setReplySEQ(String replySEQ) {
		this.replySEQ = replySEQ;
	}

	public String getBoardSEQ() {
		return boardSEQ;
	}

	public void setBoardSEQ(String boardSEQ) {
		this.boardSEQ = boardSEQ;
	}

	public String getReplyID() {
		return replyID;
	}

	public void setReplyID(String replyID) {
		this.replyID = replyID;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

}