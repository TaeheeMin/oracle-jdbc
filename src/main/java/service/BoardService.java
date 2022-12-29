package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	
	// 1) select
	// 1-1) board list
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
		// Connection 생성(DBUtil), beginRow, endRow 생성(currentPage, rowPerPage 가공)
		ArrayList<Board> list = new ArrayList<Board>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = beginRow + rowPerPage - 1;
			// System.out.println("beginRow : " + beginRow);
			// System.out.println("endRow : " + endRow);
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
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
		return list;
	}
	
	// 1-2) board list search
	public ArrayList<Board> getBoardListBySearch(int currentPage, int rowPerPage, String category, String word) {
		// Connection 생성(DBUtil), beginRow, endRow 생성(currentPage, rowPerPage 가공)
		ArrayList<Board> list = new ArrayList<Board>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = beginRow + rowPerPage - 1;
			// System.out.println("beginRow : " + beginRow);
			// System.out.println("endRow : " + endRow);
			boardDao = new BoardDao();
			list = boardDao.selectBoardListBySearch(conn, beginRow, endRow, category, word);
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
		return list;
	}
	
	// 1-3) board list member
	public ArrayList<Board> getBoardListByMember(int currentPage, int rowPerPage, String memberId) {
		ArrayList<Board> list = new ArrayList<Board>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = beginRow + rowPerPage - 1;
			// System.out.println("beginRow : " + beginRow);
			// System.out.println("endRow : " + endRow);
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByMember(conn, beginRow, endRow, memberId);
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
		return list;
	}
	
	// 1-4) boardone
	public Board getBoardOne(int boardNo) {
		Connection conn = null;
		Board board = new Board();
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			if(this.boardDao.selectboardOne(conn, boardNo) != null ){
				board = this.boardDao.selectboardOne(conn, boardNo);
				this.boardDao.updateCount(conn, boardNo);
				// 실패시 예외발생시 catch로 이동해 롤백됨
			}
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
		return board;
	}
	
	// 2) add board
	public int addBoard(Board board) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			result = boardDao.insertBoard(conn, board);
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
	
	// 3) modify
	public int modifyBoard(Board board) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			result = boardDao.updateBoard(conn, board);
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
	
	// 4) remove board
	public int removeBoard(int boardNo, String memberId) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			result = boardDao.deleteBoard(conn, boardNo, memberId);
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
