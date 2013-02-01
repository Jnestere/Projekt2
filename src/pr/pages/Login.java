package pr.pages;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Login {
	
	@RequestMapping(value="/login") 
	public String login() {
		return "login"; 
	}
	
	
	@RequestMapping(value="/loginfailed")
	public String loginerror(ModelMap model) { 
		model.addAttribute("error", "message.login.error"); 
		return "login";
	}

}


