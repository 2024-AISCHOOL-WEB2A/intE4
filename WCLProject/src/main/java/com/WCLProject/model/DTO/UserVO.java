package com.WCLProject.model.DTO;

public class UserVO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_rrn;
	private String user_tel;
	private String user_nick;
	private String user_email;
	private String user_address;
	private String user_join;
	private String user_referrer;
	
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_rrn="
				+ user_rrn + ", user_tel=" + user_tel + ", user_nick=" + user_nick + ", user_email=" + user_email
				+ ", user_address=" + user_address + ", user_join=" + user_join + ", user_referrer=" + user_referrer
				+ "]";
	}
	
	public UserVO(String user_id, String user_pw, String user_name, String user_rrn, String user_tel, String user_nick,
			String user_email, String user_address, String user_join, String user_referrer) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_rrn = user_rrn;
		this.user_tel = user_tel;
		this.user_nick = user_nick;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_join = user_join;
		this.user_referrer = user_referrer;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_rrn() {
		return user_rrn;
	}
	public void setUser_rrn(String user_rrn) {
		this.user_rrn = user_rrn;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_join() {
		return user_join;
	}
	public void setUser_join(String user_join) {
		this.user_join = user_join;
	}
	public String getUser_referrer() {
		return user_referrer;
	}
	public void setUser_referrer(String user_referrer) {
		this.user_referrer = user_referrer;
	}
	
	

}
