package user.security.dao;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import user.security.dto.MemDto;
import user.security.domain.Users;

@Mapper
public interface UsersDao {
	
	@Select("select * from users1 where id = #{id}")
	Users findById(String id);

	@Insert("insert into users1 values (#{gender}, #{name}, #{id}, #{password}, #{address}, #{tel}, #{email} #{role}, 'T')")
	int insertUser(Users user);
	
	@Select("select id from users1 where id =#{id}")
	String idCheck(String id);
	
	@Select("select * from users1 where id=#{id} and password=#{password}")
	Users login(Users user);
	
	
	@Update("update users1 set password = #{password}, name = #{name}, birth = #{birth}, address = #{address} where id = #{id}")
	int updateMem(Users user);
	
	@Select("select id FROM mem WHERE name = #{name} AND email = #{email}")
	String findid(String name, String email);
    
	@Select("select password FROM mem WHERE name = #{name} AND id = #{id} AND email = #{email}")
    String findpw(String name, String id, String email);
       

}
