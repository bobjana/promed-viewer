class IncidentTypeGroup implements Serializable {

    static mapping = {
        table "_btblCMIncidentTypeGroup"
        version false
        columns {
            id column: "idIncidentTypeGroup"
            description column: "CdESCRIPTION"
        }
    }

    String description
}
