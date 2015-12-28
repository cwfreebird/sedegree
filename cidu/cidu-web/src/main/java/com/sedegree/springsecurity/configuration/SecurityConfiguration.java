package com.sedegree.springsecurity.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
 
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
 
    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("cidu").password("abc123!").roles("USER");
        auth.inMemoryAuthentication().withUser("admin").password("1").roles("ADMIN");
        auth.inMemoryAuthentication().withUser("dba").password("root123").roles("ADMIN","DBA");//dba have two roles.
    }
     
    @Override
    protected void configure(HttpSecurity http) throws Exception {
  
      http.authorizeRequests()
        .antMatchers("/resource/**").permitAll() 
        .antMatchers("/view/**").permitAll()
        .antMatchers("/customer/detail**").access("hasRole('USER') or hasRole('ADMIN')")
        .antMatchers("/user/**","/customer/**").access("hasRole('ADMIN')")
        //.antMatchers("/admin/**").access("hasRole('ADMIN')")
        //.antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")
        .anyRequest().authenticated()
        .and().formLogin().loginPage("/login.do").defaultSuccessUrl("/index.do").permitAll()//.loginProcessingUrl("/doLogin.do")
        .and().logout().permitAll();
        //.and().exceptionHandling().accessDeniedPage("/denied.do");
  
    }
}
