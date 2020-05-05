package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Visit {

	public Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");

			System.out.print("\nSuccessfully connected");
		} catch (Exception e) {
			System.out.print("\nNot connected");

			e.printStackTrace();
		}
		return con;
	}

	public String insertVisits(String hospital_name, String hospital_city, String date, String time,String noPatients) {

		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "\nError while connecting to the database";
			}

			String query = "insert into doctor_visiting values(?, ?, ?, ?, ?,?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, hospital_name);
			preparedStmt.setString(3, hospital_city);
			preparedStmt.setString(4, date);
			preparedStmt.setString(5, time);
			preparedStmt.setString(6, noPatients);

			preparedStmt.execute();
			con.close();

			String newVisits = readVisits(); 
			output = "\nYou have Inserted successfully";
			output = "{\"status\":\"success\", \"data\": \"" + newVisits + "\"}"; 
			

		} catch (Exception e) {
			/*output = "\nError while inserting12";*/
			
			output = "{\"status\":\"error\", \"data\":"	+ "\"Error while inserting the Visiting Details.\"}"; 
			System.err.println(e.getMessage());
			System.out.println("not inserted");

		}

		return output;

	}

	public String updateVisits(String visiting_id, String hospital_name, String hospital_city, String date, String time,String noPatients) {
		String output = "";
		try {
			Connection con = connect();
			
			if (con == null) {
				return "\nError while connecting to the database";
			}

			String query = "update doctor_visiting set hospital_name=?, hospital_city=?, date=?,time= ?,noPatients= ? where visiting_id=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			preparedStmt.setString(1, hospital_name);
			preparedStmt.setString(2, hospital_city);
			preparedStmt.setString(3, date);
			preparedStmt.setString(4, time);
			preparedStmt.setInt(5, Integer.parseInt(noPatients));
			preparedStmt.setInt(6, Integer.parseInt(visiting_id));

			preparedStmt.execute();
			con.close();

			String newVisits = readVisits();
			 output = "{\"status\":\"success\", \"data\": \"" +	 newVisits + "\"}"; 
			 
			/*output = "\nYou have Updated successfully";
			System.out.print("Updated");*/

		} catch (Exception e) {
			/*output = "\nError while updatinf";
			System.err.println(e.getMessage());
			System.out.println("not ups");*/

			output = "{\"status\":\"error\", \"data\":"
					+ "\"Error while updating the item.\"}";
					 System.err.println(e.getMessage()); 
		}

		return output;

	}

	public String readVisits() {
		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			output = "<table border=\"1\"><tr><th>Hospital Name</th>" + "<th>Hospital City</th>"
					+ "<th>Date</th><th>Time</th>" + "<th>No. of patients</th>" + "<th>Update</th><th>Remove</th>"
					+ "</tr>";

			String query = "select * from doctor_visiting";
			Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				String visiting_id = Integer.toString(rs.getInt("visiting_id"));
				String hospital_name = rs.getString("hospital_name");
				String hospital_city = rs.getString("hospital_city");
				String date = rs.getString("date");
				String time = rs.getString("time");
				String noPatients = rs.getString("noPatients");

				output += "<tr><td><input id=\"hidVisitIDUpdate\" name=\"hidVisitIDUpdate\"     type=\"hidden\" value=\""
						+ visiting_id + "\">" + hospital_name + "</td>";
				output += "<td>" + hospital_city + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + time + "</td>";
				output += "<td>" + noPatients + "</td>";

				/*output += "<td><input name=\"btnUpdate\" type=\"button\"    value=\"Update\" class=\"btnUpdate btn btn-secondary\"></td>"
						+ "<td><form method=\"post\" action=\"visits.jsp\">" + "<input name=\"btnRemove\" "
						+ " type=\"submit\" value=\"Remove\" class=\"btn btn-danger\"> " 
				+ "<input name=\"hidVisitIDDelete\" type=\"hidden\" value=\"" + visiting_id + "\">" + "</form></td></tr>"; */
				
				output += "<td><input name='btnUpdate' type='button'  value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button'  value='Remove' class='btn btn-danger' data-visitid='" 
				+  visiting_id + "'>" + "</td></tr>";
			}

			con.close();

			output += "</table>";

		} catch (Exception e) {
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deleteVisits(String visiting_id) {
		String output = "";

		try {
			Connection con = connect();
			
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "delete from doctor_visiting where visiting_id=?";

			PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(visiting_id));
			// execute the statement preparedStmt.execute(); con.close();

			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newVisits = readVisits();
			 output = "{\"status\":\"success\", \"data\": \"" + newVisits + "\"}"; 

			/*output = "You have Deleted successfully";*/
			

		} catch (Exception e) {
			/*output = "Error while deleting the item.";
			System.err.println(e.getMessage());*/
			
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the visiting details.\"}";
					 System.err.println(e.getMessage()); 
		}
		return output;
	}

}
