package com.supra.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "OAUTH_ROLE")
public class RoleEntity implements Serializable {

    
	private static final long serialVersionUID = 1L;


	@Id
    @SequenceGenerator(name="LMN_OAUTH_ROLE_SEQ", sequenceName="LMN_OAUTH_ROLE_SEQ", allocationSize=1)
	@GeneratedValue( strategy=GenerationType.SEQUENCE,generator="LMN_OAUTH_ROLE_SEQ")
    private Integer id;
    
    
    @Column(name = "name")
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "OAUTH_PERMISSION_ROLE", joinColumns = {
            @JoinColumn(name = "ROLE_ID", referencedColumnName = "id")}, inverseJoinColumns = {
            @JoinColumn(name = "PERMISSION_ID", referencedColumnName = "id")})
    private List<PermissionEntity> permissions;

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

	public List<PermissionEntity> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<PermissionEntity> permissions) {
		this.permissions = permissions;
	}
    
    


}