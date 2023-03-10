package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import dao.MemberDao;
import util.DBUtil;
import vo.Board;
import vo.Member;

public class MemberService {
	private DBUtil DBUtil;
	private MemberDao memberDao;
	
	// 1) login
	public Member login(Member member) {
		this.memberDao = new MemberDao();
		Connection conn = null;
		Member loginMember = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			loginMember = memberDao.login(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}
	
	// 2) signin
	// 2-1) membercheck
	public int memberCheck(String memberId) {
		int result = 0;
		Connection conn = null;
		MemberDao memberDao = new MemberDao();
		try {
			conn = DBUtil.getConnection();
			result = memberDao.memberCheck(conn, memberId);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
	// 2-2) add Member
	public int addMember(Member member) {
		int result = 0;
		Connection conn = null;
		MemberDao memberDao = new MemberDao();
		try {
			conn = DBUtil.getConnection();
			result = memberDao.insertMember(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 3) modify member
	// 3-1) get Member One
	public Member getMemberOne(String memberId) {
		Connection conn = null;
		Member member = new Member();
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			member = memberDao.memberOne(conn, memberId);
			conn.commit(); // DBUtil setAutoCommit false설정
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	// 3-2) modifyMember
	public int modifyMember(Member member) {
		int result = 0;
		Connection conn = null;
		memberDao = new MemberDao();
		try {
			conn = DBUtil.getConnection();
			result = memberDao.updateMember(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 4) remove member 
	public int removeMember(String memberId, String memberPw) {
		int result = 0;
		Connection conn = null;
		memberDao = new MemberDao();
		try {
			conn = DBUtil.getConnection();
			result = memberDao.deleteMember(conn, memberId, memberPw);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
