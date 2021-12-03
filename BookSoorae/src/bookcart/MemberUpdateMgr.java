package bookcart;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberUpdateMgr {

	private DBConnectionMgr pool;
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;

	public MemberUpdateMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 정보 수정
		public void updateMember(MemberRegisterBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update member set pw=?,name=?,email=?,area1=?,area2=?,phone=? where user_id=?";
				pstmt = con.prepareStatement(sql);
		
				System.out.println(bean.getPw());
				System.out.println(bean.getEmail());
				pstmt.setString(1, bean.getPw());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getEmail());
				pstmt.setString(4, bean.getArea1());
				pstmt.setString(5, bean.getArea2());
				pstmt.setString(6, bean.getPhone());
				pstmt.setString(7, bean.getUser_id());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}

}

