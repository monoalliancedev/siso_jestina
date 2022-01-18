package com.jt.config;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.jt.service.AdmLoginService;
import com.jt.service.AuthFailureHandler;
import com.jt.service.AuthSuccessHandler;

	@Configuration
	@EnableWebSecurity
	@EnableGlobalAuthentication
	public class WebSecurityConfig extends WebSecurityConfigurerAdapter  {

		@Autowired
		//private AdmLoginService accountService;

		//Logger log = LoggerFactory.getLogger(this.getClass());
		
		@Bean
		public HttpFirewall defaultHttpFirewall() {
		    return new DefaultHttpFirewall();
		}
		
		//@Autowired
	    //AuthProvider authProvider;
	    
	    @Autowired
	    AuthFailureHandler authFailureHandler;
	 
	    @Autowired
	    AuthSuccessHandler authSuccessHandler;
	    
	    @Autowired
		private AdmLoginService accountService;

			
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.headers().frameOptions().sameOrigin();
			
			http.authorizeRequests() //보호된 리소스 URL에 접근할수 있는 권한을 설정
				.antMatchers("/jtadm/**").authenticated() //.anyRequest().authenticated() : 인증이 되어야 한다는 이야기이다.			
				.anyRequest().permitAll() //전체접근허용
				.and()
			.formLogin()
				.loginPage("/jtadm/login")
				.permitAll()
				.defaultSuccessUrl("/jtadm/")			
				.failureHandler(authFailureHandler)
	            .successHandler(authSuccessHandler)
	            //.usernameParameter("username")
	            //.passwordParameter("password")
				.and()
			.logout()
				.logoutUrl("/jtadm/logout")
				.logoutSuccessUrl("/jtadm/login")
				.invalidateHttpSession(true)
				.permitAll()
				.and()
			//로그인 프로세스가 진행될 provider
	        //.authenticationProvider(authProvider);
		
			;
		}
		
		 
		/*스프링 시큐리티 룰을 무시하게 하는 URL*/
		@Override
	    public void configure(WebSecurity web) throws Exception    
	    {
			web.httpFirewall(defaultHttpFirewall());
			//log.info("1111111111111111111111===========================================");
	        // static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
	        web.ignoring().antMatchers("/"
	        						, "/css/**",  "/images/**"
	        						, "/common/**" ,"/scripts/**"
	        						, "/UploadFiles/**" ,"/video/**"
	        						, "/jtadm/css/**", "/jtadm/images/**", "/jtadm/scripts/**"
	        						, "/kr/**","/en/**", "/cn/**", "/error");
	    }
		
		
		//스프링 시큐리티가 사용자를 인증하는 방법이 담긴 객체
		@Override 
	    public void configure(AuthenticationManagerBuilder auth) throws Exception
	    {
			System.out.println("22222222222222222222222===========================================");
			auth.userDetailsService(accountService).passwordEncoder(accountService.passwordEncoder());
	    }
		
		
	    
		//------------------------------------------------------------------------------------------------
		/*
		public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
	        
			if (this.postOnly && !request.getMethod().equals("POST")) {
	            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
	        } else {
	            String username = this.obtainUsername(request);
	            username = username != null ? username : "";
	            username = username.trim();
	            String password = this.obtainPassword(request);
	            password = password != null ? password : "";
	            UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
	            this.setDetails(request, authRequest);
	            return this.getAuthenticationManager().authenticate(authRequest);
	        }
			
			
			
	    }
		//UsenamePasswordAuthenticationFilter 인증관리자 //접근 결정 관리자는 FilterSecurityInterceptor
		*/
		//------------------------------------------------------------------------------------------------
		

}