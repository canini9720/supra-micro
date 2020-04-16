package com.supra.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "OAUTH_PERMISSION")
public class PermissionEntity implements Serializable {
	
    
	private static final long serialVersionUID = 1L;

	@Id
    @SequenceGenerator(name="LMN_OAUTH_PERMISSION_SEQ", sequenceName="LMN_OAUTH_PERMISSION_SEQ", allocationSize=1)
	@GeneratedValue( strategy=GenerationType.SEQUENCE,generator="LMN_OAUTH_PERMISSION_SEQ")
    private Integer id;
    
    @Column(name = "name")
    private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
    
}