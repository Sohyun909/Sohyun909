package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import vo.ShowVO;


public class ShowDAO {

	public DataSource ds = null;
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ShowDAO() {

		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myrds");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// 전체 전시 조회
	public ArrayList<ShowVO> getAll(int startNum, int endNum) {
		sb.setLength(0);
		sb.append("SELECT rn, show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit"
				+ ", main_img, sub_img1, sub_img2, sub_img3, sub_img4 ");
		sb.append("FROM (SELECT rownum rn, show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit" 
				+ ", main_img, sub_img1, sub_img2, sub_img3, sub_img4 ");
		sb.append("FROM (SELECT show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit"
				+ ", main_img, sub_img1, sub_img2, sub_img3, sub_img4 FROM show ORDER BY show_no desc) ");
		sb.append("WHERE rownum <= ? ) ");
		sb.append("WHERE rn >= ? ");
		
		ArrayList<ShowVO> list = new ArrayList<ShowVO>();
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				int showNo = rs.getInt("show_no");
				String showName = rs.getString("show_name");
				String showWriter = rs.getString("show_writer");
				String startDay = rs.getString("startday");
				String endDay = rs.getString("endday");
				String showPlace = rs.getString("show_place");
				int showPrice = rs.getInt("show_price");
				String showDetail = rs.getString("show_detail");
				String showAgelimit = rs.getString("show_agelimit");
				String mainImg = rs.getString("main_img");
				String subImg1 = rs.getString("sub_img1");
				String subImg2 = rs.getString("sub_img2");
				String subImg3 = rs.getString("sub_img3");
				String subImg4 = rs.getString("sub_img4");
	
				ShowVO vo = new ShowVO(showNo, showName, showWriter, startDay, endDay, showPlace, showPrice, showDetail, showAgelimit, mainImg, subImg1, subImg2, subImg3, subImg4);
				list.add(vo);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 총 게시물
	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT count(*) cnt from show ");
		int cnt = 0;
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ShowVO getOne(int showNo) {
		sb.setLength(0);
		sb.append("SELECT show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit"
				+ ", main_img, sub_img1, sub_img2, sub_img3, sub_img4 FROM show ");
		sb.append("WHERE show_no = ? ");
		ShowVO vo = null;
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showNo);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String showName = rs.getString("show_name");
			String showWriter = rs.getString("show_writer");
			String startDay = rs.getString("startday");
			String endDay = rs.getString("endday");
			String showPlace = rs.getString("show_place");
			int showPrice = rs.getInt("show_price");
			String showDetail = rs.getString("show_detail");
			String showAgelimit = rs.getString("show_agelimit");
			String mainImg = rs.getString("main_img");
			String subImg1 = rs.getString("sub_img1");
			String subImg2 = rs.getString("sub_img2");
			String subImg3 = rs.getString("sub_img3");
			String subImg4 = rs.getString("sub_img4");
			
			vo = new ShowVO(showNo, showName, showWriter, startDay, endDay, showPlace, showPrice, showDetail, showAgelimit, mainImg, subImg1, subImg2, subImg3, subImg4)
					;
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getShowNo (String search) {
		sb.setLength(0);
		sb.append("SELECT show_no ");
		sb.append("FROM show ");
		sb.append("WHERE show_name like ? ");
		
		int result = 0;
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + search +"%");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				ShowVO vo = new ShowVO();
				vo.setShowNo(rs.getInt("show_no"));
				result = vo.getShowNo();
			}else {
				result = 0;
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
