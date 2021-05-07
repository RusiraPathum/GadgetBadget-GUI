package com.project.model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProjectAPI
 */
@WebServlet("/ProjectAPI")
public class ProjectAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProjectServlet projectObj = new ProjectServlet();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String outputString = projectObj.insertProject(request.getParameter("project_category"),
				request.getParameter("project_name"), request.getParameter("short_des"), request.getParameter("price"),
				request.getParameter("date"), request.getParameter("project_goal"), request.getParameter("long_des"));

		response.getWriter().write(outputString);

	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map paras = getParasMap(request);

		String outputString = projectObj.updateProject(
				paras.get("projectID").toString(),
				paras.get("project_category").toString(), 
				paras.get("project_name").toString(),
				paras.get("short_des").toString(), 
				paras.get("price").toString(), 
				paras.get("date").toString(),
				paras.get("project_goal").toString(), 
				paras.get("long_des").toString());

		response.getWriter().write(outputString);

	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		String output = projectObj.deleteProject(paras.get("projectID").toString());
		response.getWriter().write(output);

		
	}

	private Map getParasMap(HttpServletRequest request) {

		Map<String, String> map = new HashMap<String, String>();

		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ?

					scanner.useDelimiter("\\A").next() : "";
			scanner.close();

			String[] params = queryString.split("&");
			for (String param : params) {
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {

		}
		return map;
	}

}
