# Jose Angel Silva Cruz
# Python 3.6.8

# Importacion de libreria y de archivo de conexion
import conexion
import pandas as pd

# Función de insertar datos en la tabla de herramienta de la base de datos de empleados
def insertarDato(empleadoID,nombre, porsentajeDominio, tiempoExperiencia):
    # Funcion de cursos para aceptar el query de postgreSQL
    sql = conexion.conn.cursor() 
    # Formato del Query con ingreso de datos de la funcion con formato de cadena
    datosIngre = "INSERT INTO public.herramienta (empleado, nombre, porcentdom, timeexpe) values ({},'{}',{},{});".format(
        empleadoID, nombre, porsentajeDominio, tiempoExperiencia
    )
    # Ejecucion de Query y confirmar para ingresar a la base de datos
    sql.execute(datosIngre)
    conexion.conn.commit()

# Definición de la funcion leerExcel para obtener info y llamar a la funcion anterior
def leerExcel():
    # Nombre del archivo Excel
    path = 'dataExcel.xlsx'
    df = pd.read_excel(path, engine='openpyxl') # Creación de DataFrame con Pandas
    values = df.values # Obtener los valores del DF en una lista llamada values
    for i in range(len(values)-1):  # Iterar cada indice de la lista values
        # Casteo de datos para enviar al wuery
        empleado = int(values[i][0])
        herramienta = values[i][1]
        dominio = float(values[i][2])
        experiencia = int(values[i][3])
        # Llamar la funcion insertarDato() con los datos extraidos de la lista
        insertarDato(empleado,herramienta,dominio,experiencia)
      

# Llamar la funcion leerExcel y que ejecute cada Query.
leerExcel()
