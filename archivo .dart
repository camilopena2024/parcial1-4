class Estudiante {
  String cedula;
  String nombre;
  String apellido;
  String fechaNac;
  List<double> notas;
  double promedio;
  String direccion;
  String telefono;

  Estudiante(this.cedula, this.nombre, this.apellido, this.fechaNac, this.direccion, this.telefono, this.notas);

  void cambiarDireccion(String nuevaDireccion) {
    direccion = nuevaDireccion;
  }

  void mostrarUsuario() {
    print("Cedula $cedula");
    print("Nombre $nombre");
    print("Apellido $apellido");
    print("Fecha de Nacimiento $fechaNac");
    print("Notas $notas");
    print("Promedio $promedio");
    print("Direccion $direccion");
    print("Telefono $telefono");
  }

  void calcularPromedio() {
    double sumaNotas = 0;
    for (double nota in notas) {
      sumaNotas += nota;
    }
    promedio = sumaNotas / notas.length;
  }
}
