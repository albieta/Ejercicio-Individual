//#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
	
	MYSQL *conn;
	int err;
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	
	conn=mysql_init(NULL);
	if (conn==NULL) {
		printf("Error al crear la conexion: %u %s\n",mysql_errno(conn), mysql_error(conn));
		exit(1);
	}
	conn=mysql_real_connect(conn, "localhost","root","mysql","catan",0,NULL,0);
	if (conn==NULL) {
		printf("Error al inicializar la conexion: %u %s\n",mysql_errno(conn), mysql_error(conn));
		exit(1);
	}

	int partida;
	printf("Escribe el Identificador de la partida para ver los nombres de sus jugadores:\n");
	err = scanf ("%d", &partida);
	if (err !=1)
		printf("Error en la entrada de datos");
	
	char consulta[80];
	
	strcpy (consulta,"SELECT Jugador.nombre FROM Jugador, Participacion WHERE Participacion.idP = ");
	//strcat (consulta, partidas);
	sprintf(consulta,"%s %d",consulta,partida);
	strcat (consulta," AND Participacion.idJ = Jugador.id;");

	err = mysql_query(conn,consulta);
	
	if (err!=0) {
		printf("Error al consultar datos de la base %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit(1);
	}
	
	resultado = mysql_store_result(conn);
	row = mysql_fetch_row (resultado);
	
	if (row == NULL)
		printf("No se han obtenido datos en la consulta\n");
	else{
		printf("Los Jugadores de la partida son:\n");
		while (row !=NULL) {
			printf("%s\n", row[0]);
			row = mysql_fetch_row(resultado);
		}
	}
	mysql_close(conn);
	exit(0);
	
}

