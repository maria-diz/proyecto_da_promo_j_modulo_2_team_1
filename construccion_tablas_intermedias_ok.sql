SELECT * FROM bd_cinemextract.actores;

-- Primero creamos una tabla que separa la cadena de peliculas de cada actor 
-- y las extrae en columnas independientes. Creo esta tabla para formar mi tabla intermedia
-- tabla_intermedia_normalizada_actor_idowner. Después la borraré.

CREATE TABLE peliculas_por_actor AS
SELECT 
	id_actor, nombre,
    SUBSTRING_INDEX(peliculas, ',', 1) AS pelicula1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 2), ',', -1) AS pelicula2,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 3), ',', -1) AS pelicula3
FROM actores;

-- Después creamos una tabla que une en una sola columna las peliculas que ha hecho cada actor. 
-- INFO: Creo esta tabla para formar mi tabla intermedia tabla_intermedia_normalizada_actor_idowner.
-- Después la borraré.

CREATE TABLE actor_pelicula_sin_normalizar AS
SELECT 	
	id_actor, nombre, pelicula1
    FROM peliculas_por_actor
UNION
SELECT 	
	id_actor, nombre, pelicula2
    FROM peliculas_por_actor
UNION
SELECT 	
	id_actor, nombre, pelicula3
    FROM peliculas_por_actor;



-- Esta tabla intermedia está normalizada y relaciona cada actor con las películas en que aparece

CREATE TABLE tabla_intermedia_normalizada_actor_idowner AS
SELECT id_actor, id_owner
FROM actor_pelicula_sin_normalizar 
LEFT JOIN peliculas_imdb 
	ON peliculas_imdb.titulo = actor_pelicula_sin_normalizar.pelicula1;

-- Añado las FK de la tabla tabla_intermedia_normalizada_actor_idowner

-- Convertimos la columna id_actor en clave foranea

ALTER TABLE tabla_intermedia_normalizada_actor_idowner
ADD CONSTRAINT id_actor
FOREIGN KEY (id_actor)
REFERENCES actores(id_actor);

-- Convertimos la columna id_owner en clave foranea

ALTER TABLE tabla_intermedia_normalizada_actor_idowner
ADD CONSTRAINT id_owner
FOREIGN KEY (id_owner)
REFERENCES peliculas_imdb(id_owner);


-- Borro las tablas que me han permitido crear mi tabla intermedia relacionada.

DROP TABLE peliculas_por_actor; 
DROP TABLE actor_pelicula_sin_normalizar;


/*
ALTER TABLE Tabla1
ADD CONSTRAINT fk_columna_referencia
FOREIGN KEY (columna_referencia)
REFERENCES Tabla2(id_tabla2);
*/




