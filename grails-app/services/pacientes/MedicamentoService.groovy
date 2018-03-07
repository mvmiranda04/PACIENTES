package pacientes

import grails.gorm.services.Service

@Service(Medicamento)
interface MedicamentoService {

    Medicamento get(Serializable id)

    List<Medicamento> list(Map args)

    Long count()

    void delete(Serializable id)

    Medicamento save(Medicamento medicamento)

}