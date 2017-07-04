package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Login {

	private static Login instance = new Login();

	public static Login getInstance() {

		return instance;

	}

	private Login() {
	}

	private Connection getConnection() throws Exception {

		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");

		return ds.getConnection();

	}

	public int userCheck(String id, String passwd) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {

			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select pass from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				String dbpasswd = rs.getString("pass");

				if (dbpasswd.equals(orgPass))
					x = 1;
				else
					x = 0;

			} else
				x = -1;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}

		return x;

	}

	public int confirmId(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = 1;
			else
				x = -1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}

		return x;

	}

	public boolean insertMember(MemberInfo member) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;

		try {

			conn = getConnection();
			String orgPass = member.getPass();

			if (confirmId(member.getId()) == 1)
				flag = false;
			else {

				pstmt = conn.prepareStatement("insert into member values(null, ?, ?, ?, ?, ?, ?, ?)");
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getName());
				pstmt.setString(3, member.getPass());
				pstmt.setString(4, member.getEmail());
				pstmt.setString(5, member.getIntro());
				pstmt.setString(6, member.getHero());
				pstmt.setTimestamp(7, member.getReg_date());

				if (pstmt.executeUpdate() == 1)
					flag = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}

		return flag;

	}

	public MemberInfo getMember(String id, String pass) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberInfo member = null;

		try {

			conn = getConnection();
			String orgPass = pass;
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				String dbpasswd = rs.getString("pass");
				if (dbpasswd.equals(orgPass)) {

					member = new MemberInfo();
					member.setPass(rs.getString("pass"));
					member.setIntro(rs.getString("intro"));
					member.setHero(rs.getString("hero"));
					member.setEmail(rs.getString("email"));

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}

		return member;

	}

	@SuppressWarnings("resource")
	public int updateMember(MemberInfo member) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {

			conn = getConnection();
			String orgPass = member.getPass();
			pstmt = conn.prepareStatement("select pass from member where id=?");
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {

				String dbpasswd = rs.getString("pass");
				if (dbpasswd.equals(orgPass)) {

					pstmt = conn.prepareStatement(
							" update member set intro=?,hero=?,email=?,pass=? where id=?");
					pstmt.setString(1, member.getIntro());
					pstmt.setString(2, member.getHero());
					pstmt.setString(3, member.getEmail());
					pstmt.setString(4, member.getPass());
					pstmt.setString(5, member.getId());
					pstmt.executeUpdate();
					x = 1;

				} else
					x = 0;

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}

		return x;

	}

	public int deleteMember(String id, String passwd) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {

			conn = getConnection();
			String orgPass = passwd;

			pstmt = conn.prepareStatement("select pass from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				String dbpasswd = rs.getString("pass");
				if (dbpasswd.equals(orgPass)) {

					pstmt = conn.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;

				} else
					x = 0;

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		
		return x;

	}
	
	public int out(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {

			conn = getConnection();

			pstmt = conn.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

	

					pstmt = conn.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;

				} else
					x = 0;

			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		
		return x;
		
	}

}
