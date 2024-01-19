package user.security.domain;


import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

//dto
@Data
public class Users {
	private String gender;
	private String name;
	@NotNull(message="id is null.")
	@NotEmpty(message="아이디를 입력해주세요")
	private String id;
	@NotNull(message="password is null.")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String password;
	private String address;
	private String tel;
	private String email;
	private Role role;
	private char enabled;
}
