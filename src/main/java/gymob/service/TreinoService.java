package gymob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gymob.models.Treino;
import gymob.models.Usuario;
import gymob.repository.TreinoRepository;
import gymob.util.UsuarioUtil;

@Service
public class TreinoService {
	@Autowired
	TreinoRepository treinoRepository;
	@Autowired
	UsuarioService usuarioService;
	
	
	public void salvar(Treino treino) {		
		Usuario usuario = UsuarioUtil.pegaUsuarioLogado();
		
		treino.setUsuario(usuario);
		treino.setAtivo(Boolean.TRUE);
		
		treinoRepository.save(treino);
	}


	public List<Treino> listar(Usuario usuario) {
		List<Treino>  lista = treinoRepository.findByUsuario(usuario);
		return lista;
	}


	public Treino buscarId(Long idTreino) {
		Treino treino = treinoRepository.findOne(idTreino);
		return treino;
	}
}
