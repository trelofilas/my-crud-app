package com.eurodyn.project.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
//import javax.persistence.Version;


@Entity
@Table(name = "users")
@SecondaryTable(name = "addresses", pkJoinColumns = @PrimaryKeyJoinColumn(name = "user_id", referencedColumnName = "id"))
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false, nullable = false)
    private int id;
	//private Integer id;
	
	//@Version
    //private int version;
	
	@Column
	private String firstname;
	
	@Column
	private String surname;

	@Column
	private String gender;
	
	@Column
	private Date birthdate;
	
	@Column(table = "addresses", nullable = true)
	private String home_address;
	
	@Column(table = "addresses", nullable = true)
	private String work_address;
	
	public User() {
	}

	public int getId() {
		return id;
	}

	//public int getVersion() {
	//	return version;
	//}

	public String getFirstname() {
		return firstname;
	}

	public String getSurname() {
		return surname;
	}

	public String getGender() {
		return gender;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public String getHomeAddress() {
		return home_address;
	}

	public String getWorkAddress() {
		return work_address;
	}

	public void setId(int id) {
		this.id = id;
	}

	//public void setVersion(int version) {
	//	this.version = version;
	//}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public void setHomeAddress(String home_address) {
		this.home_address = home_address;
	}

	public void setWorkAddress(String work_address) {
		this.work_address = work_address;
	}

}
