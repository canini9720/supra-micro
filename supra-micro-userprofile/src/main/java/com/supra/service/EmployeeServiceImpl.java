package com.supra.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supra.model.AuthUserEntity;
import com.supra.respository.EmployeeRespository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRespository employeeRespository;
	
	
	@Override
	public AuthUserEntity save(AuthUserEntity empEntity) throws Exception {

		return employeeRespository.save(empEntity);
	}

}
