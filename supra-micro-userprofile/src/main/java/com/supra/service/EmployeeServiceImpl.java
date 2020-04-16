package com.supra.service;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supra.common.util.CommonUtil;
import com.supra.dto.EmployeeDTO;
import com.supra.dto.EmployeeDetailsDTO;
import com.supra.model.AuthUserEntity;
import com.supra.model.EmployeeDetailEntity;
import com.supra.respository.EmployeeRespository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRespository employeeRespository;
	
	
	@Override
	public AuthUserEntity save(AuthUserEntity empEntity) throws Exception {

		return employeeRespository.save(empEntity);
	}


	@Override
	public List<EmployeeDetailsDTO> getAllEmpDetails() throws Exception {
		
		List<AuthUserEntity> listUsers=employeeRespository.findAll();
		List<EmployeeDetailsDTO> listEmpDTO=listUsers.stream().map(authUserEntity->{
			EmployeeDetailsDTO empDetailDto=new EmployeeDetailsDTO();
			BeanUtils.copyProperties(authUserEntity, empDetailDto);
			EmployeeDetailEntity empDetEnt=authUserEntity.getEmpDetail();
			if(empDetEnt!=null) {
				BeanUtils.copyProperties(empDetEnt, empDetailDto);
				if(empDetEnt.getDob()!=null) {
					empDetailDto.setDob(CommonUtil.getFormattedDate(empDetEnt.getDob()));
				}
				if(empDetEnt.getNatEntity()!=null) {
					empDetailDto.setNationality(empDetEnt.getNatEntity().getCountryName());
				}
			}
			return empDetailDto;
		}).collect(Collectors.toList());
		return listEmpDTO;
	}

}
