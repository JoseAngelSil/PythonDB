# llamar la librera psycopg2 dedicado para el motor de postgreSQL
import psycopg2

# Declaracion de constantes de datos para la conexion de base de datos empleado
DB = "empleados"
USER = "postgres"
PSWD = "12345"
HOST = "localhost"

# Ejecucion de Try-except para verificar error de conexion
try:
    # conexion a la base de datos y almacenado en la variable conn para que sea llamado
    conn = psycopg2.connect(
        host=HOST,
        user=USER,
        password=PSWD,
        database=DB,
    )

except psycopg2.Error as e:
    # Mostrar errores o problemas de conexion.
    print("Ocurrió un error al conectar a PostgreSQL: ", e)
