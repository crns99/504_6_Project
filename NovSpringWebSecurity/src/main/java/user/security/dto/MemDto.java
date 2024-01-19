package user.security.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class MemDto {
	
	@NotNull(message="id is null.")
	@NotEmpty(message="아이디를 입력해주세요")
	private String id;
	@NotNull(message="password is null.")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String  password;
	private String name;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date birth; 
	private String address;
	
	
}
