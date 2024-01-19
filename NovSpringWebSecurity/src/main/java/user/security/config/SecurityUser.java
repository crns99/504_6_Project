package user.security.config;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import user.security.domain.Users;


//인증 후 세션에 저장되는 객체
public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;

	private Users users;
	
	//DB에 아이디 비번 비교후 맞으면 로그인
	public SecurityUser(Users users) {
		super(users.getId(), users.getPassword(),
				AuthorityUtils.createAuthorityList(users.getRole().toString()));
		this.users = users;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Users getUsers() {
		return users;
	}
	
	
}
