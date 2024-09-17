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


-- Esta tabla intermedia está normalizada y relaciona cada actor con las películas que ha hecho. 

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



/*
ALTER TABLE Tabla1
ADD CONSTRAINT fk_columna_referencia
FOREIGN KEY (columna_referencia)
REFERENCES Tabla2(id_tabla2);
*/









    
-- SEGURIDAD ANTES. Y SIGO AVANZANDO.
-- Esto está repetido. 

CREATE TABLE tabla_intermedia_actor_peliculas AS
SELECT 
	id_actor, nombre,
    SUBSTRING_INDEX(peliculas, ',', 1) AS pelicula1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 2), ',', -1) AS pelicula2,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 3), ',', -1) AS pelicula3
FROM actores;

CREATE TABLE intermedia_actor_pelicula AS
SELECT 	
	id_owner, id_actor, nombre, pelicula1 AS pelicula
    FROM tabla_intermedia_actor_peliculas
    JOIN peliculas_imdb
		ON tabla_intermedia_actor_peliculas.pelicula1 = peliculas_imdb.titulo
UNION ALL
SELECT 	
	id_owner, id_actor, nombre, pelicula2
    FROM tabla_intermedia_actor_peliculas
	JOIN peliculas_imdb
		ON tabla_intermedia_actor_peliculas.pelicula2 = peliculas_imdb.titulo
UNION
SELECT 	
	id_owner, id_actor, nombre, pelicula3
    FROM tabla_intermedia_actor_peliculas
	JOIN peliculas_imdb
		ON tabla_intermedia_actor_peliculas.pelicula3 = peliculas_imdb.titulo;
    
    
    
-- OTRA OPCION. ESTO FUNCIONA

CREATE TABLE tabla_actor_pelicula AS
SELECT 	
	id_actor, pelicula1 AS titulo
    FROM tabla_intermedia_actor_peliculas
UNION
SELECT 	
	id_actor, pelicula2
    FROM tabla_intermedia_actor_peliculas
UNION
SELECT 	
	id_actor, pelicula3
    FROM tabla_intermedia_actor_peliculas;








-- seguridad  
CREATE TABLE tabla_intermedia_actor_pelicula_idowner AS
SELECT id_actor, pelicula1, id_owner
FROM actor_y_pelicula 
LEFT JOIN peliculas_imdb 
	ON peliculas_imdb.titulo = actor_y_pelicula.pelicula1;







-------- Sigo explorando

CREATE TABLE tabla_intermedia_actor_peliculas AS
SELECT 
	id_actor, nombre,
    SUBSTRING_INDEX(peliculas, ',', 1) AS pelicula1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 2), ',', -1) AS pelicula2,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 3), ',', -1) AS pelicula3
FROM actores;

CREATE TABLE actor_pelicula AS
SELECT 	
	id_actor, nombre, pelicula1
    FROM tabla_intermedia_actor_peliculas
UNION
SELECT 	
	id_actor, nombre, pelicula2
    FROM tabla_intermedia_actor_peliculas
UNION
SELECT 	
	id_actor, nombre, pelicula3
    FROM tabla_intermedia_actor_peliculas;
    


-- Así creamos una tabla que me separa la cadena de peliculas de cada actor y las extrae en columnas independientes

CREATE TABLE tabla_intermedia_actor_peliculas AS
SELECT 
	id_actor, nombre,
    SUBSTRING_INDEX(peliculas, ',', 1) AS pelicula1,
    peliculas_imdb.id_owner AS id_owner1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 2), ',', -1) AS pelicula2,
    SUBSTRING_INDEX(SUBSTRING_INDEX(peliculas, ',', 3), ',', -1) AS pelicula3
FROM actores
JOIN peliculas_imdb
	ON peliculas_imdb.titulo = tabla_intermedia_actor_peliculas.pelicula;
    

-- Ahora quiero añadirle a cada una de estas peliculas su id_pelicula al lado






-- Así uno la tabla intermedia de actores y su primera pelicula con la tabla imdb a partir del idowner

CREATE TABLE actor_peliculas AS
	SELECT nombre, pelicula1, id_owner
	FROM tabla_intermedia_actor_pelicula6
    UNION
    	SELECT nombre, pelicula2, id_owner
		FROM tabla_intermedia_actor_pelicula6
	
	JOIN peliculas_imdb 
		ON	peliculas_imdb.titulo = tabla_intermedia_actor_pelicula6.pelicula1
	UNION
    	SELECT nombre, pelicula2, id_owner
		FROM tabla_intermedia_actor_pelicula6
		JOIN peliculas_imdb 
		ON	peliculas_imdb.titulo = tabla_intermedia_actor_pelicula6.pelicula2;
    
        
        ;


/*
SELECT peliculas, id_actor, nombre
FROM actores
WHERE peliculas NOT LIKE ('%,%')
ORDER BY id_actor;

CREATE TABLE tabla_intermedia_actor_pelicula AS
SELECT peliculas, id_actor, nombre
FROM actores
WHERE peliculas NOT LIKE ('%,%')
ORDER BY id_actor;

CREATE TABLE tabla_intermedia_actor_pelicula AS
SELECT peliculas, id_actor, nombre
FROM actores
WHERE peliculas NOT LIKE ('%,%')
ORDER BY id_actor; 


CREATE TABLE tabla_intermedia_actor_pelicula2 AS
SELECT peliculas, id_actor, nombre
FROM actores
WHERE peliculas NOT LIKE ('%,%')
ORDER BY id_actor;*/  

-- OTRA MANERA




