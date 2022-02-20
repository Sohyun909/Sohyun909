package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 어노테이션은 파라미터가 없는 기본 생성자를 생성해줍니다.
@AllArgsConstructor // 어노테이션은 모든 필드 값을 파라미터로 받는 생성자를 만들어줍니다.
@Data // 메타데이터를 데이터 셋에 추가하는 작업을 뜻해요.

public class UploadVO {
	int show_no;
	String show_name;
	String show_writer;
	String startday;
	String endday;
	String show_place;
	int show_price;
	String show_detail;
	String show_agelimit;
	String main_img;
	String sub_img1;
	String sub_img2;
	String sub_img3;
	String sub_img4;
}

