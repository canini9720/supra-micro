package com.supra.respository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.supra.model.AuthUserEntity;

public interface EmployeeRespository extends JpaRepository<AuthUserEntity,Long>{

}
