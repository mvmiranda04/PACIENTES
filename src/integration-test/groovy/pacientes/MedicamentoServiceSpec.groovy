package pacientes

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MedicamentoServiceSpec extends Specification {

    MedicamentoService medicamentoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Medicamento(...).save(flush: true, failOnError: true)
        //new Medicamento(...).save(flush: true, failOnError: true)
        //Medicamento medicamento = new Medicamento(...).save(flush: true, failOnError: true)
        //new Medicamento(...).save(flush: true, failOnError: true)
        //new Medicamento(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //medicamento.id
    }

    void "test get"() {
        setupData()

        expect:
        medicamentoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Medicamento> medicamentoList = medicamentoService.list(max: 2, offset: 2)

        then:
        medicamentoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        medicamentoService.count() == 5
    }

    void "test delete"() {
        Long medicamentoId = setupData()

        expect:
        medicamentoService.count() == 5

        when:
        medicamentoService.delete(medicamentoId)
        sessionFactory.currentSession.flush()

        then:
        medicamentoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Medicamento medicamento = new Medicamento()
        medicamentoService.save(medicamento)

        then:
        medicamento.id != null
    }
}
