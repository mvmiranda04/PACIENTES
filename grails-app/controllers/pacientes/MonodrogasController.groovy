package pacientes

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class MonodrogasController {

    MonodrogasService monodrogasService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond monodrogasService.list(params), model:[monodrogasCount: monodrogasService.count()]
    }

    def show(Long id) {
        respond monodrogasService.get(id)
    }

    def create() {
        respond new Monodrogas(params)
    }

    def save(Monodrogas monodrogas) {
        if (monodrogas == null) {
            notFound()
            return
        }

        try {
            monodrogasService.save(monodrogas)
        } catch (ValidationException e) {
            respond monodrogas.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'monodrogas.label', default: 'Monodrogas'), monodrogas.id])
                redirect monodrogas
            }
            '*' { respond monodrogas, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond monodrogasService.get(id)
    }

    def update(Monodrogas monodrogas) {
        if (monodrogas == null) {
            notFound()
            return
        }

        try {
            monodrogasService.save(monodrogas)
        } catch (ValidationException e) {
            respond monodrogas.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'monodrogas.label', default: 'Monodrogas'), monodrogas.id])
                redirect monodrogas
            }
            '*'{ respond monodrogas, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        monodrogasService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'monodrogas.label', default: 'Monodrogas'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'monodrogas.label', default: 'Monodrogas'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
