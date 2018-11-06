package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.Student;
import net.skhu.mapper.PaginationMapper;
import net.skhu.model.Option;
import net.skhu.model.Pagination;

@Service
public class PaginationService {

	@Autowired PaginationMapper paginationMapper;

	public List<Student> findAll(Pagination pagination) {

		int count = paginationMapper.count(pagination);
        pagination.setRecordCount(count);

        return paginationMapper.findAll(pagination);
    }

	public Option[] getOrderByOptions() {
        return PaginationMapper.orderBy;
    }

    public Option[] getCategoryOptions() {
        return PaginationMapper.category;
    }

}
