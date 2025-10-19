module escuela::escuela {
    use std::string::String;
    use sui::vec_map::{VecMap, Self};

    public struct Escuela has key {
        id: UID,
        nombre: String,
        alumnos: VecMap<Matricula, Alumno>,
    }

    public struct Alumno has store, drop, copy {
        nombre: String,
        edad: u8,
        promedio: u8,
        inscrito: bool,
    }

    public struct Matricula has store, drop, copy {
        value: u16
    }

    // Crear una escuela
    public fun crear_escuela(nombre: String, ctx: &mut TxContext) {
        let escuela = Escuela {
            id: object::new(ctx),
            nombre,
            alumnos: vec_map::empty(),
        };

        transfer::transfer(escuela, tx_context::sender(ctx));
    }

    // Agregar un alumno
    public fun agregar_alumno(nombre: String, edad: u8, promedio: u8, matricula: u16, escuela: &mut Escuela) {
        let alumno = Alumno {
            nombre,
            edad,
            promedio,
            inscrito: true,
        };

        let matricula = Matricula { value: matricula };
        escuela.alumnos.insert(matricula, alumno);
    }

    // Eliminar alumno
    public fun eliminar_alumno(matricula: u16, escuela: &mut Escuela) {
        let matricula = Matricula { value: matricula };
        escuela.alumnos.remove(&matricula);
    }

    // Cambiar estado de inscripción (inscrito / dado de baja)
    public fun cambiar_estado_inscripcion(matricula: u16, escuela: &mut Escuela) {
        let matricula = Matricula { value: matricula };
        let alumno = escuela.alumnos.get_mut(&matricula);
        alumno.inscrito = !alumno.inscrito;
    }

    // Actualizar promedio
    public fun actualizar_promedio(matricula: u16, nuevo_promedio: u8, escuela: &mut Escuela) {
        let matricula = Matricula { value: matricula };
        let alumno = escuela.alumnos.get_mut(&matricula);
        alumno.promedio = nuevo_promedio;
    }

    //Eliminar la escuela
    public fun eliminar_escuela(escuela: Escuela) {
        let Escuela { id, alumnos: _, nombre: _ } = escuela;
        id.delete();
    }

}
