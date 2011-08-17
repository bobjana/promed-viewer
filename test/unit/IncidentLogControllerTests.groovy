import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(IncidentLogController)
@Mock(IncidentLog)
class IncidentLogControllerTests {

    void testIndex() {
        controller.index()
        assert "/incidentLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.incidentLogInstanceList.size() == 0
        assert model.incidentLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.incidentLogInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.incidentLogInstance != null
        assert view == '/incidentLog/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/incidentLog/show/1'
        assert controller.flash.message != null
        assert IncidentLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentLog/list'


        def incidentLog = new IncidentLog()

        // TODO: populate domain properties

        assert incidentLog.save() != null

        params.id = incidentLog.id

        def model = controller.show()

        assert model.incidentLogInstance == incidentLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentLog/list'


        def incidentLog = new IncidentLog()

        // TODO: populate valid domain properties

        assert incidentLog.save() != null

        params.id = incidentLog.id

        def model = controller.edit()

        assert model.incidentLogInstance == incidentLog
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/incidentLog/list'

        response.reset()


        def incidentLog = new IncidentLog()

        // TODO: populate valid domain properties

        assert incidentLog.save() != null

        // test invalid parameters in update
        params.id = incidentLog.id

        controller.update()

        assert view == "/incidentLog/edit"
        assert model.incidentLogInstance != null

        incidentLog.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/incidentLog/show/$incidentLog.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/incidentLog/list'

        response.reset()

        def incidentLog = new IncidentLog()

        // TODO: populate valid domain properties
        assert incidentLog.save() != null
        assert IncidentLog.count() == 1

        params.id = incidentLog.id

        controller.delete()

        assert IncidentLog.count() == 0
        assert IncidentLog.get(incidentLog.id) == null
        assert response.redirectedUrl == '/incidentLog/list'
    }
}
