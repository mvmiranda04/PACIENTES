package pacientes

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.converters.*

class PacienteController {

    PacienteService pacienteService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond pacienteService.list(params), model:[pacienteCount: pacienteService.count()]
    }

    def show(Long id) {
        respond pacienteService.get(id)
    }

    def create() {
        respond new Paciente(params)
    }

    def save(Paciente paciente) {
        if (paciente == null) {
            notFound()
            return
        }

        try {
            pacienteService.save(paciente)
        } catch (ValidationException e) {
            respond paciente.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paciente.label', default: 'Paciente'), paciente.id])
                redirect paciente
            }
            '*' { respond paciente, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond pacienteService.get(id)
    }

    def update(Paciente paciente) {
        if (paciente == null) {
            notFound()
            return
        }

        try {
            pacienteService.save(paciente)
        } catch (ValidationException e) {
            respond paciente.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'paciente.label', default: 'Paciente'), paciente.id])
                redirect paciente
            }
            '*'{ respond paciente, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        pacienteService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def list() {
        render(view:"list")
    }

<<<<<<< HEAD
=======
    // autocomplete: start
  	def ajaxAutoComplete = {

  		 println "inside ajaxAutocomplete...." + params

  //		println "..." + Country.list()
          if(params.autocomplete_parameter)
          {
              def input = params.autocomplete_parameter + '%'

              def list = Country.findAll("from Paciente as paciente where lower(paciente.nombre) like :nombre",  [nombre:input])

  			println "input: " + input

  			println "list: " + list
              StringBuffer idList = new StringBuffer()

              idList.append("<ul>")

                  list?.each{c -> idList.append("<li>" + c.name+"</li>")}

              idList.append("</ul>")


              render idList.toString()
          }
  	}

  	// autocomplete: end
    def ajaxFindCity = {              def input = params.autocomplete_parameter + '%'

                  def list = Country.findAll("from Paciente as paciente where lower(paciente.nombre) like :nombre",  [nombre:input])
  		}
  		//render (list?.'city' as JSON)
      //render list.toString()

 

>>>>>>> 5ee4962aac17be11ef2a40b3bbdcb0f6ea75b220

}
