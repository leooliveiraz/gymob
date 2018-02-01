package gymob.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class ExercicioTreino {	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	private Exercicio exercicio;
	@ManyToOne
	private Treino treino;
	private String series;
	private String repeticao;
	private String peso;
	private String observação;
	
	
}
