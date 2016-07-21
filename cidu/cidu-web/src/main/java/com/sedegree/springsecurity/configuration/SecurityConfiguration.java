package com.sedegree.springsecurity.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
 
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
 
	@Autowired
	@Qualifier(value = "customUserDetailsService")
	private UserDetailsService userDetailsService;
	
	@Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        //auth.inMemoryAuthentication().withUser("cidu").password("51cidu").roles("USER");
        //auth.inMemoryAuthentication().withUser("admin").password("admin2016").roles("ADMIN");
        
        auth.userDetailsService(userDetailsService);
        auth.authenticationProvider(authenticationProvider());
    }
    
	@Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
  
      http.authorizeRequests()
        .antMatchers("/resource/**").permitAll() 
        .antMatchers("/customer/view/**").permitAll()
        .antMatchers("/tb/**").permitAll()
        .antMatchers("/customer/detail/**").access("hasRole('USER') or hasRole('ADMIN')")
        .antMatchers("/customer/update**").access("hasRole('USER') or hasRole('ADMIN')")
        .antMatchers("/user/**","/customer/**").access("hasRole('ADMIN')")
        //.antMatchers("/admin/**").access("hasRole('ADMIN')")
        //.antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")
        .anyRequest().authenticated()
        .and().formLogin().loginPage("/login.do").defaultSuccessUrl("/index.do").permitAll()//.loginProcessingUrl("/doLogin.do")
        .and().logout().permitAll()
        .and().exceptionHandling().accessDeniedPage("/denied.do");
  
    }
}
