package org.siva.expensiontracker.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Expense {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ExpenseId")
	private int expenseid;
	@Column(name="Title", length = 45, nullable = false)
	private String title;
	@Column(name="Date", nullable = false)
	private String date;
	@Column(name="Time", nullable = false)
	private String time;
	@Column(name="Description", nullable = false, length = 50)
	private String description;
	@Column(name="Price", nullable = false)
	private String price;
	
	@ManyToOne
	private User user;
		
	public Expense() {
		
	}
	
	public Expense(int expenseid, String title, String date, String time, String description, String price, User user) {
		this.expenseid = expenseid;
		this.title = title;
		this.date = date;
		this.time = time;
		this.description = description;
		this.price = price;
		this.user = user;
	}

	public int getExpenseid() {
		return expenseid;
	}

	public void setExpenseid(int expenseid) {
		this.expenseid = expenseid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Expense [expenseid=" + expenseid + ", title=" + title + ", date=" + date + ", time=" + time
				+ ", description=" + description + ", price=" + price + ", user=" + user + "]";
	}

}
