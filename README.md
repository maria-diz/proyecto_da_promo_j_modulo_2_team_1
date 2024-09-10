# proyecto_da_promo_j_modulo_2_team_1

# Proyecto CinemaExtract - Extracción de Datos de Películas

Este proyecto tiene como objetivo extraer y enriquecer información de películas utilizando una combinación de APIs y técnicas de web scraping con Selenium. El resultado final es un conjunto de datos detallado que se puede utilizar para análisis posteriores en SQL.

## Tabla de Contenidos

- [Descripción del Proyecto](#descripción-del-proyecto)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Archivos y Scripts](#archivos-y-scripts)
- [Resultados](#resultados)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Descripción del Proyecto

Este proyecto permite extraer datos detallados de películas desde una API y, posteriormente, ampliar esta información con técnicas de scraping utilizando Selenium. Los datos se consolidan y se preparan para análisis en SQL. El objetivo es crear un dataset enriquecido que incluya detalles como directores, guionistas, y otros metadatos relevantes.

## Estructura del Proyecto

La estructura del proyecto es la siguiente:

/proyecto_cinemaextract
│
├── extraccion_datos_api.ipynb
├── extraccion_selenium.ipynb
├── Selenium_actores.ipynb
├── tabla_oscar.ipynb
├── peliculas_1984.csv
├── peliculas_1995_1999.csv
├── peliculas_2000_2004.csv
├── peliculas_2005_2009.csv
├── tabla_oscar_archivo.csv
└── README.md

## Requisitos

Antes de comenzar, asegúrate de tener los siguientes requisitos instalados:

- Python 3.7 o superior
- Jupyter Notebook
- Google Chrome y ChromeDriver para Selenium
- Librerías de Python: `pandas`, `selenium`, `requests`

## Instalación

1. Clona el repositorio:

   git clone https://github.com/tu_usuario/proyecto_cinemaextract.git

2. Instala las dependencias necesarias:

   pip install pandas selenium requests

3. Asegúrate de tener ChromeDriver configurado en tu PATH.

## Uso

1. **Extracción de datos desde la API**: Utiliza el notebook `extraccion_datos_api.ipynb` para extraer los datos de las películas entre los años 1984 y 2009. Los resultados se guardan en varios archivos CSV segmentados por rangos de años.
   
2. **Scraping de datos adicionales**: Utiliza `extraccion_selenium_new.ipynb` para extraer detalles adicionales de cada película como directores, guionistas y más. El script lee los IDs de películas desde los archivos CSV y realiza el scraping automáticamente.

3. **Guardar y usar los datos**: Una vez extraídos los datos, guárdalos en un archivo `CSV` utilizando el script incluido para su posterior análisis en SQL.

## Archivos y Scripts

- **datos_API_fantasia_1984_1999.ipynb**: Extracción de películas del género fantasía desde la API en el rango 1984-1999.
- **Selenium_actores.ipynb**: Script para la extracción de datos de actores.
- **extraccion_datos_api.ipynb**: Contiene la extracción de datos de películas desde la API en diferentes rangos de años.
- **extraccion_selenium_new.ipynb**: Scraping de datos detallados de las películas utilizando Selenium.
- **peliculas_*.csv**: Archivos CSV con datos extraídos de la API.
- **tabla_oscar_archivo.csv**: Datos relacionados con películas nominadas a los Oscars.
- **README.md**: Documentación del proyecto.

## Resultados

El proyecto genera un archivo CSV final con la información enriquecida de las películas. Este archivo contiene los siguientes campos:

- ID de la película
- Título
- Director
- Guionistas
- Argumento
- Otros detalles relevantes

Este archivo CSV está listo para ser importado a una base de datos SQL para análisis más avanzados.

## Contribuciones

Contribuciones son bienvenidas. Si deseas contribuir, por favor sigue los siguientes pasos:

1. Haz un fork del repositorio.
2. Crea una rama nueva (`git checkout -b feature/nueva-caracteristica`).
3. Realiza tus cambios y haz commit (`git commit -m 'Añadir nueva característica'`).
4. Haz push a la rama (`git push origin feature/nueva-caracteristica`).
5. Abre un Pull Request.

## Autoras
Ana Boyero - Team Developer.

María Diz - Team Developer & Scrum Master.

Yaiza Matesanz - Team Developer.
