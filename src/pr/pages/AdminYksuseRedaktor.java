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
public class AdminYksuseRedaktor {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(AdminYksuseRedaktor.class);


	@Resource
	private MessageSource resources;

	@RequestMapping(value = "/AdminYksuseRedaktor")
	public String home(Model model) {
		LOGGER.info("AdminYksuseRedaktor.java");
		return "AdminYksuseRedaktor";
	
	}




}
