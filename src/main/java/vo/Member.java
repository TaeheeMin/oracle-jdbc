package vo;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String createdate;
	private String updatedate;
	
	public Member() {
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", createdate=" + createdate + ", updatedate=" + updatedate + "]";
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	
}
