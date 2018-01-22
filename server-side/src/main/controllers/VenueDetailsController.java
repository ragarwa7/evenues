package com.sbmp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbmp.handler.VenueDetailsHandler;


@Controller
@RequestMapping(value = "/venue")
public class VenueDetailsController {
	
	@Autowired
	VenueDetailsHandler handler;
	

	@RequestMapping(value="/getVenueListLayout")
	public String getVenueListJon() {
		return "venues/allVenueList";
	}
	
	@RequestMapping(value = "/getVenueList.json", method = RequestMethod.GET)
	public @ResponseBody List getVenueList() {
		return handler.getVenuedetails();
	}
	
	@RequestMapping(value="/getEnquiryForm")
	public String getVenueEnquiryForm() {
		return "venues/enquiryForm";
	}
	
	
			

}
