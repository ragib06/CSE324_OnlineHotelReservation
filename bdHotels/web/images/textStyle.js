/**
 * @author NAUTILUS
 */
var val;
var cityVal = "Dhaka, Rajshahi etc.";
var daysVal = "# of days";
var personsVal = "# of persons";
function initialize(){
	document.getElementById("bcity").style.fontStyle="italic";
	document.getElementById("bcity").style.color = "grey";
	document.getElementById("bcity").value = cityVal;
	
	document.getElementById("days").style.fontStyle="italic";
	document.getElementById("days").style.color = "grey";
	document.getElementById("days").value = daysVal;
	
	document.getElementById("persons").style.fontStyle="italic";
	document.getElementById("persons").style.color = "grey";
	document.getElementById("persons").value = personsVal;
}

function setTextStyle(x){
    val = document.getElementById(x).value;
    if (val == null || val == cityVal || val == daysVal || val == personsVal) {
        document.getElementById(x).style.color = "black";
        document.getElementById(x).style.fontStyle = "normal";
        document.getElementById(x).value = "";
    }
    document.getElementById(x).style.borderColor = "#00A600";
}

function clearText(x){
    var val = document.getElementById(x).value;
    if (val == null || val == "") {
        document.getElementById(x).style.color = "grey";
        document.getElementById(x).style.fontStyle = "italic";
		if(x == "bcity")
                    document.getElementById(x).value = cityVal;
		else if(x == "days")
                    document.getElementById(x).value = daysVal;
		else
                    document.getElementById(x).value = personsVal;
    }
    document.getElementById(x).style.borderColor = "#FFFFFF"; 
}