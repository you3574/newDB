package net.skhu.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.VO.Article;
import net.skhu.mapper.ArticleMapper;
import net.skhu.model.ArticleModel;


@Service
public class QnAService {

	@Autowired ArticleMapper articleMapper;

    public Article getOne(int id) {
        return articleMapper.getOne(id);
    }

    public List<Article> getMyArticles(int id) {
        return articleMapper.getMyArticles(id);
    }

    public List<Article> getAllArticles() {

        return articleMapper.getAllArticles();
    }

    public void update(ArticleModel a) {
        articleMapper.update(a.getId(),a.getSubject(),a.getMessage());
    }

    public void insert(ArticleModel a, int writerId) {
        Article last = articleMapper.findTopOrderByNoDesc();
        int no = (last == null) ? 1 : last.getNo() + 1;

        Article article = new Article();

        article.setNo(no);
        article.setWriterId(writerId);
        article.setTime(new Date());
        article.setSubject(a.getSubject());
        article.setMessage(a.getMessage());

        articleMapper.insert(article);

    }

    public void delete(int id) {
        articleMapper.delete(id);
    }



}
