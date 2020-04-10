package com.supra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.supra.model.EmployeeEntity;
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
	
	@RequestMapping(value="/saveEmp",method = RequestMethod.POST)
	public EmployeeEntity save(@RequestBody EmployeeEntity empEntity)throws Exception {
	
		System.out.println("hi am calling====================");
		return employeeService.save(empEntity);
	}

}
