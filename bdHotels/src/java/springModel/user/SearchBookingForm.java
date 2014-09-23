/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package springModel.user;

/**
 *
 * @author NAUTILUS
 */
public class SearchBookingForm {
	private String city;
	private int day;
	private int month;
	private int year;
	private int person;
	private int noOfDays;
        private int floorNo;
        private String sideView;
        private double rent;

    public int getFloorNo() {
        return floorNo;
    }

    public void setFloorNo(int floorNo) {
        this.floorNo = floorNo;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public String getSideView() {
        return sideView;
    }

    public void setSideView(String sideView) {
        this.sideView = sideView;
    }

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

	

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

	
}
