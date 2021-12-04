package bookcart;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BookBoardMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "C:/Jsp/BookSoorae/WebContent/bookcart/fileupload";
	private static final String ENCTYPE = "utf-8";
	private static int MAXSIZE = 5*1024*1024;

	public BookBoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �Խ��� ����Ʈ
	public Vector<BookBoardBean> getBoardList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBoardBean> vlist = new Vector<BookBoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from book order by book_id desc, book_id limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from book where " + keyField + " like ? ";
				sql += "order by book_id desc, book_id limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBoardBean bean = new BookBoardBean();
				bean.setBook_id(rs.getInt("book_id"));
				bean.setTitle(rs.getString("title"));
				bean.setWriter(rs.getString("writer"));
				bean.setMoney(rs.getInt("money"));
				bean.setIsValid(rs.getString("isValid"));
				bean.setUser_id(rs.getString("user_id"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//�� �Խù���
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(book_id) from book";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(book_id) from book where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// �Խù� �Է�
		public void insertBoard(HttpServletRequest req, String user_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			MultipartRequest multi = null;
			int filesize = 0;
			String filename = null;
			try {
				con = pool.getConnection();
				sql = "select max(book_id) from book";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				File file = new File(SAVEFOLDER);
				if (!file.exists())
					file.mkdirs();
				multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
						new DefaultFileRenamePolicy());

				if (multi.getFilesystemName("filename") != null) {
					filename = multi.getFilesystemName("filename");
					filesize = (int) multi.getFile("filename").length();
				}
				String content = multi.getParameter("content");
				/*if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
					content = UtilMgr.replace(content, "<", "&lt;");
				}*/
				sql = "insert book(user_id,title,publisher,writer,money,wr_date,term,content,isValid,filename,filesize, hit)";
				sql += "values(?, ?, ?, ?, ?, now(), 0, ?, ?, ?, ?, 0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, multi.getParameter("title"));
				pstmt.setString(3, multi.getParameter("publisher"));
				pstmt.setString(4, multi.getParameter("writer"));
				pstmt.setString(5, multi.getParameter("money"));
				pstmt.setString(6, content);
				if(multi.getParameter("isValid").equals("valid"))
					pstmt.setString(7,"Y");
				else
					pstmt.setString(7,"N");
				pstmt.setString(8, filename);
				pstmt.setInt(9, filesize);
				System.out.print("isvalid: "+multi.getParameter("isValid"));
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
	
	// �Խù� ����
	public BookBoardBean getBoard(int book_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BookBoardBean bean = new BookBoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from book where book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setBook_id(rs.getInt("book_id"));
				bean.setUser_id(rs.getString("user_id"));
				bean.setTitle(rs.getString("title"));
				bean.setPublisher(rs.getString("publisher"));
				bean.setWriter(rs.getString("writer"));
				bean.setMoney(rs.getInt("money"));
				bean.setWr_date(rs.getString("wr_date"));
				bean.setTerm(rs.getString("term"));
				bean.setContent(rs.getString("content"));
				bean.setIsValid(rs.getString("isValid"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setHit(rs.getInt("hit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// ��ȸ�� ����
	public void upCount(int book_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update book set hit=hit+1 where book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// �Խù� ����
	public void deleteBoard(int book_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select filename from book where book_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}
			sql = "delete from book where book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	public void lendBook(int book_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		try {
			con = pool.getConnection();
			sql = "update book set isValid='N' where book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			pstmt.executeUpdate();
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public void updateBoard(BookBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update book set user_id=?,title=?,writer=?,publisher=?,money=?,isValid=?,content=?,filename=?,filesize=? where book_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getWriter());
			pstmt.setString(4, bean.getPublisher());
			pstmt.setInt(5, bean.getMoney());
			pstmt.setString(6,bean.getIsValid());
			pstmt.setString(7, bean.getContent());
			pstmt.setInt(10, bean.getBook_id());
			pstmt.setString(8, bean.getFilename());
			pstmt.setInt(9, bean.getFilesize());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}


	//���� �ٿ�ε�
		public void downLoad(HttpServletRequest req, HttpServletResponse res,
				JspWriter out, PageContext pageContext) {
			try {
				String filename = req.getParameter("filename");
				File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
				byte b[] = new byte[(int) file.length()];
				res.setHeader("Accept-Ranges", "bytes");
				String strClient = req.getHeader("User-Agent");
				if (strClient.indexOf("MSIE6.0") != -1) {
					res.setContentType("application/smnet;charset=utf-8");
					res.setHeader("Content-Disposition", "filename=" + filename + ";");
				} else {
					res.setContentType("application/smnet;charset=utf-8");
					res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
				}
				out.clear();
				out = pageContext.pushBody();
				if (file.isFile()) {
					BufferedInputStream fin = new BufferedInputStream(
							new FileInputStream(file));
					BufferedOutputStream outs = new BufferedOutputStream(
							res.getOutputStream());
					int read = 0;
					while ((read = fin.read(b)) != -1) {
						outs.write(b, 0, read);
					}
					outs.close();
					fin.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
} 
