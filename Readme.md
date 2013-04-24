Icecast MerdaLab
================

Interfase multimedia en la que se puede reproducir las transmisiones de modo directo en la lista de transmisiones.
Escuchar transmisiones viejas almacenadas o buscar contenido en [Internet Archive](https://archive.org).
Y chatear usando [web-irc](https://github.com/b4zz4/web-irc)

![Portada](http://ompldr.org/vZmh5ag/jcr-icecast-merdalab.png)

Actualmente esta versión esta disponible en [fm.hackcoop.com.ar](http://fm.hackcoop.com.ar). [Pagina de Desarrollo](http://lab.hackcoop.com.ar/projects/merdalab/wiki)

Icecast.xml
-----------

### Almacenamiento de programas emitidos

Al terminar cada emisión de radio se hace un archivo del programa y [se comparte en Archive.org](http://fm.hackcoop.com.ar/archive.org.xsl#Realaradio)

<pre>
&lt;mount&gt;
   &lt;mount-name&gt;/Realaradio.ogg&lt;/mount-name&gt;
   &lt;dump-file\&gt;.local/share/icecast2/web/archivo/Realaradio.ogg&lt;/dump-file&gt;
   &lt;on-disconnect\&gt;.local/share/icecast2/bin/archivar&lt;/on-disconnect&gt;
&lt;/mount&gt;
</pre>

En el ejemplo la estación de radio `/Realaradio.ogg` tiene que cambiar por tu punto de montaje. 
Puede ocurrir que durante microcortes se generen pequeños archivos que hay que borrar a mano :(

### Nombre del que mantiene el icecast

<pre>
&lt;admin&gt;moteado@anastasia.local&lt;/admin&gt;
<pre>

En este caso es una dirección dentro de [LibreVPN](http://librevpn.org.ar), pero podes poner lo que se te ocurra.

Quehaceres
----------

- Eliminar archivos muy pequeños antes de archivarlos
- Anuncio de los archivos archivados de modo local
- Integrar a wordpress feed y comentarios
- Generar publicador automático de archive.org
- Generar capturar para el repositorio
