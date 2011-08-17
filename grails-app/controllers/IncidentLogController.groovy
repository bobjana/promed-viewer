import org.springframework.dao.DataIntegrityViolationException

class IncidentLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [incidentLogInstanceList: IncidentLog.list(params), incidentLogInstanceTotal: IncidentLog.count()]
    }

    def create() {
        [incidentLogInstance: new IncidentLog(params)]
    }

    def save() {
        def incidentLogInstance = new IncidentLog(params)
        if (!incidentLogInstance.save(flush: true)) {
            render(view: "create", model: [incidentLogInstance: incidentLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), incidentLogInstance.id])
        redirect(action: "show", id: incidentLogInstance.id)
    }

    def show() {
        def incidentLogInstance = IncidentLog.get(params.id)
        if (!incidentLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "list")
            return
        }

        [incidentLogInstance: incidentLogInstance]
    }

    def edit() {
        def incidentLogInstance = IncidentLog.get(params.id)
        if (!incidentLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "list")
            return
        }

        [incidentLogInstance: incidentLogInstance]
    }

    def update() {
        def incidentLogInstance = IncidentLog.get(params.id)
        if (!incidentLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (incidentLogInstance.version > version) {
                incidentLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'incidentLog.label', default: 'IncidentLog')] as Object[],
                        "Another user has updated this IncidentLog while you were editing")
                render(view: "edit", model: [incidentLogInstance: incidentLogInstance])
                return
            }
        }

        incidentLogInstance.properties = params

        if (!incidentLogInstance.save(flush: true)) {
            render(view: "edit", model: [incidentLogInstance: incidentLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), incidentLogInstance.id])
        redirect(action: "show", id: incidentLogInstance.id)
    }

    def delete() {
        def incidentLogInstance = IncidentLog.get(params.id)
        if (!incidentLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "list")
            return
        }

        try {
            incidentLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'incidentLog.label', default: 'IncidentLog'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
