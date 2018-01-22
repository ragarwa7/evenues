package com.sbmp.handler;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sbmp.service.LogonDao;

@Component
public class LogonHandler {

	@Autowired
	LogonDao logonDao;
	
	public boolean verifyLoginDetails(String userName,String password){
			return logonDao.verifyLoginDetails(userName, password);
		}
}
