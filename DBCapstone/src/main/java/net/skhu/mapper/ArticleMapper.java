package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import net.skhu.VO.Article;
import net.skhu.model.Option;
import net.skhu.model.QnAPagination;

@Mapper
public interface ArticleMapper {

	Article getOne(int id);

	List<net.skhu.VO.Article> getAllArticles();
	
	List<net.skhu.VO.Article> getAllArticlesBySearchWord(QnAPagination qpagination);

	List<net.skhu.VO.Article> getMyArticles(int id);

	net.skhu.VO.Article findTopOrderByNoDesc();

	void delete(int id);

    void update(@Param("id") int id, @Param("subject") String subject, @Param("message") String message);

	void insert(net.skhu.VO.Article article);

	void insertNotice(Article article);

	void updateYN(@Param("no") boolean no,@Param("id") int id);

	Option[] QnACategory = {  new Option(0, "카테고리"),new Option(1, "제목"), new Option(2, "내용"), new Option(3, "글쓴이")};







}
