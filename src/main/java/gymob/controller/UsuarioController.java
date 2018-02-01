package gymob.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gymob.models.Usuario;
import gymob.service.UsuarioService;


@Controller
@RequestMapping("/usuario")
public class UsuarioController {
	@Autowired
	UsuarioService usuarioService;
	
	@RequestMapping("/novo")
	public ModelAndView novo() {
		ModelAndView mv = new ModelAndView("usuario/novo");
		return mv;
	}
	


	@RequestMapping(value="/salvar",method=RequestMethod.POST)
	public ModelAndView salvar(Usuario usuario,String senha_validacao,RedirectAttributes redirectAttributes)  throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/");		
		if(!usuario.getSenha().equals(senha_validacao)) {
			mv = new ModelAndView("usuario/novo");	
	    	redirectAttributes.addFlashAttribute("erro", "Informe as duas senhas iguais.");
		}
		if(usuarioService.verificaExistencia(usuario)){
			mv = new ModelAndView("usuario/novo");	
	    	redirectAttributes.addFlashAttribute("erro", "Já existe usuário com esse email.");
		}
		usuarioService.salvar(usuario);
    	redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso.");
		return mv;
	}
}
