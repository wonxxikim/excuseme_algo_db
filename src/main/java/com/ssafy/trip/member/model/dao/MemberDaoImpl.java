package com.ssafy.trip.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.dbUtil.DButil;
import com.ssafy.trip.member.model.MemberDto;

public class MemberDaoImpl implements MemberDao{
	private MemberDaoImpl() {};
	private static MemberDaoImpl instance = new MemberDaoImpl();
	public static MemberDaoImpl getInstance() {
		return instance;
	}
	@Override
	public boolean login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto memberDto = new MemberDto();
		try {
			conn = DButil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("select user_id from user "
					+ "where user_id = ? and password = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String tmp = rs.getString("user_id");
				if(tmp!="")return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DButil.getInstance().close(rs,pstmt,conn);
		}
		return false;
		
	}
	@Override
	public boolean signup(MemberDto memberDto) {;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DButil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("insert into user (user_id, password, email, phone, role, name)");
			sql.append("values (?,?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,memberDto.getUser_id());
			pstmt.setString(2,memberDto.getPassword());
			pstmt.setString(3,memberDto.getEmail());
			pstmt.setString(4,memberDto.getPhone());
			pstmt.setString(5,memberDto.getRole());
			pstmt.setString(6,memberDto.getName());

			System.out.println("s : "+pstmt.toString());
			
			pstmt.executeUpdate();
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DButil.getInstance().close(pstmt,conn);
		}
		return false;
	}
	@Override
	public boolean modify(MemberDto memberDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DButil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("update user set password = ?,email = ?, phone=? where user_id = ?");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberDto.getPassword());
			pstmt.setString(2, memberDto.getEmail());
			pstmt.setString(3, memberDto.getPhone());
			pstmt.setString(4, memberDto.getUser_id());

			
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public boolean resign(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DButil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("delete from user where user_id=?");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public MemberDto getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto member = new MemberDto();
		try {
			conn = DButil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("select user_id, name, password, email, phone, role from user where user_id = ?");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member.setUser_id(rs.getString("user_id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
}
