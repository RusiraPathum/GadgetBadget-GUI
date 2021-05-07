package com.project.service;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

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

}
