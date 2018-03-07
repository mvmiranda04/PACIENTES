package pacientes

import grails.gorm.services.Service

@Service(Monodrogas)
interface MonodrogasService {

    Monodrogas get(Serializable id)

    List<Monodrogas> list(Map args)

    Long count()

    void delete(Serializable id)

    Monodrogas save(Monodrogas monodrogas)

}