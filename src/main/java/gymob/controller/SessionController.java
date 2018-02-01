package gymob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SessionController {
	@RequestMapping("/login")
	public String login() {
		return "/login";
	}
	@RequestMapping("/logout")
	public String logout(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("Sucesso","Você saiu do sistema");
		return "redirect:/meutreino/";
	}
}
