package pacientes

class Practica {

    String des_practica

    static constraints = {
        des_practica (blank: false, maxSize:500)
    }
}
