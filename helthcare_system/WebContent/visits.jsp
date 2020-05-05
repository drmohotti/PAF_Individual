<%@page import="model.Visit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%-- 	
<% 
	System.out.println("\nTryingto process...");

	if (request.getParameter("hospital_name") != null)
	{ 
	Visit visitObj = new Visit();  
	String stsMsg ="";		
	
	
	if (request.getParameter("hidVisitIDSave") == "") {
		stsMsg =visitObj.insertVisits(request.getParameter("hospital_name"), 
									request.getParameter("hospital_city"), 
									request.getParameter("date"),
									request.getParameter("time") ,
									request.getParameter("noPatients")); 
	} else
	{
		stsMsg = visitObj.updateVisits(request.getParameter("hidVisitIDSave"),
		request.getParameter("hospital_name"), 
		request.getParameter("hospital_city"),
		request.getParameter("date"), 
		request.getParameter("time"),
		request.getParameter("noPatients"));
	}
	session.setAttribute("statusMsg", stsMsg);
		
} 

	if (request.getParameter("visiting_id") != null)  
	{ 
		Visit visitObj = new Visit();  
		String stsMsg = visitObj.deleteVisits(request.getParameter("visiting_id"));  
		
	}
	if (request.getParameter("hidVisitIDDelete") != null) {
		Visit visitObj = new Visit();  
		String stsMsg = visitObj.deleteVisits(request.getParameter("hidVisitIDDelete"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>	
	
	 --%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visiting Details Adding</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script> 


</head>
<body>
<h1>Doctor Visiting Details</h1>

	<form id="formVisit" name="formVisit" method="post" action="visits.jsp">
	
	
		
					<!-- NAME -->
					<div class="input-group input-group-sm mb-3" style="margin-left: 80px;">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">Hospital Name
							</span>
						</div>
						<input type="text" id="hospital_name" name="hospital_name">
					</div>
					
		 			<!-- CITY -->
					<div class="input-group input-group-sm mb-3" style="margin-left: 80px;">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName"> Hospital City :
							</span>
						</div>
						<input type="text" id="hospital_city" name="hospital_city">
					</div>
					
		 			<!-- Date -->
					<div class="input-group input-group-sm mb-3" style="margin-left: 80px;">

						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">Visiting Date : </span>
						</div>
						<input type="text" id="date" name="date">
					</div>
		 
		 			<!-- Time -->
					<div class="input-group input-group-sm mb-3" style="margin-left: 80px;">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">Visiting Time : </span>
						</div>
						<select id="time" name="time">
							<option value="">----- Select Time -----</option>
							<option value="6.00 - 9.00 AM">6.00 - 9.00 AM</option>
							<option value="9.00 - 12.00 AM">9.00 - 12.00 AM</option>
							<option value="12.00 - 3.00 PM">12.00 - 3.00 PM</option>
							<option value="3.00 - 6.00 PM">3.00 - 6.00 PM</option>
						</select>
						<!--  <input type="text" id="time" name="time">-->
					</div>
		 
			 		<!-- No. of channels -->	 
			 		
					<div class="input-group input-group-sm mb-3" style="margin-left: 80px;">
						<div class="input-group-prepend">
							<span class="input-group-text" id="lblName">No.Channels : </span>
						</div>
						<input type="text" id="noPatients" name="noPatients">
					</div>
					<br>
					
					<input name="btnReset" type="reset" value="Reset" class="btn btn-primary"  style="margin-left: 80px;width: 140px;"></th></tr>
					<input	id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary" style="width: 140px;">
					<input type="hidden" id="hidVisitIDSave" name="hidVisitIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	
	<%-- 	<%
			out.print(session.getAttribute("statusMsg"));
		%> --%>
	</div>
	
<!-- 	<div id=alertError" class="alert alert-danger">
 -->	
	<br>
	<div id="divVisitsGrid">
	<%
		Visit visitObj = new Visit();
		out.print(visitObj.readVisits());
	%>
	</div>
	
</body>
</html>