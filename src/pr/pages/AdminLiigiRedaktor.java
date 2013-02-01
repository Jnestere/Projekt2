package pr.pages;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/adminLiigiRedaktor")
public class AdminLiigiRedaktor {

	@RequestMapping(method = RequestMethod.GET)
	public String showIndex(ModelMap model) {
		return "AdminLiigiRedaktor";

	}

}