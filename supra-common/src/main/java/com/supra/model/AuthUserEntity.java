package com.supra.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "OAUTH_USER")
public class AuthUserEntity implements Serializable {
    
	private static final long serialVersionUID = 1L;


	public AuthUserEntity() {
    }

    public AuthUserEntity(AuthUserEntity user) {
        this.username = user.getUsername();
        this.password = user.getPassword();
        this.email = user.getEmail();
        this.enabled = user.isEnabled();
        this.accountNonExpired = user.isAccountNonExpired();
        this.credentialsNonExpired = user.isCredentialsNonExpired();
        this.accountNonLocked = user.isAccountNonLocked();
        this.roles = user.getRoles();
    }

    @Id
    @SequenceGenerator(name="LMN_EMP_SEQ", sequenceName="LMN_EMP_SEQ", allocationSize=1)
	@GeneratedValue( strategy=GenerationType.SEQUENCE,generator="LMN_EMP_SEQ")
    private Long id;

    @Column(name = "username")
    private String username;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "enabled")
    private boolean enabled;
    
    @Column(name = "accountNonExpired")
    private boolean accountNonExpired;
    
    @Column(name = "credentialsNonExpired")
    private boolean credentialsNonExpired;
    
    @Column(name = "accountNonLocked")
    private boolean accountNonLocked;
    
    
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private EmployeeDetailEntity empDetail;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "OAUTH_ROLE_USER", joinColumns = {@JoinColumn(name = "USER_ID", referencedColumnName = "ID")},
            inverseJoinColumns = {
                    @JoinColumn(name = "ROLE_ID", referencedColumnName = "ID")})
    private List<RoleEntity> roles;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	public EmployeeDetailEntity getEmpDetail() {
		return empDetail;
	}

	public void setEmpDetail(EmployeeDetailEntity empDetail) {
		this.empDetail = empDetail;
	}



}