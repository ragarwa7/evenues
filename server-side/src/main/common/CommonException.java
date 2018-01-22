package com.sbmp.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class CommonException extends RuntimeException{
	 
	private static Log LOG = LogFactory.getLog(CommonException.class);
	
	private String exceptionMsg;
	private String errorCode;
 
	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public CommonException(String exceptionMsg, String errorCode) {
		this.exceptionMsg = exceptionMsg;
		this.errorCode = errorCode;
	}
	
	public String getExceptionMsg(){
		return this.exceptionMsg;
	}
	
	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}
}