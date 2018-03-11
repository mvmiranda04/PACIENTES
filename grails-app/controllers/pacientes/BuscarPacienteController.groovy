package pacientes

class BuscarPacienteController {

    def index() {
        render(view: 'index')
    }

    def buscar() {
        if (!params.nro_docu && !params.apellido) {
            flash.error="Debe ingresar Criterio de busqueda."
            redirect(controller: "paciente", action:"index")
        }
        if (params.nro_docu) {
            def DNI = params.nro_docu
            def paciente= Paciente.findByNro_docu(DNI)
            if (paciente) {
                redirect(controller: "paciente", action:"show", id: paciente.id)
            } else {
               flash.error="No se encontro Paciente con el DNI ingresado."
            }
        }
        if (params.apellido ) {
            def apellido = params.apellido
            def paciente= Paciente.findByAllapellido(apellido)
            if (paciente) {
                redirect(controller: "paciente", action:"show", id: paciente.id)
            } else {
               flash.error="No se encontro Paciente con el DNI ingresado."
            }
        }



    }
}
