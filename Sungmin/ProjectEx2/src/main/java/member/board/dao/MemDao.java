package member.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import member.board.dto.MemDto;

@Mapper
public interface MemDao {

	String idCheck(String id);
	int insertMem(MemDto dto);
	MemDto login(MemDto dto);
	int updateMem(MemDto dto);
	int deleteMem(String id);
	@Select("select id,name, birth, address from mem")
	List<MemDto> memsInfo();
}
