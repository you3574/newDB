package net.skhu.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.VO.Student;
import net.skhu.model.ArticleModel;
import net.skhu.service.QnAService;

@Controller

public class QnAController {
	@Autowired QnAService qnaService;

	@RequestMapping("question")
    public String list(Model model) {

        model.addAttribute("articles", qnaService.getAllArticles());

        return "student/question";
    }

    @RequestMapping("question_details")
    public String view(@RequestParam("id") int id,Model model) {
        model.addAttribute("article", qnaService.getOne(id));

        return "student/question_details";
    }

    @GetMapping("myquestion")
    public String myquestion(Model model,HttpSession session) {
    	Student student = (Student)session.getAttribute("loginUser");
    	model.addAttribute("articles", qnaService.getMyArticles(student.getId()));
    	return "student/myquestion";
    }
//    @RequestMapping(value="edit", method=RequestMethod.GET)
//    public String edit(@RequestParam("id") int id, Model model) {
//
//        model.addAttribute("articleModel", articleService.findOne(id));
//        return "article/edit";
//    }
//
//    @Transactional
//    @RequestMapping(value="edit", method=RequestMethod.POST)
//    public String edit(@Valid ArticleModel a, BindingResult bindingResult,
//            Pagination pagination, Model model) {
//        if (bindingResult.hasErrors()) {
//            model.addAttribute("board", boardMapper.findOne(pagination.getBd()));
//            return "article/edit";
//        }
//        articleService.update(a);
//        return "redirect:view?id=" + a.getId() + "&" + pagination.getQueryString();
//    }
//
    @GetMapping("write")
    public String write(Model model) {

        model.addAttribute("articleModel", new ArticleModel());
        return "student/write";
    }

    @Transactional
    @PostMapping("write")
    public String write(ArticleModel a, Model model,HttpSession session) {

        Student student = (Student)session.getAttribute("loginUser");
        qnaService.insert(a,student.getId());
        return "redirect:question";
    }

    @RequestMapping(value="delete", method=RequestMethod.GET)
    public String delete(@RequestParam("id") int id, Model model) {
        qnaService.delete(id);
        return "redirect:question";
    }


}
