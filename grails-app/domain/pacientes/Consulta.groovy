package pacientes

class Consulta {
        static belongsTo =[paciente:Paciente]
        static hasMany = [practicas:Practica_X_Consulta, medicamento:Medicamentos_X_Consulta]

        Date fecha_consulta
        String hora_consulta
        String diagnostico
        String tratamiento
        String motivo_consulta


        static constraints = {
            fecha_consulta (blank: false, maxSize:200)
            hora_consulta (blank: false, maxSize:200)
        }
}
