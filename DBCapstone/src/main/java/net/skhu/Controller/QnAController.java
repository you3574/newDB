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

import net.skhu.VO.Admin;
import net.skhu.VO.Student;
import net.skhu.model.AnswerModel;
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

	@RequestMapping("question_admin")
    public String list_admin(Model model) {

        model.addAttribute("articles", qnaService.getAllArticles());

        return "admin/question_admin";
    }

    @RequestMapping("question_details")
    public String view(@RequestParam("id") int id,Model model) {
        model.addAttribute("article", qnaService.getOne(id));
        model.addAttribute("answer", qnaService.getAnswer(id));

        return "student/question_details";
    }

    @GetMapping("question_details_admin")
    public String view_admin(@RequestParam("id") int id,Model model) {
        model.addAttribute("article", qnaService.getOne(id));
        model.addAttribute("answer", qnaService.getAnswer(id));

        return "admin/question_details_admin";
    }
    @Transactional
    @PostMapping("question_details_admin")
    public String view_admin(AnswerModel a,HttpSession session,@RequestParam("id") int id) {

        Admin admin=(Admin)session.getAttribute("loginUser");
        qnaService.insertAnswer(a,id,admin.getId());
        qnaService.updateYN(true,id);
        return "redirect:question_admin";
    }

    @GetMapping("question_details_edit")
    public String edit_answer(@RequestParam("id") int id,Model model) {
        model.addAttribute("article", qnaService.getOne(id));
        model.addAttribute("answer", qnaService.getAnswer(id));

        return "admin/question_details_edit";
    }
   @Transactional
    @PostMapping("question_details_edit")
    public String edit_answer(AnswerModel a,HttpSession session,@RequestParam("id") int id) {

        Admin admin=(Admin)session.getAttribute("loginUser");
        qnaService.updateAnswer(a.getMessage(),id);

        return "redirect:question_admin";
    }



    @GetMapping("myquestion")
    public String myquestion(Model model,HttpSession session) {
    	Student student = (Student)session.getAttribute("loginUser");
    	model.addAttribute("articles", qnaService.getMyArticles(student.getId()));
    	return "student/myquestion";
    }

    @GetMapping("question_write")
    public String write(Model model) {

        model.addAttribute("articleModel", new ArticleModel());
        return "student/question_write";
    }

    @Transactional
    @PostMapping("question_write")
    public String write(ArticleModel a, Model model,HttpSession session) {

        Student student = (Student)session.getAttribute("loginUser");
        qnaService.insert(a,student.getId());
        return "redirect:question";
    }

    @GetMapping("question_write_notice")
    public String write_notice(Model model) {

        model.addAttribute("articleModel", new ArticleModel());
        return "admin/question_write_notice";
    }

    @Transactional
    @PostMapping("question_write_notice")
    public String write_notice(ArticleModel a, Model model,HttpSession session) {

    	Admin admin=(Admin)session.getAttribute("loginUser");
        qnaService.insertNotice(a,admin.getId());
        return "redirect:question_admin";
    }

    @RequestMapping(value="delete", method=RequestMethod.GET)
    public String delete(@RequestParam("id") int id, Model model) {
        qnaService.delete(id);
        return "redirect:question";
    }
//  @RequestMapping(value="edit", method=RequestMethod.GET)
//  public String edit(@RequestParam("id") int id, Model model) {
//
//      model.addAttribute("articleModel", articleService.findOne(id));
//      return "article/edit";
//  }
//
//  @Transactional
//  @RequestMapping(value="edit", method=RequestMethod.POST)
//  public String edit(@Valid ArticleModel a, BindingResult bindingResult,
//          Pagination pagination, Model model) {
//      if (bindingResult.hasErrors()) {
//          model.addAttribute("board", boardMapper.findOne(pagination.getBd()));
//          return "article/edit";
//      }
//      articleService.update(a);
//      return "redirect:view?id=" + a.getId() + "&" + pagination.getQueryString();
//  }
//

}
