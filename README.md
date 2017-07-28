# Apuntes de 4º de Ingeniería Informática
## Pero esas asignaturas...
Son las que yo he tenido en cuarto, en la Escuela de Ingeniería Informática de la Universidad de Valladolid (curso 2015/16). Hay dos de tercero que dejé para cuarto en lugar de las prácticas de empresa, que hice en tercero. En cuanto a optativas, solo están las que yo he cursado.

## Cómo colaborar
Clona el repositorio, realiza las modificaciones que quieras y haz un merge request al repositorio original. No tiene más.

Puedes editar los ficheros con cualquier editor. El lenguaje de marcado usado es [markdown](https://daringfireball.net/projects/markdown/basics).

Si quieres algo más sencillo, también puedes usar `gollum`, un programa en Ruby para hacer wikis controladas con git. Instala la gema en tu sistema y ejecuta `gollum` en la carpeta del repositorio. Se arrancará el servidor de `gollum`, al que podrás acceder a través de http://localhost:4567 para visualizar el contenido renderizado y para editarlo.

## Cómo generar los .epub
No hay más que ejecutar `make` en la raíz del repositorio. Necesitas tener instalado `pandoc`. Prueba a instalar dicho paquete con el gestor de paquetes de la distribución que estés usando. Para generar PDFs tienes que tener instalado `pdflatex` (aún no soportado a través del Makefile).

## El índice está en [Home.md](/Home.md)
