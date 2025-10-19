# Escuela 

**Proyecto de Certificación**

Este proyecto implementa un **sistema de registro de alumnos** en Move, usando objetos (`struct`) y `VecMap`.  
Permite crear escuelas, agregar alumnos, modificar información, cambiar estados y eliminar registros.

Estructura del proyecto

- **Módulo:** `escuela::escuela`
- **Structs principales:**
  - `Escuela`: representa la escuela y contiene todos los alumnos.
  - `Alumno`: información de cada alumno (nombre, edad, promedio, inscrito).
  - `Matricula`: clave única para cada alumno dentro del `VecMap`.

**Funciones**

1. **`crear_escuela(nombre: String, ctx: &mut TxContext)`**  
   Crea una nueva escuela vacía y la asigna al creador de la transacción.

2. **`agregar_alumno(nombre: String, edad: u8, promedio: u8, matricula: u16, escuela: &mut Escuela)`**  
   Agrega un nuevo alumno a la escuela con su matrícula única.

3. **`eliminar_alumno(matricula: u16, escuela: &mut Escuela)`**  
   Elimina un alumno existente según su matrícula.

4. **`cambiar_estado_inscripcion(matricula: u16, escuela: &mut Escuela)`**  
   Cambia el estado de inscripción de un alumno (inscrito / dado de baja).

5. **`actualizar_promedio(matricula: u16, nuevo_promedio: u8, escuela: &mut Escuela)`**  
   Actualiza el promedio académico de un alumno.

6. **`eliminar_escuela(escuela: Escuela)`**  
   Elimina completamente la escuela y todos sus alumnos.

);
