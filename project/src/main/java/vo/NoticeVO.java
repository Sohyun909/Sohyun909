package vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	private int noticeNo;
	private String category;
	private String noticeTitle;
	private String noticeDetail;
	private String noticeWriter;
	private String noticeDate;
	private int noticeHits;
	private int showMemNo;
}
