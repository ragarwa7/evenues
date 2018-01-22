/**
 * 
 */
package com.sbmp.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbmp.handler.LogonHandler;

/**
 * @author Agarwals
 * 
 */

@Controller
@RequestMapping(value = "/loginPage")
public class LogonController {

	@Autowired
	LogonHandler logonHandler;

	@RequestMapping(value = "/loginCheck.json", method = RequestMethod.PUT)
	public @ResponseBody String getProductData(@RequestBody String userName,@RequestBody String password) {
		
		boolean LoginFlag = false;

		LoginFlag = logonHandler.verifyLoginDetails(userName, password);

		if (LoginFlag) {
			return "productsInfo/productLayout";
		} else
			return "error";
	}

}
