package org.siva.expensiontracker.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="UserId")
	private int userid;
	@Column(name="FullName", length=50, nullable = false)
	private String fullName;
	@Column(name="Email", length=50, nullable = false, unique = true)
	private String email;
	@Column(name="Password", length = 50, nullable = false)
	private String password;
	@Column(name="About", length=50, nullable = false)
	private String about;
	@Column(name="MobileNumber", length=10, nullable = false)
	private String mobileNumber;
	
	public User() {
		
	}

	public User(int userid, String fullName, String email, String password, String about, String mobileNumber) {
		this.userid = userid;
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.about = about;
		this.mobileNumber = mobileNumber;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", fullName=" + fullName + ", email=" + email + ", password=" + password
				+ ", about=" + about + ", mobileNumber=" + mobileNumber + "]";
	}
	
}
