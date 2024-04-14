package com.ssafy.trip.member.service;

import com.ssafy.trip.member.model.MemberDto;
import com.ssafy.trip.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService{
	private MemberServiceImpl() {};
	private static MemberServiceImpl instance = new MemberServiceImpl();
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	@Override
	public boolean login(String id, String pw) {
		return MemberDaoImpl.getInstance().login(id, pw);
	}
	@Override
	public boolean signup(MemberDto memberDto) {
		return MemberDaoImpl.getInstance().signup(memberDto);
	}

	@Override
	public boolean modify(MemberDto memberDto) {
		return MemberDaoImpl.getInstance().modify(memberDto);
	}
	@Override
	public boolean resign(String id) {
		return MemberDaoImpl.getInstance().resign(id);
	}
	@Override
	public MemberDto getUserInfo(String id) {
		return MemberDaoImpl.getInstance().getUserInfo(id); 
	}
	
}
