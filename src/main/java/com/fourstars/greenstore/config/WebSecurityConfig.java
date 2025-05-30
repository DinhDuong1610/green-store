package com.fourstars.greenstore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.fourstars.greenstore.service.UserDetailService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig {

	@Autowired
	private UserDetailService userDetailService;

	@Bean
	public DaoAuthenticationProvider authenticationProvider(BCryptPasswordEncoder passwordEncoder) {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userDetailService);
		auth.setPasswordEncoder(passwordEncoder);
		return auth;
	}

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
		return config.getAuthenticationManager();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
				.csrf().disable()
				.authorizeHttpRequests()
				.requestMatchers("/admin/**").hasRole("ADMIN")
				.requestMatchers("/checkout").hasRole("USER")
				.anyRequest().permitAll()
				.and()
				.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/doLogin")
				.defaultSuccessUrl("/?login_success")
				.successHandler(new SuccessHandler())
				.failureUrl("/login?error=true")
				.permitAll()
				.and()
				.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/?logout_success")
				.invalidateHttpSession(true)
				.clearAuthentication(true)
				.permitAll()
				.and()
				.rememberMe()
				.rememberMeParameter("remember")
				.userDetailsService(userDetailService);

		return http.build();
	}

	// @Autowired
	// public void bindProvider(AuthenticationManagerBuilder auth) {
	// auth.authenticationProvider(authenticationProvider());
	// }
}
