package com.project.service;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.model.ProjectServlet;

@Path("Projects")
public class ProjectService {
	
	ProjectServlet projectObj = new ProjectServlet();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readProjects() {
		return projectObj.readProjects();

	}
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_HTML)
	public String insertProject(
			@FormParam("project_category") String project_category,
			@FormParam("project_name") String project_name, 
			@FormParam("short_des") String short_des,
			@FormParam("price") String price, 
			@FormParam("date") String date,
			@FormParam("project_goal") String project_goal, 
			@FormParam("long_des") String long_des) {
				
		String output = projectObj.insertProject(project_category, project_name, short_des, price, date, project_goal, long_des);
		return output;
		
	}
	
	@PUT
	@Path("/")
	@Consumes(javax.ws.rs.core.MediaType.APPLICATION_JSON)
	@Produces(javax.ws.rs.core.MediaType.TEXT_PLAIN)
	public String updateProject(String projectData) {

		JsonObject projectObject = new JsonParser().parse(projectData).getAsJsonObject();

		String projectID = projectObject.get("projectID").getAsString();
		String pproject_categoryid = projectObject.get("project_category").getAsString();
		String project_name = projectObject.get("project_name").getAsString();
		String short_des = projectObject.get("short_des").getAsString();
		String price = projectObject.get("price").getAsString();
		String date = projectObject.get("date").getAsString();
		String project_goal = projectObject.get("project_goal").getAsString();
		String long_des = projectObject.get("long_des").getAsString();

		String output = projectObj.updateProject(projectID, pproject_categoryid, project_name, short_des, price, date, project_goal, long_des);

		return output;

	}
	
	@DELETE
	@Path("/")
	@Consumes(javax.ws.rs.core.MediaType.APPLICATION_XML)
	@Produces(javax.ws.rs.core.MediaType.TEXT_PLAIN)
	public String deleteProject(String projectData) {
		
		Document ducument = Jsoup.parse(projectData, "", Parser.xmlParser());
		
		String projectID = ducument.select("projectID").text();
		System.out.println(projectID);
		String output = projectObj.deleteProject(projectID);
		System.out.println(output);
		return output;
		
	}

}
