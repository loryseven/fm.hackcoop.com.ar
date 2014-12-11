<html>
<head>
<script type="text/javascript" src="assets/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="assets/js/jquery.playlist.js"></script>
<script src="http://html5.kaltura.org/js"></script>
</head>
<body>

<video src="http://api.jamendo.com/get/album/name/tag/page/m3u/rock+pop/?n=47&o=release_date_desc" ></video>

<script type="text/javascript">
    $(document).ready(function() {
        $(video).bind('loadstart', function(e) {
            $(this).playlistParser();
        });
    });
</script> 

</body>
</html>
