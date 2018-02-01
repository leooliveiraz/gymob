package gymob.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Exercicio {	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String descricao;
	private Boolean ativo;
	@ManyToOne
	@JoinColumn(name="tipo_exercicio_id",referencedColumnName="id")
	private TipoExercicio tipoExercicio;
	
}
