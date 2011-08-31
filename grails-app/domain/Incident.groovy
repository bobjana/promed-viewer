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
            agentEmail column: "CurrentAgentEmail"
            worker column: "WorkerName"
//			incidentTypeGroup_id column: "IncidentTypeGroupID"
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
    String agentEmail
    String worker
//	IncidentTypeGroup incidentTypeGroup

}
