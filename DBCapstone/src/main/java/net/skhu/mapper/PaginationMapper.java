package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.model.Pagination;

@Mapper
public interface PaginationMapper {
	List<net.skhu.VO.Student> findAll(Pagination pagination);

}
