package bookcart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MessageMgr {
	private DBConnectionMgr pool;
	private static final String ENCTYPE = "utf-8";
	
	public MessageMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//message 저장
	public void insertMsg(String from,String to,String contents) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "insert message(`from`,`to`,`contents`,wr_date)";
			sql += "values(?, ?, ?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,from);
			pstmt.setString(2,to);
			pstmt.setString(3,contents);
			System.out.print(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	//보낸사람 가져오기
	public Vector<String> getFromId(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist = new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select `from` from message where `to` like '"+id+"' group by `from` order by wr_date desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vlist.add(rs.getString("from"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//보낸사람 가져오기 + 검색 추가
	public Vector<String> getFromIdSearch(String id , String searchId){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist = new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select a.`from` from(select `from` from message where `to` like '"+id+"' group by `from` order by wr_date desc)a where a.`from` like '"+searchId+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vlist.add(rs.getString("from"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//받은 메세지 가져오기
	public Vector<MessageBean> getMessageList(String my_id, String from_id ){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MessageBean> vlist = new Vector<MessageBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from message where (`to`='"+my_id+"' and `from`='"+from_id+"') or (`to`='"+from_id+"' and `from`='"+my_id+"') order by wr_date desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageBean bean = new MessageBean();
				bean.setMsg_id(rs.getInt("msg_id"));
				bean.setFrom(rs.getString("to"));
				bean.setTo(rs.getString("from"));
				bean.setContents(rs.getString("contents"));
				bean.setWr_date(rs.getString("wr_date"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
}
