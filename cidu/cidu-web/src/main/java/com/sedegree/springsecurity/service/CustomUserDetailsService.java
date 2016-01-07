package com.sedegree.springsecurity.service;
 
import java.util.ArrayList;
import java.util.List;
 





import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sedegree.domain.ProfileInfo;
import com.sedegree.domain.UserInfo;
import com.sedegree.service.IUserInfoService;
 
 
@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{
 
	private static Logger logger = Logger.getLogger(CustomUserDetailsService.class);
	
    @Autowired
    private IUserInfoService userInfoService;
     
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String loginId)
            throws UsernameNotFoundException {
        UserInfo user = userInfoService.selectUserProfileByLoginId(loginId);
        
        if(user == null){
        	logger.info("User not found :" + loginId);
            throw new UsernameNotFoundException("Username not found"); 
        }
        
        logger.info("UserInfo : [" + loginId + "] login.");
        
        return new User(user.getLoginId(), user.getPassword(), 
             user.getState().equals("Y"), true, true, true, getGrantedAuthorities(user));
    }
 
     
    private List<GrantedAuthority> getGrantedAuthorities(UserInfo user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        if(user.getProfiles() == null){
        	return authorities;
        }
        for(ProfileInfo profile : user.getProfiles()){
        	//logger.info("profile : " + profile);
            authorities.add(new SimpleGrantedAuthority("ROLE_" + profile.getRoleType()));
        }
        logger.info("authorities :" + authorities);
        return authorities;
    }
     
}