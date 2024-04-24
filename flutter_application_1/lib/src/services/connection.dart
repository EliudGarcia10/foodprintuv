import 'package:mysql1/mysql1.dart';

Future<void> connectToDatabase() async {
  var settings = ConnectionSettings(
    host: 'tu_host', // Cambia 'tu_host' por el host de tu base de datos en Hostinger
    port: 3306, // Puerto predeterminado para MySQL
    user: 'tu_usuario', // Cambia 'tu_usuario' por tu usuario de la base de datos
    password: 'tu_contraseña', // Cambia 'tu_contraseña' por tu contraseña de la base de datos
    db: 'nombre_de_tu_base_de_datos', // Cambia 'nombre_de_tu_base_de_datos' por el nombre de tu base de datos
  );

  // Realiza la conexión
  var conn = await MySqlConnection.connect(settings);

  // Ejemplo de consulta  
  var results = await conn.query('SELECT * FROM tu_tabla'); // Cambia 'tu_tabla' por el nombre de tu tabla

  for (var row in results) {
    print('ID: ${row['id']}, Nombre: ${row['nombre']}, Edad: ${row['edad']}');
  }

  // Cierra la conexión cuando hayas terminado
  await conn.close();
}