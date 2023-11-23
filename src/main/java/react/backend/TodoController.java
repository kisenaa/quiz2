package react.backend;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;


@Controller
public class TodoController {

    public class TodoItem {
        private String title;
        private String description;
        private Boolean finished;

         // Getter and Setter for title
        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        // Getter and Setter for description
        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public Boolean getFinished() {
            return finished;
        }

        public void setFinished(Boolean finished) {
            this.finished = finished;
        }
    }

    @RequestMapping(value="/addTodo", method=RequestMethod.GET)
	public String addTodo(HttpSession session, @RequestParam String title, @RequestParam String description) { 
        ArrayList<TodoItem> tasks; 
        
        if (session.getAttribute("TodoLists") == null) {
            tasks = new ArrayList<>();
        } else {
            tasks = (ArrayList<TodoItem>) session.getAttribute("TodoLists");
        }
     
        TodoItem newTodo = new TodoItem();
        newTodo.setTitle(title);
        newTodo.setDescription(description);
        newTodo.setFinished(false);
        tasks.add(newTodo);
        session.setAttribute("TodoLists", tasks);
        
		return "redirect:/dashboards"; 
	}

    @RequestMapping(value="/deleteTodo", method=RequestMethod.POST)
    @ResponseBody
    public String deleteTodo(HttpSession session, @RequestParam Integer ids) {
        ArrayList<TodoItem> tasks = (ArrayList<TodoItem>) session.getAttribute("TodoLists"); 
        tasks.remove(ids.intValue());
        session.setAttribute("TodoLists", tasks);

        return "Success removing Todlist with id: " + ids;
    }

    @RequestMapping(value="/setFinished", method=RequestMethod.POST)
    @ResponseBody
    public String setFinished(HttpSession session, @RequestParam Integer ids) {
        ArrayList<TodoItem> tasks = (ArrayList<TodoItem>) session.getAttribute("TodoLists"); 
        // Retrieve the TodoItem at the specified index
        TodoItem todoToUpdate = tasks.get(ids);
        // Update the finished attribute
        todoToUpdate.setFinished(!todoToUpdate.getFinished());
        session.setAttribute("TodoLists", tasks);

        return "Success editing Todlist with id: " + ids;
    }

    @RequestMapping(value="/getWeather", method=RequestMethod.POST)
    @ResponseBody
    public String getWeather(HttpSession session) {
        String uri = "https://api.openweathermap.org/data/2.5/weather?lat=-7.2492&lon=112.7508&units=metric&appid=1ddf5eb0a8599080434ff7da39c18fa4";
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
        session.setAttribute("weather", result);
        return result;
    }
    
    
}
