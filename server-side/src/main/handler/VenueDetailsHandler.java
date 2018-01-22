package com.sbmp.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sbmp.model.AllVenueDetailsBean;
import com.sbmp.service.VenuesDetailsDao;
import com.sbmp.serviceImpl.VenueDetailsDaoImpl;

@Component
public class VenueDetailsHandler {

	
	@Autowired
	VenuesDetailsDao venuesDetailsDao;
	
	@Autowired
	AllVenueDetailsBean allVenueDetailsBean;
	
	
	public List getVenuedetails() {
		// TODO Auto-generated method stub
		return venuesDetailsDao.getListOfVenues();
	}

}
