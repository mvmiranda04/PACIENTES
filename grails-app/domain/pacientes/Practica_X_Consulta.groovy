package pacientes

class Practica_X_Consulta {

    static belongsTo = [consulta:Consulta]
    Practica practica
    String resultado_practica
    Date fecha_practica

    static constraints = {
        fecha_practica (blank:false)
        resultado_practica(maxSize:500)
    }
}
