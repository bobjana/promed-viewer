dataSource {
    pooled = true
    driverClassName = "net.sourceforge.jtds.jdbc.Driver"
    username = "sa"
    password = "neojl1vN@lyd"
    url = "jdbc:jtds:sqlserver://localhost:8433/Promed Computer;instance=sql2008;"
    logSql = true
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
//environments {
//   development {
//        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb"
//        }
//    }
//    test {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb"
//        }
//    }
//    production {
//       dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:prodDb"
//        }
//    }
//}
