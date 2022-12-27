package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Member;

public class MemberDao {
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
}
