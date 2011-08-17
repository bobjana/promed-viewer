

class User {

    static mapping = {
        table "_etblWorkers"
        version false
        columns {
            id column: "idWorkers"
			username column: "cWorkerCode"
			fullName column: "cWorkerName"
        }
    }

    String username
    String fullName
}
