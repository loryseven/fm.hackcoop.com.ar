fm.hackcoop.com.ar
==================

Interface multimedia e interactiva en la que se anuncian la lista de estaciones disponibles,
escuchar los programas en vivo, como programas ya emitidos, [chatear](https://github.com/b4zz4/web-irc) con los ollentes 
y buscar contenido en [Internet Archive](https://archive.org). Ver la pagina de la [Desarrollo](http://lab.hackcoop.com.ar/projects/merdalab/wiki)

![Portada](http://ompldr.org/vZmh5ag/jcr-icecast-merdalab.png)

Icecast.xml
-----------

### Almacenamiento de programas emitidos

Al terminar cada emisión de radio se hace un archivo del programa y [se comparte](http://fm.hackcoop.com.ar/archive.org.xsl#Realaradio) en Archive.org

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
</pre>

En este caso es una dirección dentro de [LibreVPN](http://librevpn.org.ar), pero podes poner lo que se te ocurra.

Quehaceres
----------

- Generar capturar para el repositorio
- Eliminar archivos muy pequeños (errores) antes de archivarlos
- Anuncio de los archivos archivados de modo local
- Integrar a wordpress feed y comentarios
