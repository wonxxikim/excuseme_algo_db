package com.ssafy.trip.map.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dbUtil.DButil;
import com.ssafy.trip.map.model.MapDto;

public class MapDaoImpl implements MapDao {

	private static MapDao mapDao = new MapDaoImpl();
	private static DButil dbUtil;
	private MapDaoImpl() {
		dbUtil = DButil.getInstance();
	};
	public static MapDao getMapDao() {
		return mapDao;
	}
	
	@Override
	public List<MapDto> getAllList(String loc) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MapDto> list = new ArrayList<>();
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder("select * from tour \n");
			sql.append("where addr like '%"+loc+"%'");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setName(rs.getString("name"));
				mapDto.setAddr(rs.getString("addr"));
				mapDto.setTel(rs.getString("tel"));
				mapDto.setImg(rs.getString("img"));
				mapDto.setType(rs.getString("type"));
				mapDto.setMap_x(rs.getFloat("map_x"));
				mapDto.setMap_y(rs.getFloat("map_y"));

				list.add(mapDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}

	@Override
	public List<MapDto> getContentList(String loc, String type) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MapDto> list = new ArrayList<>();
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder("select * from tour \n");
			sql.append("where addr like '%"+loc+"%' and type = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setName(rs.getString("name"));
				mapDto.setAddr(rs.getString("addr"));
				mapDto.setTel(rs.getString("tel"));
				mapDto.setImg(rs.getString("img"));
				mapDto.setType(rs.getString("type"));
				mapDto.setMap_x(rs.getFloat("map_x"));
				mapDto.setMap_y(rs.getFloat("map_y"));
				
				list.add(mapDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}
	@Override
	public List<MapDto> getAllAreaList() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MapDto> list = new ArrayList<>();
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder("select * from tour");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MapDto mapDto = new MapDto();
				mapDto.setName(rs.getString("name"));
				mapDto.setAddr(rs.getString("addr"));
				mapDto.setTel(rs.getString("tel"));
				mapDto.setImg(rs.getString("img"));
				mapDto.setType(rs.getString("type"));
				mapDto.setMap_x(rs.getFloat("map_x"));
				mapDto.setMap_y(rs.getFloat("map_y"));
				
				list.add(mapDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return list;
	}

}
