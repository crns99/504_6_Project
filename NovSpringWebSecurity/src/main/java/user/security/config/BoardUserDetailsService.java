package user.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import user.security.dao.UsersDao;
import user.security.domain.Users;


@Service
public class BoardUserDetailsService implements UserDetailsService {

	@Autowired
	private UsersDao usersDao;
	
	//DB에서 아이디 있으면 SecurityUser로 넘긴다
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = usersDao.findById(username);
		if (user == null) {
			throw new UsernameNotFoundException(username + " 사용자 없음");
		} else {
			return new SecurityUser(user);
		}
	}
}
