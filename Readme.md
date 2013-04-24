Icecast MerdaLab
================

Interfase interactiva para icecast con chat en [web-irc](https://github.com/b4zz4/web-irc), 
en la que se puede reproducir las transmisiones de modo directo en la portada del icecast 
y escuchar transmisiones viejas almacenadas en [Internet Archive](https://archive.org), 
a la vez se puede buscar contenido en esta pagina.
Actualmente esta versión esta disponible en [fm.hackcoop.com.ar](http://fm.hackcoop.com.ar) 


![Portada](http://ompldr.org/vZmh5ag/jcr-icecast-merdalab.png)


[Pagina de Desarrollo](http://lab.hackcoop.com.ar/projects/merdalab/wiki)

Icecast.xml
-----------

### Almacenamiento de programas emitidos

Al terminar cada emisión de radio se hace un archivo del programa y [se comparte en Archive.org](http://fm.hackcoop.com.ar/archive.org.xsl#Realaradio)

<pre>
   <mount>
        <mount-name>/Realaradio.ogg</mount-name>
        <dump-file>.local/share/icecast2/web/archivo/Realaradio.ogg</dump-file>
        <on-disconnect>.local/share/icecast2/bin/archivar</on-disconnect>
   </mount>
</pre>

En el ejemplo la estación de radio `/Realaradio.ogg` tiene que cambiar por tu punto de montaje. 
Puede ocurrir que durante microcortes se generen pequeños archivos que hay que borrar a mano :(

### Nombre del que mantiene el icecast
<pre>
    <admin>moteado@anastasia.local</admin>
</pre>

En este caso es una dirección dentro de [LibreVPN](http://librevpn.org.ar), pero podes poner lo que se te ocurra.

Quehaceres
----------

- Eliminar archivos muy pequeños antes de archivarlos
- Anuncio de los archivos archivados de modo local
- Integrar a wordpress feed y comentarios
- Generar publicador automático de archive.org
- Generar capturar para el repositorio
