package pacientes

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MonodrogasServiceSpec extends Specification {

    MonodrogasService monodrogasService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Monodrogas(...).save(flush: true, failOnError: true)
        //new Monodrogas(...).save(flush: true, failOnError: true)
        //Monodrogas monodrogas = new Monodrogas(...).save(flush: true, failOnError: true)
        //new Monodrogas(...).save(flush: true, failOnError: true)
        //new Monodrogas(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //monodrogas.id
    }

    void "test get"() {
        setupData()

        expect:
        monodrogasService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Monodrogas> monodrogasList = monodrogasService.list(max: 2, offset: 2)

        then:
        monodrogasList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        monodrogasService.count() == 5
    }

    void "test delete"() {
        Long monodrogasId = setupData()

        expect:
        monodrogasService.count() == 5

        when:
        monodrogasService.delete(monodrogasId)
        sessionFactory.currentSession.flush()

        then:
        monodrogasService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Monodrogas monodrogas = new Monodrogas()
        monodrogasService.save(monodrogas)

        then:
        monodrogas.id != null
    }
}
