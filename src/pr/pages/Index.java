package pr.pages;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/")
public class Index {

	@RequestMapping(method = RequestMethod.GET)
	public String showIndex(ModelMap model) {

		model.addAttribute("message", "Spring Security Hello World");
		return "index";

	}

}