package com.ssafy.trip.member.model.dao;
import com.ssafy.trip.member.model.MemberDto;

public interface MemberDao {
	boolean login(String id,String pw);
	boolean signup(MemberDto memberDto);
	boolean modify(MemberDto memberDto);
	boolean resign(String id);
	MemberDto getUserInfo(String id);
}
