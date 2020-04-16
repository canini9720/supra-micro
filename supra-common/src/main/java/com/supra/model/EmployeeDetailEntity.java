package com.supra.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
//@Data

@Entity
@Table(name = "LMN_EMPLOYEE_DETAIL")
public class EmployeeDetailEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
    private Long id;
	
	@Column(name="FIRST_NAME")
	private String firstName;
	
	@Column(name="LAST_NAME")
	private String lastName;
	
	@Column(name="DOB")
	private Date dob;
	
	@Column(name="PASSPORT_NO")
	private String passportNo;
	
	@Column(name="EIDA")
	private Long emirateId;
	
	@Column(name="CREATED_DATE")
	private Date createdDate;
	
	@Column(name="UPDATED_DATE")
	private Date updatedDate;
	
	@OneToOne
	@JoinColumn(name="NATIONALITY")
	private NationalityEntity natEntity;
	
	
	@OneToOne
    @MapsId
    @JoinColumn(name = "USER_ID") 
    private AuthUserEntity user;
	
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public Long getEmirateId() {
		return emirateId;
	}

	public void setEmirateId(Long emirateId) {
		this.emirateId = emirateId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public NationalityEntity getNatEntity() {
		return natEntity;
	}

	public void setNatEntity(NationalityEntity natEntity) {
		this.natEntity = natEntity;
	}

	public AuthUserEntity getUser() {
		return user;
	}

	public void setUser(AuthUserEntity user) {
		this.user = user;
	}
	
	

}
