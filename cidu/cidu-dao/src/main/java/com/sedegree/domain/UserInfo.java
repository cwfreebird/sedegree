package com.sedegree.domain;

import java.util.List;

public class UserInfo {
    private Long id;

    private String loginId;

    private String password;

    private String username;

    private String state;
    
    private List<ProfileInfo> profiles;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId == null ? null : loginId.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public List<ProfileInfo> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<ProfileInfo> profiles) {
		this.profiles = profiles;
	}
}