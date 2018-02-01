package gymob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gymob.models.Treino;
import gymob.service.TreinoService;
import gymob.util.UsuarioUtil;

@Controller
@RequestMapping("/meutreino")
public class TreinoController {
	@Autowired
	TreinoService treinoService;
	
	
	@RequestMapping("")
	public ModelAndView meutreino() {
		ModelAndView mv = new ModelAndView("treino/treinos");
		List<Treino> lista = treinoService.listar(UsuarioUtil.pegaUsuarioLogado());
		mv.addObject("listaTreino", lista);
		return mv;
	}

	@RequestMapping("/novo")
	public ModelAndView novo() {
		ModelAndView mv = new ModelAndView("treino/novo");
		return mv;
	}
	
	@RequestMapping(name="/salvar",method=RequestMethod.POST)
	public ModelAndView salvar(Treino treino ,RedirectAttributes redirectAttributes) {
		try {
			treinoService.salvar(treino);		
			redirectAttributes.addFlashAttribute("sucesso", "Treino registrado.");
			ModelAndView mv = new ModelAndView("redirect:/meutreino/"+treino.getId());
			return mv;
		}catch (Exception e) {
			redirectAttributes.addFlashAttribute("erro", "Ops, houve um problema ao registrar esse Treino.");
			ModelAndView mv = new ModelAndView("redirect:/meutreino/novo");
			return mv;
		}
	}
	

	@RequestMapping("/{idTreino}")
	public ModelAndView treino(@PathVariable Long idTreino) {
		ModelAndView mv = new ModelAndView("treino/treino");
		Treino treino = treinoService.buscarId(idTreino);
		mv.addObject("treino",treino);
		return mv;
	}
	
}
