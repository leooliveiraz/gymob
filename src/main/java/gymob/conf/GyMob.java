package gymob.conf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import gymob.controller.HomeController;
import gymob.models.Usuario;
import gymob.repository.UsuarioRepository;
import gymob.service.AuthService;

@SpringBootApplication
@ComponentScan(basePackageClasses= {HomeController.class,Configuracoes.class,AuthService.class})
@EnableJpaRepositories(basePackageClasses= {UsuarioRepository.class})
@EntityScan(basePackageClasses= {Usuario.class})
public class GyMob {
	public static void main(String []args) {
		SpringApplication.run(GyMob.class,args);
	}
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	    resolver.setPrefix("/WEB-INF/views/");
	    resolver.setSuffix(".jsp");
	    return resolver;
	}

}
