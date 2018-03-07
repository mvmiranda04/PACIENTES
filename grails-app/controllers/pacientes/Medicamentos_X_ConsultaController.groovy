package pacientes

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class Medicamentos_X_ConsultaController {

    Medicamentos_X_ConsultaService medicamentos_X_ConsultaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond medicamentos_X_ConsultaService.list(params), model:[medicamentos_X_ConsultaCount: medicamentos_X_ConsultaService.count()]
    }

    def show(Long id) {
        respond medicamentos_X_ConsultaService.get(id)
    }

    def create() {
        respond new Medicamentos_X_Consulta(params)
    }

    def save(Medicamentos_X_Consulta medicamentos_X_Consulta) {
        if (medicamentos_X_Consulta == null) {
            notFound()
            return
        }

        try {
            medicamentos_X_ConsultaService.save(medicamentos_X_Consulta)
        } catch (ValidationException e) {
            respond medicamentos_X_Consulta.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicamentos_X_Consulta.label', default: 'Medicamentos_X_Consulta'), medicamentos_X_Consulta.id])
                redirect medicamentos_X_Consulta
            }
            '*' { respond medicamentos_X_Consulta, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond medicamentos_X_ConsultaService.get(id)
    }

    def update(Medicamentos_X_Consulta medicamentos_X_Consulta) {
        if (medicamentos_X_Consulta == null) {
            notFound()
            return
        }

        try {
            medicamentos_X_ConsultaService.save(medicamentos_X_Consulta)
        } catch (ValidationException e) {
            respond medicamentos_X_Consulta.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'medicamentos_X_Consulta.label', default: 'Medicamentos_X_Consulta'), medicamentos_X_Consulta.id])
                redirect medicamentos_X_Consulta
            }
            '*'{ respond medicamentos_X_Consulta, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        medicamentos_X_ConsultaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicamentos_X_Consulta.label', default: 'Medicamentos_X_Consulta'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicamentos_X_Consulta.label', default: 'Medicamentos_X_Consulta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
