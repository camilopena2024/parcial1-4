import "dart:io";
import "estudiante.dart";

void main() {
  List<Estudiante> listaEstudiantes = [];

  while (true) {
    print("Menu");
    print("Registrar estudiante");
    print("Mostrar informacion de estudiante");
    print("Modificar direccion");
    print("Modificar notas");
    print("Salir");
    print("Selecciona una opcion:");
    String opcion = stdin.readLineSync()!;
    switch (opcion) {
      case "1":
        registrarEstudiante(listaEstudiantes);
        break;
      case "2":
        mostrarInformacion(listaEstudiantes);
        break;
      case "3":
        modificarDireccion(listaEstudiantes);
        break;
      case "4":
        modificarNotas(listaEstudiantes);
        break;
      case "5":
        print("Salir");
        return;
      default:
        print("Esta opcion no es valida, escoje otra opcion.");
    }
  }
}

void registrarEstudiante(List<Estudiante> listaEstudiantes) {
  print("Ingrese el documento");
  String cedula = stdin.readLineSync()!;
  print("Ingrese el nombre");
  String nombre = stdin.readLineSync()!;
  print("Ingrese el apellido");
  String apellido = stdin.readLineSync()!;
  print("Ingrese la fecha de nacimiento (AAAA-MM-DD)");
  String fechaNac = stdin.readLineSync()!;
  print("Ingrese la direccion");
  String direccion = stdin.readLineSync()!;
  print("Ingrese el telefono");
  String telefono = stdin.readLineSync()!;
  print("Ingrese las notas (separadas por coma)");
  String notasInput = stdin.readLineSync()!;
  List<double> notas = notasInput.split(",").map((nota) => double.tryParse(nota) ?? 0).toList();

  Estudiante nuevoEstudiante =
      Estudiante(cedula, nombre, apellido, fechaNac, direccion, telefono, notas);
  listaEstudiantes.add(nuevoEstudiante);

  print("Estudiante registrado");
}

void mostrarInformacion(List<Estudiante> listaEstudiantes) {
  print("Ingrese el documento del estudiante");
  String cedula = stdin.readLineSync()!;
  Estudiante? estudiante = listaEstudiantes.firstWhere((est) => est.cedula == cedula, orElse: () => null);
  if (estudiante != null) {
    estudiante.mostrarUsuario();
  } else {
    print("Estudiante no encontrado.");
  }
}

void modificarDireccion(List<Estudiante> listaEstudiantes) {
  print("Ingrese el documento del estudiante");
  String cedula = stdin.readLineSync()!;
  Estudiante? estudiante = listaEstudiantes.firstWhere((est) => est.cedula == cedula, orElse: () => null);
  if (estudiante != null) {
    print("Ingrese la nueva direccion");
    String nuevaDireccion = stdin.readLineSync()!;
    estudiante.cambiarDireccion(nuevaDireccion);
    print("La direccion quedo modificada");
  } else {
    print("Estudiante no encontrado");
  }
}

void modificarNotas(List<Estudiante> listaEstudiantes) {
  print("Ingrese el documento del estudiante");
  String cedula = stdin.readLineSync()!;
  Estudiante? estudiante = listaEstudiantes.firstWhere((est) => est.cedula == cedula, orElse: () => null);
  if (estudiante != null) {
    print("Ingrese las nuevas notas");
    String notasInput = stdin.readLineSync()!;
    List<double> nuevasNotas = notasInput.split(",").map((nota) => double.tryParse(nota) ?? 0).toList();
    estudiante.notas = nuevasNotas;
    estudiante.calcularPromedio();
    print("Notas ya quedaron modificadas");
  } else {
    print("Estudiante no encontrado");
  }
}
