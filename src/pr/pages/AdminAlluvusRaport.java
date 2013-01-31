package pr.pages;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class AdminAlluvusRaport {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(AdminAlluvusRaport.class);


	@Resource
	private MessageSource resources;

	@RequestMapping(value = "/AdminAlluvusRaport")
	public String home(Model model) {
		LOGGER.info("AdminAlluvusRaport.java");
		return "AdminAlluvusRaport";
	
	}




}
