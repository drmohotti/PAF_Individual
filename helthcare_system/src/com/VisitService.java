package com;

import model.Visit;

//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//For JSON 
import com.google.gson.*;

//For XML 
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/Visits")
public class VisitService {
	Visit visitObj = new Visit();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readVisits() {
		return visitObj.readVisits();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertVisit(@FormParam("hospital_name") String hospital_name,
			@FormParam("hospital_city") String hospital_city, @FormParam("date") String date,
			@FormParam("time") String time, @FormParam("noPatients") String noPatients) {
		String output = visitObj.insertVisits(hospital_name, hospital_city, date, time, noPatients);
		return output;
	}

	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateVisits(String visitData) {

		JsonObject visitObject = new JsonParser().parse(visitData).getAsJsonObject();

		String visiting_id = visitObject.get("visiting_id").getAsString();
		String hospital_name = visitObject.get("hospital_name").getAsString();
		String hospital_city = visitObject.get("hospital_city").getAsString();
		String date = visitObject.get("date").getAsString();
		String time = visitObject.get("time").getAsString();
		String noPatients = visitObject.get("noPatients").getAsString();

		String output = visitObj.updateVisits(visiting_id, hospital_name, hospital_city, date, time, noPatients);

		return output;
	}

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteItem(String visitData) 
	{ 
		Document doc = Jsoup.parse(visitData, "", Parser.xmlParser());

		String visiting_id = doc.select("visiting_id").text();

		String output = visitObj.deleteVisits(visiting_id);

		return output;
	}
}
