package com.ssafy.trip.member.service;

import com.ssafy.trip.member.model.MemberDto;

public interface MemberService {
	boolean login(String id,String pw);
	boolean signup(MemberDto memberDto);
	boolean modify(MemberDto memberDto);
	boolean resign(String id);
	MemberDto getUserInfo(String id);
}
