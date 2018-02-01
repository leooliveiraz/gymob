package gymob.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import gymob.models.Treino;
import gymob.models.Usuario;

@Repository
public interface ExercicioRepository  extends CrudRepository<Treino, Long> {

	List<Treino> findByUsuario(Usuario usuario);	
	
}












