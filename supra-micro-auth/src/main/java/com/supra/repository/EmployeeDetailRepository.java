package com.supra.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.supra.model.EmployeeDetailEntity;

public interface EmployeeDetailRepository extends JpaRepository<EmployeeDetailEntity, Long>{
}