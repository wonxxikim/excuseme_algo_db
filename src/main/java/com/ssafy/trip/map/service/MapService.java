package com.ssafy.trip.map.service;

import java.util.List;

import com.ssafy.trip.map.model.MapDto;

public interface MapService {
	List<MapDto> getAllAreaList() throws Exception;
	List<MapDto> getAllList(String sido_code) throws Exception;
	List<MapDto> getContentList(String sido_code, String content_type_id) throws Exception;
}
