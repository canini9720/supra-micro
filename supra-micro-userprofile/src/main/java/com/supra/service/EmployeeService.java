package com.supra.service;

import java.util.List;

import com.supra.dto.EmployeeDTO;
import com.supra.dto.EmployeeDetailsDTO;
import com.supra.model.AuthUserEntity;

public interface EmployeeService {

	public AuthUserEntity save(AuthUserEntity empEntity)throws Exception;
	public List<EmployeeDetailsDTO>  getAllEmpDetails()throws Exception;
	
}
