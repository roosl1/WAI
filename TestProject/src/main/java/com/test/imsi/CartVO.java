package com.test.imsi;

public class CartVO {
	private int cartno;
	private String id;
	private String productcode;
	private int productamount;
	
	public CartVO()
	{	}

	public CartVO(int cartno, String id, String productcode, int productamount) {
		super();
		this.cartno = cartno;
		this.id = id;
		this.productcode = productcode;
		this.productamount = productamount;
	}

	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}

	public int getProductamount() {
		return productamount;
	}

	public void setProductamount(int productamount) {
		this.productamount = productamount;
	}
	

	
	
	
}
