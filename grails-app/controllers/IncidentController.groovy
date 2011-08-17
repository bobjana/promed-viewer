
class IncidentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def criteria = Incident.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.sort){
            params.sort = "reference"
            params.order = "desc"
        }
        def query = {
            if (!session.showAll){
                eq('worker', springSecurityService.getCurrentUser().fullName)
                ne('statusId','3')
            }
            if (params.sort) {
                order(params.sort, params.order)
            }
        }
        def incidents = criteria.list(query, max: params.max, offset: params.offset)
        [incidentInstanceList: incidents, incidentInstanceTotal: incidents.totalCount]
    }

    def toggleShowAll(){
        if (!session.showAll){
            session["showAll"] = true
        }
        else{
            session["showAll"] = false
        }
        redirect(action: "list")
    }

    def logs() {
        def incidentLogs = IncidentLog.findAllByIncidentId(params.incidentId, [sort: "date", order: "desc"])
        for (def log in incidentLogs) {
            println log.resolution
        }
        [incidentLogInstanceList: incidentLogs]
    }
}
