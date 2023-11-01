package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.app.dto.UserDTO;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private AdminService service;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		UserDTO dto = service.findUser(userid);
		
		if(dto == null) {
			throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + userid );
		}
		
		UserDetails userDetails = User.withUsername(dto.getUserid())
										.password(dto.getPassword())
										.roles(dto.getRole()).build();

								
		return userDetails;
	}

}
