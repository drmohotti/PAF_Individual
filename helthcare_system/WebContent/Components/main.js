
$(document).ready(function() {
	//if ($("#alertSuccess").text().trim() == "")  
	 
	$("#alertSuccess").hide();  
	 
	$("#alertError").hide();
});

$(document).on("click","#btnSave",function(event) 
		{
			$("#alertSuccess").text("");
			$("#alertSuccess").hide();
			$("#alertError").text("");
			$("#alertError").hide();

			var status = validateVisitForm();
			if (status != true) {
				$("#alertError").text(status);
				$("#alertError").show();
				return;
			}
			
			var type = ($("#hidVisitIDSave").val() == "") ? "POST" : "PUT";
			
			$.ajax(
					{
					 url : "VisitsAPI",
					 type : type,
					 data : $("#formVisit").serialize(),
					 dataType : "text",
					 complete : function(response, status)
					 {
					 onVisitSaveComplete(response.responseText, status);
					 }
					
					});
			
			//$("#formVisit").submit();
	
		});

function onVisitSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divVisitsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}	
	
	$("#hidVisitIDSave").val("");
	$("#formItem")[0].reset();
}



$(document).on("click",".btnUpdate",function(event) 
		{
			$("#hidVisitIDSave").val($(this).closest("tr").find('#hidVisitIDUpdate').val());
			$("#hospital_name").val($(this).closest("tr").find('td:eq(0)').text());
			$("#hospital_city").val($(this).closest("tr").find('td:eq(1)').text());
			$("#date").val($(this).closest("tr").find('td:eq(2)').text());
			$("#time").val($(this).closest("tr").find('td:eq(3)').text());
			$("#noPatients").val($(this).closest("tr").find('td:eq(4)').text());
		});


/*$(document).on("click", ".btnRemove", function(event) 
{ 
	$(this).closest(".visit").btnRemove();  
	$("#alertSuccess").text("Removed successfully.");
	$("#alertSuccess").show();
}); 
*/
$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "VisitsAPI",
		 type : "DELETE",
		 data : "visiting_id=" + $(this).data("visiting_id"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onVisitDeleteComplete(response.responseText, status);
		 }
		 
		});
});
function onVisitDeleteComplete(response, status)
{
if (status == "success")
 	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			
			$("#divVisitsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
 	} else if (status == "error")
 	{
 		$("#alertError").text("Error while deleting.");
 		$("#alertError").show();
 	} else
 	{
 		$("#alertError").text("Unknown error while deleting..");
 		$("#alertError").show();
 	}
}




function validateVisitForm() 
{
	if ($("#hospital_name").val().trim() == "") 
	{
		return "Insert Hospital Name.";
	}
	
	if ($("#hospital_city").val().trim() == "") 
	{
		return "Insert Hospital City.";
	}
	if ($("#date").val().trim() == "") 
	{
		return "Insert Date.";
	}
	if ($("#time").val().trim() == "") 
	{
		return "Insert Visiting Time.";
	}
	if ($("#noPatients").val().trim() == "") 
	{
		return "Insert No. of Channels.";
	}

	return true;
}


