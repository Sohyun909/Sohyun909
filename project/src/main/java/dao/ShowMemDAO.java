package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.ShowMemVO;

public class ShowMemDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@mydb.cpdg3ism84pj.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	String user = "scott";
	String password = "tigertiger1";
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	DataSource ds = null;
	
	public ShowMemDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myrds");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 회원가입
	public void insertOne(ShowMemVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO show_member ");
		sb.append("VALUES (showmem_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, 0, null, 0, ? )");
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getBirth());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getName());
			
			pstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// id 중복확인
	public boolean checkingId (String id) {
		sb.setLength(0);
		sb.append("SELECT id ");
		sb.append("FROM show_member ");
		sb.append("WHERE id = ? ");
		boolean existedId = false;
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				existedId = true;
			}else {
				existedId = false;
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return existedId;
	}
	
	// 사용자 존재여부 확인
	public ShowMemVO checkingUser(String id, String pwd) {
		sb.setLength(0);
		sb.append("SELECT id, pwd ");
		sb.append("FROM show_member ");
		sb.append("WHERE id = ? and pwd = ? ");
		ShowMemVO vo = null;
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new ShowMemVO();
				vo.setId(id);
				vo.setPwd(pwd);
			}else {
				System.out.println("아이디 및 비밀번호를 재확인하세요");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
}
