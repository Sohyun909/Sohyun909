package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookingVO {
	int book_no;
	int book_price;
	String book_date;
	int pax;
	int status;
	int show_no;
	int showmem_no;
	String card_no;
	
}
