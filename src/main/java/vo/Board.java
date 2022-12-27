package vo;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String memberId;
	private String updatedate;
	private String createdate;
	
	// 모든 필드 가진 생성자
	public Board(int boardNo, String boardTitle, String boardContent, String memberId, String updatedate,
			String createdate) {
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberId = memberId;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}

	// 기본생성자
	public Board() {
		// super(); 부모 생성자 만드는
	}

	@Override
	// 부모 메서드를 자식 타입에서 재정의
	// toString() 오브젝트 this생략
	public String toString() { // 디버깅시 객체 멤버를 출력할 때 사용하는 
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memberId=" + memberId + ", updatedate=" + updatedate + ", createdate=" + createdate + "]";
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
