package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowVO {
	
	int showNo;
	String showName;
	String showWriter;
	String startDate;
	String endDate;
	String showPlace;
	int showPrice;
	String showDetail;
	String showAgelimit;
	String mainImg;
	String subImg1;
	String subImg2;
	String subImg3;
	String subImg4;

}
