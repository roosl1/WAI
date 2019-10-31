package com.test.imsi;

import java.util.Date;

public class BoardVO {
	private int bno;
	private String bsubject;
	private String bcontents;
	private String bid;
	private Date bdate;
	private int hit;
	
	public BoardVO()
	{	}
	
	public BoardVO(int bno, String bsubject, String bcontents, String bid, Date bdate, int hit) 
	{
		super();
		this.bno = bno;
		this.bsubject = bsubject;
		this.bcontents = bcontents;
		this.bid = bid;
		this.bdate = bdate;
		this.hit = hit;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
