package com.supra.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.supra.common.util.CommonConstants;
import com.supra.common.util.CommonUtil;
import com.supra.dto.EmployeeDTO;
import com.supra.dto.EmployeeDetailsDTO;
import com.supra.model.AuthUserEntity;
import com.supra.model.EmployeeDetailEntity;
import com.supra.model.NationalityEntity;
import com.supra.model.RoleEntity;
import com.supra.service.EmployeeService;

@RestController
@RequestMapping(value="/userProfile")
public class UserProfileController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="/getEmp",method = RequestMethod.GET)
	public String getEmp()throws Exception {
	
		System.out.println("hi am calling====================");
		return "hi am calling====================";
	}
	
	@PreAuthorize("hasRole('ROLE_super')")
	@RequestMapping(value="/getAllEmpDetails",method = RequestMethod.GET)
	public List<EmployeeDetailsDTO> getAllEmpDetails()throws Exception {
		return employeeService.getAllEmpDetails();
	}
		
	
	@PreAuthorize("hasAuthority('create_profile')")
	@RequestMapping(value="/saveEmp",method = RequestMethod.POST)
	public String save(@RequestBody EmployeeDTO empDto)throws Exception {
		
		empDto.setPassword((CommonConstants.BCRYPT+CommonUtil.getEncodedBCrypt(empDto.getPassword())));
		
		AuthUserEntity user=new AuthUserEntity();
		EmployeeDetailEntity empDetEntity=new EmployeeDetailEntity();
		NationalityEntity natEnt=new NationalityEntity();
		natEnt.setId(empDto.getNatId());
		BeanUtils.copyProperties(empDto, user);
		BeanUtils.copyProperties(empDto, empDetEntity);
		
		
		
		user.setEnabled(true);
		user.setAccountNonExpired(true);
		user.setCredentialsNonExpired(true);
		user.setAccountNonLocked(true);
		
		empDetEntity.setDob(CommonUtil.getDatefromString(empDto.getDob(), CommonConstants.DATE_ddMMyyyy));
		empDetEntity.setNatEntity(natEnt);
		user.setEmpDetail(empDetEntity);
		empDetEntity.setUser(user);
		System.out.println("hi am calling====================");
		//return employeeService.save(empEntity);
		user=employeeService.save(user);
		return String.valueOf(user.getId());
	}

}
