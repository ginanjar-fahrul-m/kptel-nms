<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
  function initialize() {
    var latlng = new google.maps.LatLng(-1, 118);
    var myOptions = {
      zoom: 5,
      center: latlng,
	  mapTypeControl: true,
	  mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
	  navigationControl: true,
	  navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
      mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  }

</script>
</head>
<body onload="initialize()">
  <div id="map_canvas" style="width:100%; height:100%"></div>
</body>
</html>