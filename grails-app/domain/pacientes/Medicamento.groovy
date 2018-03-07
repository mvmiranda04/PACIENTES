package pacientes

class Medicamento {
    String des_medicamento
    static hasMany = [monodrogas:Monodrogas]

    static constraints = {
        des_medicamento (maxSize:200)
    }
}
