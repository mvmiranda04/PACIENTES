package pacientes

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class MedicamentoController {

    MedicamentoService medicamentoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond medicamentoService.list(params), model:[medicamentoCount: medicamentoService.count()]
    }

    def show(Long id) {
        respond medicamentoService.get(id)
    }

    def create() {
        respond new Medicamento(params)
    }

    def save(Medicamento medicamento) {
        if (medicamento == null) {
            notFound()
            return
        }

        try {
            medicamentoService.save(medicamento)
        } catch (ValidationException e) {
            respond medicamento.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), medicamento.id])
                redirect medicamento
            }
            '*' { respond medicamento, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond medicamentoService.get(id)
    }

    def update(Medicamento medicamento) {
        if (medicamento == null) {
            notFound()
            return
        }

        try {
            medicamentoService.save(medicamento)
        } catch (ValidationException e) {
            respond medicamento.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), medicamento.id])
                redirect medicamento
            }
            '*'{ respond medicamento, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        medicamentoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
