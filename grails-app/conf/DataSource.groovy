dataSource {
    pooled = true
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
    username = ""
    password = ""
    url = ""
    logSql = false
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
