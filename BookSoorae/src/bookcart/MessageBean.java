package bookcart;

public class MessageBean {
	int msg_id;
	String from;
	String to;
	String contents;
	String wr_date;
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWr_date() {
		return wr_date;
	}
	public void setWr_date(String date) {
		this.wr_date = date;
	}
	
}
