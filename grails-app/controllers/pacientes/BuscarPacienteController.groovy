package pacientes

class BuscarPacienteController {

    def index() {
        render(view: 'index')
    }

    def buscar() {
        if (!params.nro_docu && !params.apellido) {
            flash.message="Debe ingresar Criterio de busqueda."
            redirect(controller: "paciente", action:"index")
        }
        if (params.nro_docu) {
            def DNI = params.nro_docu
            def paciente= Paciente.findByNro_docu(DNI)
            if (paciente) {
                redirect(controller: "paciente", action:"show", id: paciente.id)
            } else {
                flash.message="No se encontro Paciente con el DNI ingresado."
                redirect(action:"index")
            }
        }
        if (params.apellido ) {
            def apellido = params.apellido
            def pacienteInstance = Paciente.findAllByApellidoIlike('%'+apellido+'%')
            if (pacienteInstance){
                render(view:"buscar",model:[ pacienteInstanceList:pacienteInstance ])
            }else {
                flash.message="No se encontro Paciente con el Apellido ingresado."
                redirect(action:"index")
            }

        }

    }
}
