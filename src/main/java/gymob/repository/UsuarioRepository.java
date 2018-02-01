package gymob.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gymob.models.Usuario;

@Repository
public interface UsuarioRepository  extends CrudRepository<Usuario, Long> {	
	List<Usuario> findByEmail(String nome);
	List<Usuario> findByUsername(String usuario);
	List<Usuario> findByUsernameOrEmailOrCelular(String usuario,String email,String celular);
	List<Usuario> findByCpf(String cpf);
}












