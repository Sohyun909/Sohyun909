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

import vo.BookingVO;
import vo.CardVO;
import vo.ShowVO;

public class BookingDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@mydb.cpdg3ism84pj.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	String user = "scott";
	String password = "tigertiger1";

	StringBuffer sb = new StringBuffer();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;

	public BookingDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/myrds");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자 BookingDAO() End

	// 회원 번호 조회
	public int sessionID(String id) {
		sb.setLength(0);

		sb.append("SELECT showmem_no ");
		sb.append("FROM show_member ");
		sb.append("WHERE id = ? ");

		int showmem_no = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				showmem_no = rs.getInt("showmem_no");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return showmem_no;
	}
	
	// 회원 예약번호 조회
	// 회원 번호 조회
	public int sessionID2(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no ");
		sb.append("FROM show_member ");
		sb.append("WHERE showmem_no = ? ");

		int	book_no = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				book_no = rs.getInt("book_no");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book_no;
	}
	
	// 예약번호 가져오기 booking
	public ArrayList<BookingVO> booknoAll(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no , book_price , to_char(book_date , 'yyyy/mm/dd') book_date , pax , status , show_no , showmem_no , card_no ");
		sb.append("FROM booking ");
		sb.append("WHERE showmem_no = ? ");
		
		ArrayList<BookingVO> list = new ArrayList<BookingVO>();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int book_no = rs.getInt("book_no");
				int book_price = rs.getInt("book_price");
				String book_date = rs.getString("book_date");
				int pax = rs.getInt("pax");
				int status = rs.getInt("status");
				int show_no = rs.getInt("show_no");
				String card_no = rs.getString("card_no");

				BookingVO vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
				list.add(vo);
			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// CheckAll() End
	
	
	

	// 한건만 조회
	public BookingVO SeletOne(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no , book_price , book_date , pax , status , show_no , showmem_no , card_no ");
		sb.append("FROM booking ");
		sb.append("WHERE showmem_no = ? ");
		BookingVO vo = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int book_no = rs.getInt("book_no");
				int book_price = rs.getInt("book_price");
				String book_date = rs.getString("book_date");
				int pax = rs.getInt("pax");
				int status = rs.getInt("status");
				int show_no = rs.getInt("show_no");
				String card_no = rs.getString("card_no");

				vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	} // SeletOne(int showmem_no) End

	// 전시중
	public ArrayList<ShowVO> OnExhibitionAll() {
		sb.setLength(0);

		sb.append(
				"SELECT show_no , show_name , show_writer , to_char(startday,'yyyy/mm/dd') startday , to_char(endday,'yyyy/mm/dd') endday , show_place , show_price , show_detail , show_agelimit , main_img , sub_img1 , sub_img2 , sub_img3 , sub_img4 ");
		sb.append("FROM show ");
		sb.append("WHERE to_char(sysdate, 'yyyy/mm/dd') <= to_char(endday, 'yyyy/mm/dd') ");
		sb.append("order by startday asc ");

		ArrayList<ShowVO> list = new ArrayList<ShowVO>();

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

				ShowVO vo = new ShowVO(show_no, show_name, show_writer, startday, endday, show_place, show_price,
						show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
				list.add(vo);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 전시 예정

	// 예약 조회
	public ArrayList<BookingVO> CheckAll(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no , book_price , to_char(book_date , 'yyyy/mm/dd') book_date , pax , status , show_no , showmem_no , card_no ");
		sb.append("FROM booking ");
		sb.append("WHERE to_char(sysdate, 'yyyy/mm/dd') <= to_char(book_date , 'yyyy/mm/dd') ");
		sb.append("AND showmem_no = ? ");
		sb.append("AND status = 1 ");
		sb.append("order by book_date asc ");

		ArrayList<BookingVO> list = new ArrayList<BookingVO>();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int book_no = rs.getInt("book_no");
				int book_price = rs.getInt("book_price");
				String book_date = rs.getString("book_date");
				int pax = rs.getInt("pax");
				int status = rs.getInt("status");
				int show_no = rs.getInt("show_no");
				String card_no = rs.getString("card_no");

				BookingVO vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
				list.add(vo);
			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// CheckAll() End

	// 지난 예약 조회
	public ArrayList<BookingVO> middleAll(int showmem_no) {
		sb.setLength(0);

		sb.append(
				"SELECT book_no , book_price , to_char(book_date , 'yyyy/mm/dd') book_date , pax , status , show_no , showmem_no , card_no ");
		sb.append("FROM booking ");
		sb.append("WHERE to_char(sysdate, 'yyyy/mm/dd') > to_char(book_date , 'yyyy/mm/dd') ");
		sb.append("AND showmem_no = ? ");
		sb.append("AND status = 1 ");
		sb.append("order by book_date asc ");

		ArrayList<BookingVO> list = new ArrayList<BookingVO>();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int book_no = rs.getInt("book_no");
				int book_price = rs.getInt("book_price");
				String book_date = rs.getString("book_date");
				int pax = rs.getInt("pax");
				int status = rs.getInt("status");
				int show_no = rs.getInt("show_no");
				String card_no = rs.getString("card_no");

				BookingVO vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
				list.add(vo);
			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// pastAll() End
	
	// 취소 내역 조회
		public ArrayList<BookingVO> pastAll(int showmem_no) {
			sb.setLength(0);

			sb.append("SELECT book_no , book_price , to_char(book_date , 'yyyy/mm/dd') book_date , pax , status , show_no , showmem_no , card_no ");
			sb.append("FROM booking ");
			sb.append("WHERE showmem_no = ? ");
			sb.append("AND status= 0 ");
			sb.append("order by book_date asc ");

			ArrayList<BookingVO> list = new ArrayList<BookingVO>();

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, showmem_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					int book_no = rs.getInt("book_no");
					int book_price = rs.getInt("book_price");
					String book_date = rs.getString("book_date");
					int pax = rs.getInt("pax");
					int status = rs.getInt("status");
					int show_no = rs.getInt("show_no");
					String card_no = rs.getString("card_no");

					BookingVO vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
					list.add(vo);
				}
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}// pastAll() End
	

	// 예약 한건 조회
	public BookingVO CheckOne(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no , book_price , book_date , pax , status , show_no , showmem_no , card_no ");
		sb.append("FROM booking ");
		sb.append("WHERE showmem_no = ? ");
		sb.append("AND to_char(sysdate, 'yyyy/mm/dd') > to_char(book_date , 'yyyy/mm/dd') ");
		sb.append("order by book_date asc ");

		BookingVO vo = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int book_no = rs.getInt("book_no");
				int book_price = rs.getInt("book_price");
				String book_date = rs.getString("book_date");
				int pax = rs.getInt("pax");
				int status = rs.getInt("status");
				int show_no = rs.getInt("show_no");
				String card_no = rs.getString("card_no");

				vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
			}
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	} // SeletOne(int showmem_no) End

	// 예약 추가
	public void insertOne(BookingVO vo) {

		sb.setLength(0);
		sb.append("INSERT INTO booking ");
		sb.append("VALUES (BOOK_NO_SEQ.NEXTVAL, ? , to_date(?) , ? , 1 , ? , ? , ? ) ");

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getBook_price());
			pstmt.setString(2, vo.getBook_date());
			pstmt.setInt(3, vo.getPax());
			pstmt.setInt(4, vo.getShow_no());
			pstmt.setInt(5, vo.getShowmem_no());
			pstmt.setString(6, vo.getCard_no());

			pstmt.executeUpdate();

			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // insertOne End

	// 예약 취소 상태값 변경
	public int updateOne(int book_no) {
		sb.setLength(0);

		sb.append("UPDATE booking ");
		sb.append("SET status = 0  ");
		sb.append("WHERE book_no = ? ");

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, book_no);

			pstmt.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book_no;

	}// updateOne End

	// show 테이블 조회
	public ShowVO selectOne(int ShowNo) {
		sb.setLength(0);

		sb.append("SELECT show_no , show_name , show_writer , startday , endday , show_place , show_price , show_detail , show_agelimit , main_img , sub_img1 , sub_img2 , sub_img3 , sub_img4  ");
		sb.append("FROM show ");
		sb.append("WHERE show_no = ? ");

		ShowVO vo = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, ShowNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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

				vo = new ShowVO(ShowNo, show_name, show_writer, startday, endday, show_place, show_price, show_detail,
						show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	/*
	 * // 총 금액 public int TotalPrice(int ShowNo) { sb.setLength(0);
	 * sb.append("SELECT b.pax * s.show_price book_price ");
	 * sb.append("FROM booking b , show s "); sb.append("WHERE s.show_no = ? ");
	 * 
	 * int book_price = 0;
	 * 
	 * try { conn = ds.getConnection(); pstmt =
	 * conn.prepareStatement(sb.toString()); pstmt.setInt(1, ShowNo);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { int pax = rs.getInt("pax"); int show_price =
	 * rs.getInt("show_price"); } conn.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } return book_price; }
	 */

	// 전시회 금액 구해오기
	public int ShowPri(int ShowNo) {
		sb.setLength(0);

		sb.append("SELECT show_price ");
		sb.append("FROM show ");
		sb.append("WHERE show_no = ? ");

		int show_price = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, ShowNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				show_price = rs.getInt("show_price");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return show_price;
	}

	// show 테이블 전체조회
	public ArrayList<ShowVO> getAll(int ShowNo) {
		sb.setLength(0);
		sb.append("SELECT show_no , show_name , show_writer . startday , endday , show_place , show_price , show_detail , show_agelimit , main_img , sub_img1 , sub_img2 , sub_img3 , sub_img4  ");
		sb.append("FROM show ");
		sb.append("where show_no = ? ");

		ArrayList<ShowVO> list = new ArrayList<ShowVO>();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
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
				
				ShowVO vo = new ShowVO(ShowNo, show_name, show_writer, startday, endday, show_place, ShowNo, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
				
				list.add(vo);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} // getAll() End
	
	// 카드 잔액 구해오기
	public int cardlimit(String card_no) {
		sb.setLength(0);

		sb.append("SELECT card_cash ");
		sb.append("FROM card ");
		sb.append("WHERE card_no = ? ");

		int card_cash = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, card_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				card_cash = rs.getInt("card_cash");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return card_cash;
	}
	

	// 카드 잔액 변경
	public void updateOne(CardVO vo) {
		sb.setLength(0);

		sb.append("UPDATE card ");
		sb.append("SET card_cash = ? ");
		sb.append("WHERE card_no = ? ");
		sb.append("AND cvc = ? ");
		sb.append("AND card_pw = ? ");

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getCard_cash());
			pstmt.setString(2, vo.getCard_no());
			pstmt.setInt(3, vo.getCvc());
			pstmt.setString(4, vo.getCard_pw());

			pstmt.executeUpdate();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 카드 잔액 환불
		public void refundOne(CardVO vo) {
			sb.setLength(0);

			sb.append("UPDATE card ");
			sb.append("SET card_cash = ? ");
			sb.append("WHERE card_no = ? ");

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getCard_cash());
				pstmt.setString(2, vo.getCard_no());

				pstmt.executeUpdate();
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	
	
	// 회원 번호로 예약번호 가져오기
	public int bookingNo(int showmem_no) {
		sb.setLength(0);

		sb.append("SELECT book_no ");
		sb.append("FROM booking ");
		sb.append("WHERE showmem_no = ? ");
		
		int book_no = 0;
			
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, showmem_no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				book_no = rs.getInt("book_no");
			}
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return book_no;
	}
	
	// 예약번호로 값 구하기
		public BookingVO bookNoOne(int book_no) {
			sb.setLength(0);

			sb.append("SELECT book_no , book_price , book_date , pax , status , show_no , showmem_no , card_no ");
			sb.append("FROM booking ");
			sb.append("WHERE book_no = ? ");
			BookingVO vo = null;

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, book_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					int book_price = rs.getInt("book_price");
					String book_date = rs.getString("book_date");
					int pax = rs.getInt("pax");
					int status = rs.getInt("status");
					int show_no = rs.getInt("show_no");
					int showmem_no = rs.getInt("showmem_no");
					String card_no = rs.getString("card_no");

					vo = new BookingVO(book_no, book_price, book_date, pax, status, show_no, showmem_no, card_no);
				}
				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return vo;
		} // SeletOne(int showmem_no) End
		
		// show 테이블 조인
		public ShowVO showJoin(int show_no) {
			sb.setLength(0);
			
			sb.append("SELECT * ");
			sb.append("FROM show ");
			sb.append("WHERE show_no = ? ");
			
			ShowVO vo = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, show_no);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
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
					
					vo = new ShowVO(show_no, show_name, show_writer, startday, endday, show_place, show_price, show_detail, show_agelimit, main_img, sub_img1, sub_img2, sub_img3, sub_img4);
				}
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			return vo;
		}
	

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// close End

}
