package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Board;

public class BoardDao {
	// 1) list
	// 1-2) 전체 list
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id, createdate"
				+ "			 FROM (SELECT board_no, board_title, member_id, createdate"
				+ "					 FROM board ORDER BY board_no DESC))"
				+ " WHERE rnum BETWEEN ? AND ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
	public ArrayList<Board> selectBoardListBySearch(Connection conn, int beginRow, int endRow, String word) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id, createdate"
				+ "			 FROM (SELECT board_no, board_title, member_id, createdate"
				+ "					 FROM board ORDER BY board_no DESC))"
				+ " WHERE board_title LIKE ? AND rnum BETWEEN ? AND ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+word+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
	// 1-2) 게시물 한 개
	public Board selectboardOne(Connection conn, int boardNo) throws Exception {
		Board board = new Board();
		String sql = "SELECT board_no boardNo"
				+ ", board_title boardTitle"
				+ ", board_content boardContent"
				+ ", createdate"
				+ " FROM board WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			board.setBoardNo(rs.getInt("boardNo"));
			board.setBoardTitle(rs.getString("boardTitle"));
			board.setBoardContent(rs.getString("boardContent"));
			board.setCreatedate(rs.getString("createdate"));
		}
		return board;
	}
	
	// 2) insert
	public int insertBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		String sql = "insert into board ("
				+ "  board_no"
				+ ", board_title"
				+ ", board_content"
				+ ", member_id"
				+ ", updatedate"
				+ ", createdate"
				+ "	 ) values (board_seq.nextval, ? , ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 3) update
	public int updateBoard(Connection conn, Board board) throws Exception {
		int result = 0;
		PreparedStatement stmt = null;
		String sql ="UPDATE board SET board_title =?, board_content=? WHERE board_no=? AND member_id =?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());
		stmt.setString(4, board.getMemberId());
		result = stmt.executeUpdate();
		return result;
	}
	
	// 4) delete
	public int deleteBoard(Connection conn, int boardNo, String memberId) throws Exception {
		int result = 0;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM board WHERE board_no = ? AND member_id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		stmt.setString(2, memberId);
		result = stmt.executeUpdate();
		return result;
	}
}
