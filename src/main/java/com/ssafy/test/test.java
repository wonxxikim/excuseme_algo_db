package com.ssafy.test;

import java.sql.SQLException;

import com.ssafy.trip.map.model.MapDto;
import com.ssafy.trip.map.model.dao.MapDao;
import com.ssafy.trip.map.model.dao.MapDaoImpl;


public class test {

	public static void main(String[] args) throws SQLException {
		MapDao md = MapDaoImpl.getMapDao();
		System.out.println("지역별 검색 결과 (10개)");
		for(MapDto cur : md.getAllList("부산")) {
			System.out.println(cur.toString());
		}
		System.out.println("지역, 타입별 검색 결과(10개)");
		for(MapDto cur : md.getContentList("부산","12")) {
			System.out.println(cur.toString());
		}
		
	}

}
