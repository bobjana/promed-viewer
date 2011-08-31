import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UsernameNotFoundException

class UserDetailsService implements GrailsUserDetailsService {

	static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]

	def springSecurityService
	def authenticationManager
    def dataSource

	UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException {
		return loadUserByUsername(username)
	}

	UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        groovy.sql.Sql sql = new groovy.sql.Sql(dataSource)
        def userDetailsSQL = """
        Select cWorkerCode, cWorkerName, cRole, cPassword, idworkers from dtblWorkerPwd, _etblWorkers
            where iworkerid = idworkers
            and bActive = 1
            and cWorkerName = ${username}
        """
        def userDetails = null
        sql.eachRow(userDetailsSQL,
            { data ->
                userDetails = new UserDetails(data[1], springSecurityService.encodePassword(data[3]), true, true, true, true, getAuthorities(data[2]) ?: NO_ROLES, data[4], data[1])
            }
        )
        if (userDetails == null){
            throw new UsernameNotFoundException('User not found', username)
        }
        return userDetails
    }

    List<GrantedAuthorityImpl> getAuthorities(String roles) {
        List<String> roleList = roles.split(",")
        return roleList.collect { new GrantedAuthorityImpl(it.toUpperCase())}
    }


}