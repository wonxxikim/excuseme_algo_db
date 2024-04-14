package com.ssafy.dbUtil;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.trip.map.model.MapDto;

public class Obj2Json {
	ObjectMapper mapper;
	
	public Obj2Json() {
		super();
		this.mapper = new ObjectMapper();
	}
	
	public String work(List<MapDto> objList) {
		String json = "";
		try {
			json = this.mapper.writeValueAsString(objList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
