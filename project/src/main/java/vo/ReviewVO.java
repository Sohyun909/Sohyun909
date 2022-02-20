package vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
	private int review_no;
	private String main_img;
	private String review_title;
	private String review_detail;
	private String review_writer;
	private String review_date;
	private int review_hits;
	private float review_rate;
	private int showmem_no;
}
