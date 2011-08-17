

import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(IncidentController)
@Mock(Incident)
class IncidentControllerTests {

    void testIndex() {
        controller.index()
        assert "/incident/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.incidentInstanceList.size() == 0
        assert model.incidentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.incidentInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.incidentInstance != null
        assert view == '/incident/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/incident/show/1'
        assert controller.flash.message != null
        assert Incident.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'


        def incident = new Incident()

        // TODO: populate domain properties

        assert incident.save() != null

        params.id = incident.id

        def model = controller.show()

        assert model.incidentInstance == incident
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'


        def incident = new Incident()

        // TODO: populate valid domain properties

        assert incident.save() != null

        params.id = incident.id

        def model = controller.edit()

        assert model.incidentInstance == incident
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'

        response.reset()


        def incident = new Incident()

        // TODO: populate valid domain properties

        assert incident.save() != null

        // test invalid parameters in update
        params.id = incident.id

        controller.update()

        assert view == "/incident/edit"
        assert model.incidentInstance != null

        incident.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/incident/show/$incident.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/incident/list'

        response.reset()

        def incident = new Incident()

        // TODO: populate valid domain properties
        assert incident.save() != null
        assert Incident.count() == 1

        params.id = incident.id

        controller.delete()

        assert Incident.count() == 0
        assert Incident.get(incident.id) == null
        assert response.redirectedUrl == '/incident/list'
    }
}
