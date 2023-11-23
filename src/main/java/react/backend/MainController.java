package react.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() { 
		return "index"; 
	}

	@RequestMapping(value="/sign-in", method=RequestMethod.GET)
	public String signIn() { 
		return "index"; 
	}

	@RequestMapping(value="/sign-up", method=RequestMethod.GET)
	public String signUp() { 
		return "index"; 
	}
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String dashboard() { 
		return "index"; 
	}

	@RequestMapping(value="/dashboards", method=RequestMethod.GET)
	public String dashboards() { 
		return "dashboards/index"; 
	}

	@RequestMapping(value="/AuthRedirect", method=RequestMethod.GET)
	public String AuthRedirect() { 
		return "index"; 
	}

	@RequestMapping(value ="/setState", method=RequestMethod.POST)
	@ResponseBody
	public String setState(HttpSession session, @RequestParam String value) {
		session.setAttribute("currentState", value);
		return "Success: State set to " + value;
	}
}