package com.lucas.hyuntax.vo;

public class BoardVO {

	private String boardSEQ;
	private String boardTitle;
	private String boardContent;
	private String boardID;
	private String boardDate;
	private int boardHit;

	public String getBoardSEQ() {
		return boardSEQ;
	}

	public void setBoardSEQ(String boardSEQ) {
		this.boardSEQ = boardSEQ;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardID() {
		return boardID;
	}

	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

}
