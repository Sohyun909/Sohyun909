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

import vo.NoticeVO;
import vo.ShowMemVO;

public class NoticeDAO {
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	DataSource ds;
	public NoticeDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myrds");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<NoticeVO> selectAll(int startNo, int endNo){
		sb.setLength(0);
		sb.append("select rn, notice_no, category, notice_title, notice_detail, notice_writer, notice_date, notice_hits, showmem_no ");
		sb.append("from (select rownum rn, notice_no, category, notice_title, notice_detail, notice_writer, to_char(notice_date, 'yyyy/mm/dd') notice_date, notice_hits, showmem_no ");
		sb.append("from (select notice_no, category, notice_title, notice_detail, notice_writer, notice_date, notice_hits, showmem_no from notice_board order by notice_no desc) ");
		sb.append("where rownum <= ? ) ");
		sb.append("where rn >= ? ");
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int noticeNo = rs.getInt("notice_no");
				String category = rs.getString("category");
				String noticeTitle = rs.getString("notice_title");
				String noticeDetail = rs.getString("notice_detail");
				String noticeWriter = rs.getString("notice_writer");
				String noticeDate = rs.getString("notice_date");
				int noticeHits = rs.getInt("notice_hits");
				int showMemNO = rs.getInt("showmem_no");
				list.add(new NoticeVO(noticeNo, category, noticeTitle, noticeDetail, noticeWriter, noticeDate, noticeHits, showMemNO));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 총 게시글 수
	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM notice_board ");
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
	
	// 게시글 번호에 해당하는 정보
	public ArrayList<NoticeVO> getOne(int notice_no){
		sb.setLength(0);
		sb.append("SELECT notice_no, category, notice_title, notice_detail, notice_writer, to_char(notice_date, 'yyyy/mm/dd') notice_date, notice_hits, showmem_no ");
		sb.append("FROM notice_board WHERE notice_no = ? ");
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, notice_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String category = rs.getString("category");
				String noticeTitle = rs.getString("notice_title");
				String noticeDetail = rs.getString("notice_detail");
				String noticeWriter = rs.getString("notice_writer");
				String noticeDate = rs.getString("notice_date");
				int noticeHits = rs.getInt("notice_hits");
				int showMemNO = rs.getInt("showmem_no");
				list.add(new NoticeVO(notice_no, category, noticeTitle, noticeDetail, noticeWriter, noticeDate, noticeHits, showMemNO));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	// list 삭제
	public void deleteList(String[] cList) {
		int list = 0;
		for(String x : cList) {
			list = Integer.parseInt(x);
		
			sb.setLength(0);
			sb.append("DELETE notice_board ");
			sb.append("WHERE notice_no = ? ");
		
			try {
				Connection conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, list);
				pstmt.executeUpdate();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 조회수 증가
	public void raiseHits(int notice_no) {
		sb.setLength(0);
		sb.append("UPDATE notice_board ");
		sb.append("SET notice_hits = notice_hits+1 ");
		sb.append("WHERE notice_no = ? ");
		
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
	
	// 알림게시글 작성 
	public void insertOne(String category, String title, String detail, String writer, int showmem_no) {
		sb.setLength(0);
		sb.append("INSERT INTO notice_board ");
		sb.append("VALUES (notice_no_seq.nextval , ?, ?, ?, ?, sysdate, 0, ? )" );
		
		try {
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, category);
			pstmt.setString(2, title);
			pstmt.setString(3, detail);
			pstmt.setString(4, writer);
			pstmt.setInt(5, showmem_no);
			pstmt.executeUpdate();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
