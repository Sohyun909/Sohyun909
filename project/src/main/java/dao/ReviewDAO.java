package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import oracle.net.aso.s;
import vo.ReviewVO;
import vo.ShowMemVO;

public class ReviewDAO {
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	DataSource ds;
	public ReviewDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myrds");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReviewVO> selectAll(int startNo, int endNo){
		sb.setLength(0);
		sb.append("select rn, review_no, main_img, review_title, review_detail, review_writer, review_date, review_hits, review_rate, showmem_no ");
		sb.append("from (select rownum rn, review_no, main_img, review_title, review_detail, review_writer, to_char(review_date, 'yyyy/mm/dd') review_date, review_hits, review_rate, showmem_no ");
		sb.append("from (select review_no, main_img, review_title, review_detail, review_writer, review_date, review_hits, review_rate, showmem_no from review order by review_no desc) ");
		sb.append("where rownum <= ? ) ");
		sb.append("where rn >= ? ");
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int review_no = rs.getInt("review_no");
				String main_img = rs.getString("main_img");
				String review_title = rs.getString("review_title");
				String review_detail = rs.getString("review_detail");
				String review_writer = rs.getString("review_writer");
				String review_date = rs.getString("review_date");
				int review_hits = rs.getInt("review_hits");
				float review_rate = rs.getFloat("review_rate");
				int showmem_no = rs.getInt("showmem_no");
				list.add(new ReviewVO(review_no, main_img, review_title, review_detail, review_writer, review_date, review_hits, review_rate, showmem_no));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 게시글 번호에 해당하는 정보
	public ArrayList<ReviewVO> getOne(int review_no){
		sb.setLength(0);
		sb.append("SELECT review_no, main_img, review_title, review_detail, review_writer, to_char(review_date, 'yyyy/mm/dd') review_date, review_hits, review_rate, showmem_no from review ");
		sb.append("WHERE review_no = ? ");
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, review_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String main_img = rs.getString("main_img");
				String review_title = rs.getString("review_title");
				String review_detail = rs.getString("review_detail");
				String review_writer = rs.getString("review_writer");
				String review_date = rs.getString("review_date");
				int review_hits = rs.getInt("review_hits");
				float review_rate = rs.getFloat("review_rate");
				int showmem_no = rs.getInt("showmem_no");
				list.add(new ReviewVO(review_no, main_img, review_title, review_detail, review_writer, review_date, review_hits, review_rate, showmem_no));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 조회수 증가
	public void raiseHits(int notice_no) {
		sb.setLength(0);
		sb.append("UPDATE review ");
		sb.append("SET review_hits = review_hits+1 ");
		sb.append("WHERE review_no = ? ");
		
		try {
			Connection conn= ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, notice_no);
			pstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 총 게시글 수
	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM review ");
		int count = 0;
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	// 후기게시판 사진이미지에 해당하는 전시회명
	public String getShowName(String main_img) {
		sb.setLength(0);
		sb.append("SELECT show_name FROM show WHERE main_img = ? ");
		String show_name = "";
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, main_img);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			show_name = rs.getString("show_name");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return show_name;
	}
	
	// 후기게시판 전시회명에 해당하는 사진이미지
	public String getShowImg(String show_name) {
		sb.setLength(0);
		sb.append("SELECT main_img FROM show WHERE show_name = ? ");
		String main_img = "";
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, show_name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				main_img = rs.getString("main_img");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return main_img;
	}
	
	// 리뷰 수정
	public void updateReview(String title, String detail, int rate, int reviewNo) {
		sb.setLength(0);
		sb.append("UPDATE review ");
		sb.append("SET review_title = ?, review_detail = ?, review_rate = ? ");
		sb.append("WHERE review_no = ? ");
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, title);
			pstmt.setString(2, detail);
			pstmt.setInt(3, rate);
			pstmt.setInt(4, reviewNo);
			pstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 리뷰 삭제
	public void deleteReview(int review_no) {
		sb.setLength(0);
		sb.append("DELETE review WHERE review_no = ? ");
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, review_no);
			pstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 현재 접속중인 아이디에 해당하는 회원명과 회원번호
	public ArrayList<ShowMemVO> getMemeberInfo(String id){
		sb.setLength(0);
		sb.append("SELECT showmem_no, name ");
		sb.append("FROM show_member ");
		sb.append("WHERE id = ? ");
		ArrayList<ShowMemVO> list = new ArrayList<ShowMemVO>();
	
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int showmem_no = rs.getInt("showmem_no");
				String name = rs.getString("name");
				list.add(new ShowMemVO(showmem_no, "", id, "", "", "", "", "", 0, "", 0, name));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 관람후기 작성
	public void insertReview(String main_img, String title, String detail, String writer, int rate, int showMem_no) {
		sb.setLength(0);
		sb.append("INSERT INTO review ");
		sb.append("VALUES( review_no_seq.nextval , ?, ?, ?, ?, sysdate, 0, ?, ? ) ");
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, main_img);
			pstmt.setString(2, title);
			pstmt.setString(3, detail);
			pstmt.setString(4, writer);
			pstmt.setInt(5, rate);
			pstmt.setInt(6, showMem_no);
			pstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 현재 로그인되어있는 회원번호에 해당하는 전시번호 얻어오기(회원이 어떤어떤 전시회를 예약했는지 알기 위해서)
	public ArrayList<Integer> getShowNo(int showmem_no) {
		sb.setLength(0);
		sb.append("SELECT show_no FROM booking WHERE showmem_no = ? ");
		ArrayList<Integer> list = new ArrayList<Integer>(10);
			
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int show_no = rs.getInt("show_no");
				list.add(show_no);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
		
	// 회원이 관람한 전시회의 전시번호에 해당하는 전시회명 얻어오기
	public ArrayList<String> getShowName(ArrayList<Integer> showNo){
		ArrayList<String> list = new ArrayList<String>();
		for(Integer show_no : showNo) {
			sb.setLength(0);
			sb.append("SELECT show_name FROM show WHERE show_no = ? ");
			
			try {
				Connection conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, show_no);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					list.add(rs.getString("show_name"));
				}
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
}
