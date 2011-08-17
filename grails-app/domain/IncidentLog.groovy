class IncidentLog implements Serializable {

    static constraints = {
    }

    static mapping = {
        table "_rvIncidentLogFull"
        version false
        columns {
            id column: "IncidentLogID"
            incidentId column: "IncidentID"
            date column: "dActionDate"
            resolution column: "IncidentActionResolution"
        }
    }

    Date date
    String resolution
    long incidentId
}
