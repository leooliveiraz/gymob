package gymob.models;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class TipoExercicio {
	@Id
	private Long id;
	private String descricao;
}
