package com.ssafy.trip.map.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dbUtil.Obj2Json;
import com.ssafy.trip.map.model.MapDto;
import com.ssafy.trip.map.service.MapService;
import com.ssafy.trip.map.service.MapServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/map")
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MapService mapService;
	private Obj2Json o2j = new Obj2Json();
	
	@Override
	public void init() {
		mapService = MapServiceImpl.getMapService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		String json = "";
		if(action.equals("all")) {
			json = all(request, response);
		} else if(action.equals("content")) {
			json = content(request, response);
		} else if(action.equals("allArea")) {
			json = allArea(request, response);
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.print(json);
		out.flush();
	}

	private String allArea(HttpServletRequest request, HttpServletResponse response) {
		List<MapDto> list = new ArrayList<>();
		try {
			list = mapService.getAllAreaList();
//			System.out.println(list);
//			System.out.println(list.size());
			
			// object -> JSON
			String json = o2j.work(list);
//			System.out.println(json);

			return json;
		} catch (Exception e){
			e.printStackTrace();
			return "실패";
		}
	}

	private String all(HttpServletRequest request, HttpServletResponse response) {
		List<MapDto> list = new ArrayList<>();
//		int sido_code = Integer.parseInt(request.getParameter("sido_code"));
		String sido_code = request.getParameter("sido_code");
		try {
			list = mapService.getAllList(sido_code);
//			System.out.println(list);
//			System.out.println(list.size());
			
			// object -> JSON
			String json = o2j.work(list);
//			System.out.println(json);

			return json;
		} catch (Exception e){
			e.printStackTrace();
			return "실패";
		}
	}

	private String content(HttpServletRequest request, HttpServletResponse response) {
//		int sido_code = Integer.parseInt(request.getParameter("sido_code"));
//		int content_type_id = Integer.parseInt(request.getParameter("content_type_id"));
		String sido_code = request.getParameter("sido_code");
		String content_type_id = request.getParameter("content_type_id");
		List<MapDto> list = new ArrayList<>();
		try {			
			list = mapService.getContentList(sido_code, content_type_id);
//			System.out.println(list);
//			System.out.println(list.size());
			
			// object -> JSON
			String json = o2j.work(list);
//			System.out.println(json);
			
			
			return json;
		} catch (Exception e){
			e.printStackTrace();
			return "실패";
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
