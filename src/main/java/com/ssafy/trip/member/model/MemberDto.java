package com.ssafy.trip.member.model;

public class MemberDto {
	int id;
	String user_id;
	String name;
	String password;
	String email;
	String phone;
	String role;
	public MemberDto() {}
	public MemberDto(String user_id, String name, String password, String email, String phone, String role) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", user_id=" + user_id + ", name=" + name + ", password=" + password + ", email="
				+ email + ", phone=" + phone + ", role=" + role + "]";
	};
	
	
}
