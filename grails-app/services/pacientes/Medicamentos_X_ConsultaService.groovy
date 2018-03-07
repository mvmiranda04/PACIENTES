package pacientes

import grails.gorm.services.Service

@Service(Medicamentos_X_Consulta)
interface Medicamentos_X_ConsultaService {

    Medicamentos_X_Consulta get(Serializable id)

    List<Medicamentos_X_Consulta> list(Map args)

    Long count()

    void delete(Serializable id)

    Medicamentos_X_Consulta save(Medicamentos_X_Consulta medicamentos_X_Consulta)

}