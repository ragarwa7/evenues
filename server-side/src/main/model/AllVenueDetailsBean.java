package com.sbmp.model;

import java.sql.Time;

import org.springframework.stereotype.Component;

@Component
public class AllVenueDetailsBean {

	int venueId;
	String venueName;
	Time openTime;
	Time closeTime;
	String venueCuisines;
	String venueFamousFor;
	int customOption;
	String mealType;
	Double budgetLunch;
	Double budgetDinner;
	String contactNumber1;
	String contactName1;
	String contactNumber2;
	String contactName2;
	String email1;
	String email2;

	public int getVenueId() {
		return venueId;
	}

	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getVenueCuisines() {
		return venueCuisines;
	}

	public void setVenueCuisines(String venueCuisines) {
		this.venueCuisines = venueCuisines;
	}

	public String getVenueFamousFor() {
		return venueFamousFor;
	}

	public void setVenueFamousFor(String venueFamousFor) {
		this.venueFamousFor = venueFamousFor;
	}

	public int getCustomOption() {
		return customOption;
	}

	public void setCustomOption(int customOption) {
		this.customOption = customOption;
	}

	public String getMealType() {
		return mealType;
	}

	public void setMealType(String mealType) {
		this.mealType = mealType;
	}

	public Double getBudgetLunch() {
		return budgetLunch;
	}

	public void setBudgetLunch(Double budgetLunch) {
		this.budgetLunch = budgetLunch;
	}

	public Double getBudgetDinner() {
		return budgetDinner;
	}

	public void setBudgetDinner(Double budgetDinner) {
		this.budgetDinner = budgetDinner;
	}

	public String getContactNumber1() {
		return contactNumber1;
	}

	public void setContactNumber1(String contactNumber1) {
		this.contactNumber1 = contactNumber1;
	}

	public String getContactName1() {
		return contactName1;
	}

	public void setContactName1(String contactName1) {
		this.contactName1 = contactName1;
	}

	public String getContactNumber2() {
		return contactNumber2;
	}

	public void setContactNumber2(String contactNumber2) {
		this.contactNumber2 = contactNumber2;
	}

	public String getContactName2() {
		return contactName2;
	}

	public void setContactName2(String contactName2) {
		this.contactName2 = contactName2;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	

	public Time getOpenTime() {
		return openTime;
	}

	public void setOpenTime(Time openTime) {
		this.openTime = openTime;
	}

	public Time getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(Time closeTime) {
		this.closeTime = closeTime;
	}
	
	public AllVenueDetailsBean(){}
	

	public AllVenueDetailsBean(int venueId, String venueName,Time opentime, Time closeTime,
			String venueCuisines, String venueFamousFor, int customOption,
			String mealType, Double budgetLunch, Double budgetDinner,
			String contactNumber1, String contactName1, String contactNumber2,
			String contactName2, String email1, String email2) {
		super();
		this.venueId = venueId;
		this.venueName = venueName;
		this.openTime = opentime;
		this.closeTime = closeTime;
		this.venueCuisines = venueCuisines;
		this.venueFamousFor = venueFamousFor;
		this.customOption = customOption;
		this.mealType = mealType;
		this.budgetLunch = budgetLunch;
		this.budgetDinner = budgetDinner;
		this.contactNumber1 = contactNumber1;
		this.contactName1 = contactName1;
		this.contactNumber2 = contactNumber2;
		this.contactName2 = contactName2;
		this.email1 = email1;
		this.email2 = email2;
	}
	
	

}
