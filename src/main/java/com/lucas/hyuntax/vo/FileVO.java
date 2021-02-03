package com.lucas.hyuntax.vo;

public class FileVO {
	private String fileSEQ;
	private String boardSEQ;
	private String orgName;
	private String savName;

	public FileVO() {
		super();
	}

	public FileVO(String fileSEQ, String boardSEQ, String orgName, String savName) {
		super();
		this.fileSEQ = fileSEQ;
		this.boardSEQ = boardSEQ;
		this.orgName = orgName;
		this.savName = savName;
	}

	public String getFileSEQ() {
		return fileSEQ;
	}

	public void setFileSEQ(String fileSEQ) {
		this.fileSEQ = fileSEQ;
	}

	public String getBoardSEQ() {
		return boardSEQ;
	}

	public void setBoardSEQ(String boardSEQ) {
		this.boardSEQ = boardSEQ;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSavName() {
		return savName;
	}

	public void setSavName(String savName) {
		this.savName = savName;
	}

}
