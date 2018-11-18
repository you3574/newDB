package net.skhu.VO;

import java.util.Date;
//게시글을 관리하는 테이블
//게시글id와 작성자id,제목,내용,작성시간,작성자이름,답변유무,공지사항구분 저장
public class Article {

	int id;
	int no;

	int writerId;
	String subject;
	String message;
	Date time;
	boolean answerYN;
	boolean notice;

	String writerName;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public boolean isAnswerYN() {
		return answerYN;
	}
	public void setAnswerYN(boolean answerYN) {
		this.answerYN = answerYN;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public boolean isNotice() {
		return notice;
	}
	public void setNotice(boolean notice) {
		this.notice = notice;
	}




}
