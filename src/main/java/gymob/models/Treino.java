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
public class Treino {	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String descricao;
	@ManyToOne
	@JoinColumn(columnDefinition="usuario_id",referencedColumnName="id")
	private Usuario usuario;
	private Boolean ativo;
	
}
