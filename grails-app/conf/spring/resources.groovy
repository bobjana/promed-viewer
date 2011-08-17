// Place your Spring DSL code here
beans = {

    userDetailsService(UserDetailsService){
	    springSecurityService = ref("springSecurityService")
	    authenticationManager = ref("authenticationManager")
	    dataSource = ref("dataSource")
    }

}
