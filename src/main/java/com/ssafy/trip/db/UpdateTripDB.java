/**
 * 
 */
package com.ssafy.trip.db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.ssafy.dbUtil.DButil;

public class UpdateTripDB {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaBasedList1"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=nFhFOGxQE8IEkx4ZLuIMOGL9XEg%2Bzhxc2%2BK3Bl%2FfF8woFKQSXtW9KybG%2Bg8F593hJXGLw9USKI9vEzbnX6np7w%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8"));
        
        for(int pageNum = 1; pageNum<=52;pageNum++) {
			StringBuilder urlTmp = new StringBuilder(urlBuilder.toString());
			urlTmp.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNum), "UTF-8")); /*페이지번호*/
		
	        URL url = new URL(urlTmp.toString());
	        System.out.println(urlTmp.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	       Connection sqlConn = null;
	       PreparedStatement pstmt = null;
	       System.out.println(urlTmp.toString());
	        try {
	        	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(new InputSource(new StringReader(sb.toString())));
				NodeList nodeList = document.getElementsByTagName("item");
				sqlConn = DButil.getInstance().getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("insert into tour (name,addr,tel,img,type,map_x,map_y) \n");
				sql.append("values (?,?,?,?,?,?,?)");
				pstmt = sqlConn.prepareStatement(sql.toString());
				int len = nodeList.getLength();
				for(int i=0;i<len;i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType()==Node.ELEMENT_NODE) {
						Element element = (Element) node;
						System.out.println("---------------------------------------------");
						System.out.println();
						System.out.println("관광지 : " + element.getElementsByTagName("title").item(0).getTextContent());
						System.out.println("관광지 장소 1 : " + element.getElementsByTagName("addr1").item(0).getTextContent());
						System.out.println("관광지 장소 2 : " + element.getElementsByTagName("contenttypeid").item(0).getTextContent());
						System.out.println("전화번호 : " + element.getElementsByTagName("tel").item(0).getTextContent());
						System.out.println("이미지 : " + element.getElementsByTagName("firstimage").item(0).getTextContent());
						pstmt.setString(1,element.getElementsByTagName("title").item(0).getTextContent());
						pstmt.setString(2,element.getElementsByTagName("addr1").item(0).getTextContent());
						pstmt.setString(3,element.getElementsByTagName("tel").item(0).getTextContent());
						pstmt.setString(4,element.getElementsByTagName("firstimage").item(0).getTextContent());
						pstmt.setString(5,element.getElementsByTagName("contenttypeid").item(0).getTextContent());
						pstmt.setString(6,element.getElementsByTagName("mapx").item(0).getTextContent());
						pstmt.setString(7,element.getElementsByTagName("mapy").item(0).getTextContent());
						pstmt.executeUpdate();
					}
				}
				
				
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			} catch(SAXException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        
        }
    }
}