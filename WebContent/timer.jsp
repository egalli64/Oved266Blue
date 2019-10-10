<%@ page import="java.time.LocalTime"%> <!-- crea una servlet, importo i package utili -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello JSP</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/moorings.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
</head>
<body> <!-- esegue il codice java -->
    <h1>
     Thanks for your submit. Server local time is
        <%
            out.print(LocalTime.now()); 
        %>
    </h1>
</body>
</html>