package user.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig {	
	
	@Autowired
	private BoardUserDetailsService boardUserDetailsService;
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

				http.csrf(AbstractHttpConfigurer::disable)
		
				.headers((headers) -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))

				.authorizeHttpRequests(auth -> {
					try {
						auth.requestMatchers(new AntPathRequestMatcher("/member/**"),
								new AntPathRequestMatcher("/js/**")).authenticated()//인증만 되면 보여줌
								.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")//인가
								.requestMatchers(new AntPathRequestMatcher("/manager/**")).hasAnyRole("MANAGER", "ADMIN")
								.anyRequest().permitAll();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				//내가 만든 로그인 폼을 보여주기 위해서
				).formLogin((formLogin) -> formLogin.loginPage("/login").defaultSuccessUrl("/loginSuccess", true)
				).logout((logout) -> logout.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.invalidateHttpSession(true).logoutSuccessUrl("/"))
				 .exceptionHandling((exception)-> exception.accessDeniedPage("/accessDenied"));

				http.userDetailsService(boardUserDetailsService);

		return http.build();

	}
	
	
	  @Bean public PasswordEncoder passwordEncoder() { 
		  return new BCryptPasswordEncoder();
	  }
	 
	
	
		/*
		 * @Autowired public void authenticate(AuthenticationManagerBuilder auth) throws
		 * Exception{ auth.inMemoryAuthentication().withUser("manager")
		 * .password("{noop}manager123") .roles("MANAGER");
		 * 
		 * auth.inMemoryAuthentication().withUser("admin") .password("{noop}admin123")
		 * .roles("ADMIN"); }
		 */
	 

}







