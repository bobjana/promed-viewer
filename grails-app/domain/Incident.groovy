class Incident {

    static constraints = {
    }

    static mapping = {
        table "_rvIncidentsFull"
        version false
        columns {
            id column: "IncidentId"
			reference column: "InternalReference"
			createdOn column: "IncidentCreatedDateStamp"
			dueBy column: "DueByDate"
            incidentType column: "IncidentTypeDescription"
            outline column: "IncidentOutline"
            statusId column: "IncidentStatusID"
            statusDescription column: "IncidentStatusDescription"
            priority column: "PriorityDescription"
            customer column: "DebtorName"
            agent column: "CurrentAgentName"
            worker column: "WorkerName"
        }
    }

    String reference
    Date createdOn
    Date dueBy
    String incidentType
    String outline
    String statusId
    String statusDescription
    String priority
    String customer
    String agent
    String worker

}
