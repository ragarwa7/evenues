/**
 * 
 */
package com.sbmp.serviceImpl;


import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.sbmp.service.LogonDao;

import static com.sbmp.common.SqlQueries.SQL_GET_USER_LOGON_INFO;

/**
 * @author Agarwals
 *
 */

@Component
public class LogonDaoImpl implements LogonDao {

	@Resource(name= "jdbcTemplate")
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public boolean verifyLoginDetails(String userName, String password) {
		boolean flag=false;
		
		String pass = jdbcTemplate.queryForObject(SQL_GET_USER_LOGON_INFO, String.class, userName);
		if(!pass.equals(null) && pass.equals(password)){
			flag=true;
			
		}
		
		return flag;
	}

}
