package net.skhu.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.skhu.model.Pagination;
import net.skhu.service.PaginationService;

@Controller
public class PaginationController {

	@Autowired PaginationService paginationService;

    @RequestMapping("list")
    public String list(Pagination pagination, Model model) {

        model.addAttribute("students", paginationService.findAll(pagination));
        model.addAttribute("orderBy", paginationService.getOrderByOptions());
        model.addAttribute("category", paginationService.getCategoryOptions());
        return "list";
    }
    @RequestMapping("list2")
    public String list2(Pagination pagination, Model model) {

        model.addAttribute("students", paginationService.findAll(pagination));
        model.addAttribute("orderBy", paginationService.getOrderByOptions());
        model.addAttribute("category", paginationService.getCategoryOptions());
        return "list2";
    }
}
