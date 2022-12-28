package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import oracle.jdbc.proxy.annotation.Pre;
import vo.Board;
import vo.Member;

public class MemberDao {
	// 1) login
	public Member login(Connection conn, Member member) throws Exception {
		Member returnMember  = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql ="SELECT member_id memberId"
				+ ", member_name memberName"
				+ " FROM member"
				+ " WHERE member_id = ? AND member_pw = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberName(rs.getString("memberName"));
		}
		return returnMember;
	}
	
	// 2) insert member
	// 2-1) 중복 검사
	public int memberCheck(Connection conn, String memberId) throws Exception {
		int row = 0;
		String sql = "select * from member where member_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		row = stmt.executeUpdate(); // 결과물이 있으면 동일값 존재 -> 에러 메세지, 추가폼이동
		return row;
	}
	
	// 2-2) 가입
	public int insertMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql = "INSERT INTO member ("
				+ "  member_id"
				+ ", member_pw"
				+ ", member_name"
				+ ", updatedate"
				+ ", createdate"
				+ "	 ) VALUES (? , ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 3) 수정
	// 3-1) 개인정보 가져오기
	public Member memberOne(Connection conn, String memberId) throws Exception {
		Member member = new Member();
		String sql = "SELECT member_id memberId, member_name memberName FROM member WHERE member_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			member.setMemberId(rs.getString("memberId"));
			member.setMemberName(rs.getString("memberName"));
		}
		return member;
 	}
	// 3-2) 정보 수정
	public int updateMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql = "UPDATE member SET member_name = ? where member_id=? AND member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getMemberId());
		stmt.setString(3, member.getMemberPw());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 4) 탈뢰
	public int deleteMember(Connection conn, String memberId, String memberPw) throws Exception {
		int row = 0;
		String sql = "DELETE FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		row =  stmt.executeUpdate();
		return row;
	}
	
}
