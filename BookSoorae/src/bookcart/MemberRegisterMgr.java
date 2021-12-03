package bookcart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class MemberRegisterMgr {

	private DBConnectionMgr pool = null;
	
	public MemberRegisterMgr() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : Ŀ�ؼ� ������ ����");
 	   }
     }
	
	// ȸ��Ż�� 
	public void deleteMember(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from member where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// ID �ߺ�Ȯ��
	public boolean checkId(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select user_id from member where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
    public Vector<MemberRegisterBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<MemberRegisterBean> vlist = new Vector<MemberRegisterBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from member";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
             MemberRegisterBean bean = new MemberRegisterBean();
             bean.setUser_id (rs.getString("user_id"));
			 bean.setPw (rs.getString("pw"));
 			 bean.setName (rs.getString("name"));
 			 bean.setArea1 (rs.getString("area1"));
 			 bean.setArea2 (rs.getString("area2"));
 			 bean.setEmail (rs.getString("email"));
 			 bean.setPhone (rs.getString("phone"));
 			 vlist.addElement(bean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vlist;
    }
    
    public MemberRegisterBean getRegister(String id) {
    	Connection conn = null;
 	   	Statement stmt = null;
 	   	ResultSet rs = null;
 	   	MemberRegisterBean mem=null;
 	   try {
 		   conn = pool.getConnection();
 		   String strQuery = "select * from member where user_id='"+id+"'";
 		   stmt = conn.createStatement();
 		   rs = stmt.executeQuery(strQuery);
 		   while(rs.next()) {
 			 System.out.println("1");
 			 MemberRegisterBean bean = new MemberRegisterBean();
             bean.setUser_id (rs.getString("user_id"));
 			 bean.setPw (rs.getString("pw"));
  			 bean.setName (rs.getString("name"));
  			 bean.setArea1 (rs.getString("area1"));
  			 bean.setArea2 (rs.getString("area2"));
  			 bean.setEmail (rs.getString("email"));
  			 bean.setPhone (rs.getString("phone"));
  			 System.out.println(rs.getString("area1"));
  			 mem=bean;
 		   }
 	   }
 	   catch (Exception ex) {
          System.out.println("Exception" + ex);
       } 
 	   finally {
	      pool.freeConnection(conn);
       }
 	   
 	   return mem;
    }
    
    public void setRegister(String user_id,String pw,String name,String email,String area1,String area2,String phone) {
    	Connection conn = null;
 	   	Statement stmt = null;
 	   	boolean rs;
 	   	try {
 	   		conn = pool.getConnection();
 	   		String strQuery = "insert into member(user_id,pw,name,email,area1,area2,phone) values ('"+user_id+"','"+pw+"','"+name+"','"+email+"','"+area1+"','"+area2+"','"
 	   		+phone+"')";
 	   		stmt = conn.createStatement();
 	   		rs = stmt.execute(strQuery);
 	   		}
	   catch (Exception ex) {
		   System.out.println("Exception" + ex);
	   } 
	   finally {
		   pool.freeConnection(conn);
	   }
    }
    
    public String login(String user_id, String pw) {
    	Connection conn = null;
 	   	Statement stmt = null;
 	   	ResultSet rs = null;
 	   	String name=null;
 	   try {
 		   conn = pool.getConnection();
 		   String strQuery = "select * from member where user_id='"+user_id+"' and pw='"+pw+"'";
 		   stmt = conn.createStatement();
 		   rs = stmt.executeQuery(strQuery);
 		   while(rs.next()) {
 			   name=rs.getString("name");
 		   }
 		 
 	   }
 	   catch (Exception ex) {
          System.out.println("Exception" + ex);
       } 
 	   finally {
	      pool.freeConnection(conn);
       }
 	  if(name!=null) {
		   return name;
	   }
	   else
		   return "error";
    }
}
