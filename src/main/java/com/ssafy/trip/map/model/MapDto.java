package com.ssafy.trip.map.model;

public class MapDto {
	private int id;
	private String name;
	private String title;
	private String addr;
	private String tel;
	private String img;
	private String type;
	private float map_x;
	private float map_y;
	
	public MapDto() {
	}
	
	public MapDto(String name, String title, String addr, String tel, String img, String type, float map_x,
			float map_y) {
		this.name = name;
		this.title = title;
		this.addr = addr;
		this.tel = tel;
		this.img = img;
		this.type = type;
		this.map_x = map_x;
		this.map_y = map_y;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getMap_x() {
		return map_x;
	}
	public void setMap_x(float map_x) {
		this.map_x = map_x;
	}
	public float getMap_y() {
		return map_y;
	}
	public void setMap_y(float map_y) {
		this.map_y = map_y;
	}
	@Override
	public String toString() {
		return "MapDto [id=" + id + ", name=" + name + ", title=" + title + ", addr=" + addr + ", tel=" + tel + ", img="
				+ img + ", type=" + type + ", map_x=" + map_x + ", map_y=" + map_y + "]";
	}
	
	
	
	
}
