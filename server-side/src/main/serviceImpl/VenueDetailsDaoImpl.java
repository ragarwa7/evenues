package com.sbmp.serviceImpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.sbmp.common.SqlQueries;
import com.sbmp.service.VenuesDetailsDao;
import com.sbmp.service.mappers.VenueDetailsRowMapper;

@Component
public class VenueDetailsDaoImpl implements VenuesDetailsDao{

	
	@Resource(name= "jdbcTemplate")
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List getListOfVenues() {
		return  jdbcTemplate.query(SqlQueries.SQL_GET_ALL_VENUE_DETAILS, new VenueDetailsRowMapper());
	}

}
