package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CardVO {
	String card_no;
	int cvc; 
	String card_pw;
	int card_cash;
}
