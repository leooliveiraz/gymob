package gymob.util;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import gymob.models.Usuario;
@Service
public class UsuarioUtil  {
	
	public static Usuario pegaUsuarioLogado() {
		try {
			Usuario usuario = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return usuario;
		} catch (Exception  e) {
		  e.printStackTrace();
		  return null;
		}
	}
}
