package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.UploadVO;

public class UploadDAO {

	// 1. 
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@mydb.cpdg3ism84pj.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "scott";
	String password = "tigertiger1";
	Connection conn = null;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	// 2. 기본 생성자
	public UploadDAO() {
		
		// 데이터 최적화
		Context initContext;
		
			try {
				initContext = new InitialContext();
				Context envContext = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/myrds");
				// Connection conn = ds.getConnection();
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
			
		/*
		 * try { // Class 클래스는 JVM에서 동작할 클래스들의 정보를 묘사하는 일종의 메타 클래스(Meta-Class)
		 * Class.forName(driver); conn = DriverManager.getConnection(url, user,
		 * password); } catch (ClassNotFoundException e) {
		 * System.out.println("드라이버 로딩실패"); } catch (SQLException e) {
		 * System.out.println("db연결 실패"); }
		 */
	} // uploadDAO() end

	
	public ArrayList<UploadVO> getAll(){
		sb.setLength(0);
		sb.append("SELECT show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4 ");
		sb.append("FROM show ");
		ArrayList<UploadVO> list = new ArrayList<UploadVO>();
		
		try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sb.toString());
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			int show_no = rs.getInt("show_no");
			String show_name = rs.getString("show_name");
			String show_writer = rs.getString("show_writer");
			String startday = rs.getString("startday");
			String endday = rs.getString("endday");
			String show_place = rs.getString("show_place");
			int show_price = rs.getInt("show_price");
			String show_detail = rs.getString("show_detail");
			String show_agelimit = rs.getString("show_agelimit");
			String main_img = rs.getString("main_img");
			String sub_img1 = rs.getString("sub_img1");
			String sub_img2 = rs.getString("sub_img2");
			String sub_img3 = rs.getString("sub_img3");
			String sub_img4 = rs.getString("sub_img4");
		
			UploadVO vo = new UploadVO(show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
			list.add(vo);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public UploadVO getOne(int show_no) {
			sb.setLength(0);
			sb.append("SELECT show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4 ");
			sb.append("FROM show ");
			UploadVO vo = null;
			
			try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			rs.next();
			
				String show_name = rs.getString("show_name");
				String show_writer = rs.getString("show_writer");
				String startday = rs.getString("startday");
				String endday = rs.getString("endday");
				String show_place = rs.getString("show_place");
				int show_price = rs.getInt("show_price");
				String show_detail = rs.getString("show_detail");
				String show_agelimit = rs.getString("show_agelimit");
				String main_img = rs.getString("main_img");
				String sub_img1 = rs.getString("sub_img1");
				String sub_img2 = rs.getString("sub_img2");
				String sub_img3 = rs.getString("sub_img3");
				String sub_img4 = rs.getString("sub_img4");
				vo = new UploadVO(show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
			
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vo;
		} // getOne() end

	public void insertOne(UploadVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO show ");
		sb.append("VALwUES ( file_fno_seq.nextval, ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )");

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getShow_name());
			pstmt.setString(2, vo.getShow_writer());
			pstmt.setString(3, vo.getStartday());
			pstmt.setString(4, vo.getEndday());
			pstmt.setString(5, vo.getShow_place());
			pstmt.setInt(6, vo.getShow_price());
			pstmt.setString(7, vo.getShow_detail());
			pstmt.setString(8, vo.getShow_agelimit());
			pstmt.setString(9, vo.getMain_img());
			pstmt.setString(10, vo.getSub_img1());
			pstmt.setString(11, vo.getSub_img2());
			pstmt.setString(12, vo.getSub_img3());
			pstmt.setString(13, vo.getSub_img4());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // insertOne(vo) end

	public void deleteOne(int show_no) {
		sb.setLength(0);
		sb.append("DELETE show ");
		sb.append("WHERE show_no =? ");

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, show_no);
			pstmt.executeUpdate();

			conn.close(); // 자원반납
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
		
	} // insertOne(vo) end


	// 리턴 할 필요 없으니 void 선언
	public void deleteList(String[] array) {
		// 배열에서 요소 한 개를 꺼내기
		for(String x : array) {
		// 꺼낸 값을 숫자로 형변환
			int no = Integer.parseInt(x);
			deleteOne(no);
		}
		}
	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
