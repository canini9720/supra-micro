package com.supra.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LMN_NATIONALITY_MASTER")
public class NationalityEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="ID")
	private Long id;
	
	@Column(name="COUNTRY_EN")
	private String countryName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	
	

}
