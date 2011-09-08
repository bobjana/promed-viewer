class Incident {

    static constraints = {
    }

    static mapping = {
        table "dsv_PromedIncidents"
        version false
        columns {
            id column: "IncidentId"
			reference column: "InternalReference"
			createdOn column: "IncidentCreatedDateStamp"
			dueBy column: "DueByDate"
            closedOn column: "CloseDate"
            incidentType column: "IncidentTypeDescription"
            incidentTypeGroup column: "IncidentTypeGroup"
            branch column: "IncidentCatDescription"
            outline column: "IncidentOutline"
            statusId column: "IncidentStatusID"
            statusDescription column: "IncidentStatusDescription"
            priority column: "PriorityDescription"
            agent column: "CurrentAgentName"
            agentEmail column: "CurrentAgentEmail"
            worker column: "WorkerName"
            customer column: "DebtorName"
            customerContactPerson column: "ContactPerson"
            customerTel1 column: "Tel1"
            customerTel2 column: "Tel2"
            customerCell column: "Cell"
            customerEmail column: "Email"
            attachment column: "Attachments"
        }
    }

    String reference
    Date createdOn
    Date dueBy
    Date closedOn
    String incidentType
    String incidentTypeGroup
    String branch
    String outline
    String statusId
    String statusDescription
    String priority
    String agent
    String agentEmail
    String worker
    String customer
    String customerContactPerson
    String customerTel1
    String customerTel2
    String customerCell
    String customerEmail
    boolean attachment

}
