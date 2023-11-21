package react.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() { 
		return "index"; 
	}

	@RequestMapping(value="/dashboards", method=RequestMethod.GET)
	public String dashboards() { 
		return "dashboards/dashboards"; 
	}
}