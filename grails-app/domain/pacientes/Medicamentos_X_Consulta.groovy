package pacientes

class Medicamentos_X_Consulta {

    Medicamento medicamento
    String indicaciones
    static belongsTo = [consulta:Consulta]


    static constraints = {
        indicaciones(maxSize:500)
    }
}
