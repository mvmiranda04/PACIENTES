package pacientes

import grails.gorm.services.Service

@Service(Practica_X_Consulta)
interface Practica_X_ConsultaService {

    Practica_X_Consulta get(Serializable id)

    List<Practica_X_Consulta> list(Map args)

    Long count()

    void delete(Serializable id)

    Practica_X_Consulta save(Practica_X_Consulta practica_X_Consulta)

}