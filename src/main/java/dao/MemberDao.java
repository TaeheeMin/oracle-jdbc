package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
