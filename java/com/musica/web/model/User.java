package com.musica.web.model;

public class User {
	private String first_name;
	private String last_name;
	private String email;
	private String pwd;
	private String gender;
	private String dob;
	
	
	
	public User(String first_name, String last_name, String email, String pwd, String gender, String dob) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.pwd = pwd;
		this.gender = gender;
		this.dob = dob;
	}
	
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
}
