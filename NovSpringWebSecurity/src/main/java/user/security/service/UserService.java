package user.security.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import user.security.domain.Users;
import user.security.dao.UsersDao;
import user.security.domain.Role;


@Service
public class UserService {

	@Autowired
	UsersDao dao;
	
	@Autowired
	private PasswordEncoder encoder;

	public int insertUser(Users users) {

		// 암호화(BCrypt 알고리즘 ) 
		users.setPassword(encoder.encode(users.getPassword()));
		users.setRole(Role.ROLE_ADMIN);

		return dao.insertUser(users);
	}
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}

	public Users login(Users user) {
		return dao.login(user);
	} 	
	
	public int updateMem(Users user) {
		return dao.updateMem(user);
	}
	
	public String findId(String name, String email) { 
		return dao.findid(name, email); 
	}
	  
	public String findPw(String name, String id, String email) { 
		return dao.findpw(name, id, email); 
	}
	
	

}
