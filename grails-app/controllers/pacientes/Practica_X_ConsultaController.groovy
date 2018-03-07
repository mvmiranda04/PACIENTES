package pacientes

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class Practica_X_ConsultaController {

    Practica_X_ConsultaService practica_X_ConsultaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond practica_X_ConsultaService.list(params), model:[practica_X_ConsultaCount: practica_X_ConsultaService.count()]
    }

    def show(Long id) {
        respond practica_X_ConsultaService.get(id)
    }

    def create() {
        respond new Practica_X_Consulta(params)
    }

    def save(Practica_X_Consulta practica_X_Consulta) {
        if (practica_X_Consulta == null) {
            notFound()
            return
        }

        try {
            practica_X_ConsultaService.save(practica_X_Consulta)
        } catch (ValidationException e) {
            respond practica_X_Consulta.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'practica_X_Consulta.label', default: 'Practica_X_Consulta'), practica_X_Consulta.id])
                redirect practica_X_Consulta
            }
            '*' { respond practica_X_Consulta, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond practica_X_ConsultaService.get(id)
    }

    def update(Practica_X_Consulta practica_X_Consulta) {
        if (practica_X_Consulta == null) {
            notFound()
            return
        }

        try {
            practica_X_ConsultaService.save(practica_X_Consulta)
        } catch (ValidationException e) {
            respond practica_X_Consulta.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'practica_X_Consulta.label', default: 'Practica_X_Consulta'), practica_X_Consulta.id])
                redirect practica_X_Consulta
            }
            '*'{ respond practica_X_Consulta, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        practica_X_ConsultaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'practica_X_Consulta.label', default: 'Practica_X_Consulta'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'practica_X_Consulta.label', default: 'Practica_X_Consulta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
