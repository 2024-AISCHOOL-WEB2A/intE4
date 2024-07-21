package com.WCLProject.model.DTO;

public class BasicMemberDTO {
	private String id;
	private String pw;
	private String name;
	private String rrn;
	private String tel;
	private String nick;
	private String email;
	private String address;
	private String join;
	private String beferrer;
	
	public BasicMemberDTO(String id, String pw, String name, String rrn, String tel, String nick, String email,
			String address, String join, String beferrer) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.rrn = rrn;
		this.tel = tel;
		this.nick = nick;
		this.email = email;
		this.address = address;
		this.join = join;
		this.beferrer = beferrer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoin() {
		return join;
	}

	public void setJoin(String join) {
		this.join = join;
	}

	public String getBeferrer() {
		return beferrer;
	}

	public void setBeferrer(String beferrer) {
		this.beferrer = beferrer;
	}
	
	
}
