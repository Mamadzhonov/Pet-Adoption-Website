<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script type="text/javascript" src="js/app.js">
</script>

<title>Insert title here</title>
</head>
<body onLoad="getMapsImageSrc('${event.location}')">
	<img id="google-map"></img>
</body>
</html>