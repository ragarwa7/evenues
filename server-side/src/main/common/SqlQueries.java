package com.sbmp.common;

public class SqlQueries {
	
	public final static String SQL_GET_USER_LOGON_INFO = "select PRSN_PASS from LOGIN_INFO where PRSN_UNAME = ?";
	
	public final static String SQL_GET_ALL_VENUE_DETAILS = "select * from V_details";

}
