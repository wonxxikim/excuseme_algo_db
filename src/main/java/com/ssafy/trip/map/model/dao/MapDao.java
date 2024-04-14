package com.ssafy.trip.map.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.trip.map.model.MapDto;

public interface MapDao {
	List<MapDto> getAllAreaList() throws SQLException;
	List<MapDto> getAllList(String sido_code) throws SQLException;
	List<MapDto> getContentList(String sido_code, String content_type_id) throws SQLException;
}
