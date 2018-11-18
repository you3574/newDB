package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.VO.Article;

@Mapper
public interface ArticleMapper {

	Article getOne(int id);

	List<net.skhu.VO.Article> getAllArticles();

	List<net.skhu.VO.Article> getMyArticles(int id);

	net.skhu.VO.Article findTopOrderByNoDesc();

	void delete(int id);

    void update(@Param("id") int id, @Param("subject") String subject, @Param("message") String message);

	void insert(net.skhu.VO.Article article);






}
