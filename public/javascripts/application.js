// JavaScript Document

function HandleSlide(Clicked, Sliding)
{
	if (document.getElementById(Sliding).style.display == 'none')
	{
		ResetBackgroundColor(Clicked, "#75070E");
		Effect.SlideDown(Sliding, { duration: 1.0 });
	}
	else
	{
		Effect.SlideUp(Sliding, { duration: 1.0 });
		var t=setTimeout("ResetBackgroundColor('"+Clicked+"', '#cc0000')", 1000);
	}
}

function ResetBackgroundColor(Element, Color)
{
	document.getElementById(Element).style.backgroundColor = Color;
}

function setSelectedTableElement(id){
	
	var tableElement = document.getElementById("Search_Results_Table").getElementsByTagName("*");
	
	for ( var i = 0; i < tableElement.length; i++ ) {
		tableElement.item(i).style.opacity = "1";
	}
	
	document.getElementById("Table_Element_"+id).style.opacity = "0.5";
	
	location.assign("/lists/"+id);
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

function isUsed(nodes){
	
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
	    	if ( nodes.item(i).value != "" ){
	    		return true;
	    	}
	        break;
	    case "radio":
	    case "checkbox":
	        if (nodes.item(i).checked){
	        	return true;
	        }
	        break;
	    case "select-one":
	    case "select-multi":
	    	if ( nodes.item(i).selectedIndex != 0 ){
	    		return true;
	    	}
	    	break;
	    default:
	        break;
	    }
	}
	return false;
}