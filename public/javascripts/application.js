// JavaScript Document

function showPrice(id)
{
	var tmpID = id;
	
	if (id == 'Price_Ops_Invis')
	{
		id = 'Price_Ops_Vis';
		document.getElementById('Price').id = "Price_All";
	}
	else
	{
		id = 'Price_Ops_Invis';
		document.getElementById('Price_All').id = "Price";
	}
	
	document.getElementById('PriceHandler').innerHTML = "<p onclick=\"showPrice('"+id+"')\">Price</p>";
	
	document.getElementById(tmpID).id = id;
}

function showLocation(id)
{
	var tmpID = id;
	
	if (id == 'Location_Ops_Invis')
	{
		id = 'Location_Ops_Vis';
		document.getElementById('Location').id = "Location_All";
	}
	else
	{
		id = 'Location_Ops_Invis';
		document.getElementById('Location_All').id = "Location";
	}
	
	document.getElementById('LocationHandler').innerHTML = "<p onclick=\"showLocation('"+id+"')\">Location</p>";
	
	document.getElementById(tmpID).id = id;
}

function showType(id)
{
	var tmpID = id;
	
	if (id == 'Type_Ops_Invis')
	{
		id = 'Type_Ops_Vis';
		document.getElementById('Type_of_Res').id = "Type_of_Res_All";
	}
	else
	{
		id = 'Type_Ops_Invis';
		document.getElementById('Type_of_Res_All').id = "Type_of_Res";
	}
	
	document.getElementById('TypeHandler').innerHTML = "<p onclick=\"showType('"+id+"')\">Type of Residence</p>";
	
	document.getElementById(tmpID).id = id;
}

function showDetails(id)
{
	var tmpID = id;
	
	if (id == 'Details_Ops_Invis')
	{
		id = 'Details_Ops_Vis';
		document.getElementById('Res_Details').id = "Res_Details_All";
	}
	else
	{
		id = 'Details_Ops_Invis';
		document.getElementById('Res_Details_All').id = "Res_Details";
	}
	
	document.getElementById('DetailsHandler').innerHTML = "<p onclick=\"showDetails('"+id+"')\">Residence Details</p>";
	
	document.getElementById(tmpID).id = id;
}

function showLease(id)
{
	var tmpID = id;
	
	if (id == 'Lease_Ops_Invis')
	{
		id = 'Lease_Ops_Vis';
		document.getElementById('Lease_Details').id = "Lease_Details_All";
	}
	else
	{
		id = 'Lease_Ops_Invis';
		document.getElementById('Lease_Details_All').id = "Lease_Details";
	}
	
	document.getElementById('LeaseHandler').innerHTML = "<p onclick=\"showLease('"+id+"')\">Lease Details</p>";
	
	document.getElementById(tmpID).id = id;
}

function showUtils(id)
{
	var tmpID = id;
	
	if (id == 'Utils_Ops_Invis')
	{
		id = 'Utils_Ops_Vis';
		document.getElementById('Utilities').id = "Utils_All";
	}
	else
	{
		id = 'Utils_Ops_Invis';
		document.getElementById('Utils_All').id = "Utilities";
	}
	
	document.getElementById('UtilsHandler').innerHTML = "<p onclick=\"showUtils('"+id+"')\">Utilities</p>";
	
	document.getElementById(tmpID).id = id;
}

function showAccoms(id)
{
	var tmpID = id;
	
	if (id == 'Accoms_Ops_Invis')
	{
		id = 'Accoms_Ops_Vis';
		document.getElementById('Accomodations').id = "Accoms_All";
	}
	else
	{
		id = 'Accoms_Ops_Invis';
		document.getElementById('Accoms_All').id = "Accomodations";
	}
	
	document.getElementById('AccomsHandler').innerHTML = "<p onclick=\"showAccoms('"+id+"')\">Accomodations</p>";
	
	document.getElementById(tmpID).id = id;
}

function showRestricts(id)
{
	var tmpID = id;
	
	if (id == 'Restricts_Ops_Invis')
	{
		id = 'Restricts_Ops_Vis';
		document.getElementById('Restrictions').id = "Restricts_All";
	}
	else
	{
		id = 'Restricts_Ops_Invis';
		document.getElementById('Restricts_All').id = "Restrictions";
	}
	
	document.getElementById('RestrictsHandler').innerHTML = "<p onclick=\"showRestricts('"+id+"')\">Restrictions</p>";
	
	document.getElementById(tmpID).id = id;
}

function setSelectedTableElement(id){
	
	document.getElementById("Table_Actions").innerHTML = "<a class=\"Table_Action\" href=\"/lists/"+id+"\">Show</a>"+
		"<a class=\"Table_Action\" href=\"/lists/"+id+"/edit\">Edit</a>"+
		"<a class=\"Table_Action\" href=\"/lists/"+id+"\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\">Remove</a>";
	
	var tableElement = document.getElementById("Search_Results_Table").getElementsByTagName("*");
	
	for ( var i = 0; i < tableElement.length; i++ ) {
		tableElement.item(i).style.opacity = "1";
	}
	
	document.getElementById("Table_Element_"+id).style.opacity = "0.5";

}

function clearAllFields(){
	
	var nodes = document.getElementById("Search_Sidebar_Criteria").getElementsByTagName("*");
	
	for (i = 0; i < nodes.length; i++)
	{
		if ( nodes.item(i).type == undefined ){
			continue;
		}
	    fieldType = nodes.item(i).type.toLowerCase();
	    switch (fieldType){
	    case "text":
	    case "password":
	    case "textarea":
	    case "hidden":
	        nodes.item(i).value = "";
	        break;
	    case "radio":
	    case "checkbox":
	        if (nodes.item(i).checked){
	            nodes.item(i).checked = false;
	        }
	        break;
	    case "select-one":
	    case "select-multi":
	        nodes.item(i).selectedIndex = -1;
	        break;
	    default:
	        break;
	    }
	}
	
}