package pacientes

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class Medicamentos_X_ConsultaServiceSpec extends Specification {

    Medicamentos_X_ConsultaService medicamentos_X_ConsultaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Medicamentos_X_Consulta(...).save(flush: true, failOnError: true)
        //new Medicamentos_X_Consulta(...).save(flush: true, failOnError: true)
        //Medicamentos_X_Consulta medicamentos_X_Consulta = new Medicamentos_X_Consulta(...).save(flush: true, failOnError: true)
        //new Medicamentos_X_Consulta(...).save(flush: true, failOnError: true)
        //new Medicamentos_X_Consulta(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //medicamentos_X_Consulta.id
    }

    void "test get"() {
        setupData()

        expect:
        medicamentos_X_ConsultaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Medicamentos_X_Consulta> medicamentos_X_ConsultaList = medicamentos_X_ConsultaService.list(max: 2, offset: 2)

        then:
        medicamentos_X_ConsultaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        medicamentos_X_ConsultaService.count() == 5
    }

    void "test delete"() {
        Long medicamentos_X_ConsultaId = setupData()

        expect:
        medicamentos_X_ConsultaService.count() == 5

        when:
        medicamentos_X_ConsultaService.delete(medicamentos_X_ConsultaId)
        sessionFactory.currentSession.flush()

        then:
        medicamentos_X_ConsultaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Medicamentos_X_Consulta medicamentos_X_Consulta = new Medicamentos_X_Consulta()
        medicamentos_X_ConsultaService.save(medicamentos_X_Consulta)

        then:
        medicamentos_X_Consulta.id != null
    }
}
