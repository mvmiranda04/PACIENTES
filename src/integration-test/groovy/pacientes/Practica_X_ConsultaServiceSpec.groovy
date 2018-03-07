package pacientes

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class Practica_X_ConsultaServiceSpec extends Specification {

    Practica_X_ConsultaService practica_X_ConsultaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Practica_X_Consulta(...).save(flush: true, failOnError: true)
        //new Practica_X_Consulta(...).save(flush: true, failOnError: true)
        //Practica_X_Consulta practica_X_Consulta = new Practica_X_Consulta(...).save(flush: true, failOnError: true)
        //new Practica_X_Consulta(...).save(flush: true, failOnError: true)
        //new Practica_X_Consulta(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //practica_X_Consulta.id
    }

    void "test get"() {
        setupData()

        expect:
        practica_X_ConsultaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Practica_X_Consulta> practica_X_ConsultaList = practica_X_ConsultaService.list(max: 2, offset: 2)

        then:
        practica_X_ConsultaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        practica_X_ConsultaService.count() == 5
    }

    void "test delete"() {
        Long practica_X_ConsultaId = setupData()

        expect:
        practica_X_ConsultaService.count() == 5

        when:
        practica_X_ConsultaService.delete(practica_X_ConsultaId)
        sessionFactory.currentSession.flush()

        then:
        practica_X_ConsultaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Practica_X_Consulta practica_X_Consulta = new Practica_X_Consulta()
        practica_X_ConsultaService.save(practica_X_Consulta)

        then:
        practica_X_Consulta.id != null
    }
}
