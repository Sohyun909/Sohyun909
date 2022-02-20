package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ShowMemVO {
	int showmemNo;
	String birth;
	String id;
	String pwd;
	String gender;
	String email;
	String phone;
	String address;
	int count;
	String grade;
	int bookNo;
	String name;
	
	public ShowMemVO(int showmemNo, String birth, String id, String pwd, String gender, String email, String phone,
			String address, String name) {
		super();
		this.showmemNo = showmemNo;
		this.birth = birth;
		this.id = id;
		this.pwd = pwd;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.name = name;
	}

	
	
}
