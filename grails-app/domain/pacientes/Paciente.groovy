package pacientes

class Paciente {

    static hasMany = [consultas:Consulta]
    String tipo_docu
    BigInteger nro_docu
    String apellido
    String nombre
    String sexo
    Date fecha_nac
    String domicilio
    String telefono
    String email
    String observaciones


    static constraints = {
        tipo_docu (blank: false)
    nro_docu (blank: false, unique: true)
        apellido (blank: false, maxSize:200)
        nombre (blank: false, maxSize:200)
        sexo(inList:['F','M'])
        email(email:true,nullable: true)
        observaciones(nullable: true)
    }

}
