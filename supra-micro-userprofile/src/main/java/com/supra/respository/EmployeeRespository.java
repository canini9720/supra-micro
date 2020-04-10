package com.supra.respository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.supra.model.EmployeeEntity;

public interface EmployeeRespository extends JpaRepository<EmployeeEntity,Long>{

}
