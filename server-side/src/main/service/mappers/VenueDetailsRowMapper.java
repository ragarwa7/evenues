package com.sbmp.service.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sbmp.model.AllVenueDetailsBean;



public class VenueDetailsRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		AllVenueDetailsBean allVenueDetailsBean = new AllVenueDetailsBean(rs.getInt("V_ID"), rs.getString("V_NAME"),
				rs.getTime("OPEN_TIME"),rs.getTime("CLOSE_TIME"), rs.getString("V_CUISINES"), 
				rs.getString("V_FAMOUS_FOR"), rs.getInt("CUSTOM_OPTION"), 
				rs.getString("MEAL_TYPE"), rs.getDouble("BUDGET_LUNCH"), 
				rs.getDouble("BUDGET_DINNER"), rs.getString("CONTACT_NO_1"),
				rs.getString("CONTACT_NAME_1"), rs.getString("CONTACT_NO_2"),
				rs.getString("CONTACT_NAME_2"), rs.getString("EMAIL_ID_1"), rs.getString("EMAIL_ID_2"));
		
		return allVenueDetailsBean;
	}
}
