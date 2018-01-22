/**
 * 
 */
package com.sbmp.service;


/**
 * @author Agarwals
 *
 */
public interface LogonDao {
	
	public boolean verifyLoginDetails(String userName,String password);
	
}
