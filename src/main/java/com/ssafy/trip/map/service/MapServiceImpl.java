package com.ssafy.trip.map.service;

import java.util.List;

import com.ssafy.trip.map.model.MapDto;
import com.ssafy.trip.map.model.dao.MapDao;
import com.ssafy.trip.map.model.dao.MapDaoImpl;

public class MapServiceImpl implements MapService {

	private static MapService mapService = new MapServiceImpl();
	private MapDao mapDao;
	
	private MapServiceImpl() {
		mapDao = MapDaoImpl.getMapDao();
	};
	
	public static MapService getMapService() {
		return mapService;
	}
	
	@Override
	public List<MapDto> getAllList(String sido_code) throws Exception {
		return mapDao.getAllList(sido_code);
	}

	@Override
	public List<MapDto> getContentList(String sido_code, String content_type_id) throws Exception {
		return mapDao.getContentList(sido_code, content_type_id);
	}

	@Override
	public List<MapDto> getAllAreaList() throws Exception {
		return mapDao.getAllAreaList();
	}
	
}
