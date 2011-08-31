import grails.converters.JSON
import java.text.SimpleDateFormat
import org.apache.commons.lang.StringUtils

class IncidentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    static def df = new SimpleDateFormat("yyyy-MM-dd")
    static def ldf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
    def springSecurityService
    def dataSource


    def index() {
    }

    def jq_incident_list = {
        def sortIndex = params.sidx ?: 'reference'
        def sortOrder = params.sord ?: 'asc'
        def maxRows = Integer.valueOf(params.rows)
        def currentPage = Integer.valueOf(params.page) ?: 1
        def rowOffset = currentPage == 1 ? 0 : (currentPage - 1) * maxRows

        def incidents = listIncidents(maxRows, rowOffset, sortIndex, sortOrder)
        def totalRows = incidents.totalCount
        def numberOfPages = Math.ceil(totalRows / maxRows)

        def jsonCells = incidents.collect {
            [cell:
                [it.reference,
                df.format(it.createdOn),
                df.format(it.dueBy),
                it.incidentType,
                it.outline,
                it.statusDescription,
                it.priority,
                it.customer,
                it.agent,
                it.agentEmail],
            id: it.id]
        }
        def jsonData = [rows: jsonCells, page: currentPage, records: totalRows, total: numberOfPages]
        render jsonData as JSON
    }

    def jq_incidentlog_list() {
        def incidentLogs = IncidentLog.findAllByIncidentId(params.id, [sort: "date", order: "desc"])
        def jsonCells = incidentLogs.collect {
          [cell:[
              df.format(it.date),
              it.resolution,
              it.type,
              it.agent
            ]
          ]
        }
        def jsonData = [rows: jsonCells]
        render jsonData as JSON
    }


    def toggleShowAll() {
        if (!session.showAll) {
            session["showAll"] = true
        }
        else {
            session["showAll"] = false
        }
        redirect(uri: "/incident")
    }

    def logs() {
        def incidentLogs = IncidentLog.findAllByIncidentId(params.incidentId, [sort: "date", order: "desc"])
        for (def log in incidentLogs) {
            println log.resolution
        }
        [incidentLogInstanceList: incidentLogs]
    }

    private List listIncidents(int maxRows, int rowOffset, String sortIndex, String sortOrder) {
        def criteria = Incident.createCriteria()
        def query = {
            eq('worker', springSecurityService.getCurrentUser().fullName)
            if (!session.showAll) {
                ne('statusId', '3')
            }
            println params.createdOn

            if (params.reference)
                ilike('reference', params.reference + '%')
            if (params.createdOn)
                between('createdOn',getStartDate(params.createdOn),getEndDate(params.createdOn))
            if (params.dueBy)
                between('dueBy',getStartDate(params.dueBy),getEndDate(params.dueBy))
            if (params.incidentType)
                ilike('incidentType', params.incidentType + '%')
            if (params.outline)
                ilike('outline', '%' + params.outline + '%')
            if (params.statusDescription)
                ilike('statusDescription', params.statusDescription + '%')
            if (params.priority)
                ilike('priority', params.priority + '%')
            if (params.customer)
                ilike('customer', params.customer + '%')
            if (params.agent)
                ilike('agent', params.agent + '%')
            order(sortIndex, sortOrder)
        }
        def incidents = criteria.list(query, max: maxRows, offset: rowOffset)
        return incidents
    }

    private Date getStartDate(String date){
        if (date.endsWith("-")){
            StringUtils.removeEnd(date,"-")
        }
        try {
            def result
            switch (date.length()){
                case 4:
                    result = ldf.parse(date + "-01-01 00:00:00")
                    break
                case 7:
                    result = ldf.parse(date + "-01 00:00:00")
                    break
                default:
                    result = ldf.parse(date + " 00:00:00")
            }
            return result
        } catch (Exception) {
            log.error("Invalid date specified - " + date)
        }
    }

    private Date getEndDate(String date){
        if (date.endsWith("-")){
            StringUtils.removeEnd(date,"-")
        }
        try {
            def result
            switch (date.length()){
                case 4:
                    result = ldf.parse(date + "-12-31 23:59:59")
                    break
                case 7:
                    result = ldf.parse(date + "-31 23:59:59")
                    break
                default:
                    result = ldf.parse(date + " 23:59:59")
            }
            return result
        } catch (Exception) {
            log.error("Invalid date specified - " + date)
        }
    }

}
