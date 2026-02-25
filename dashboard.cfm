
<cfif NOT session.isLoggedIn>
    <cflocation url="index.cfm">
</cfif>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="bg-light">
<div class="container mt-5">
<div class="card p-4 shadow">
<h3>Dashboard</h3>
<a href="users.cfm" class="btn btn-success mt-3">Manage Users</a>
<button id="logoutBtn" class="btn btn-danger mt-3">Logout</button>
</div>
</div>
<script>
$("#logoutBtn").click(function(){
    $.post("components/Auth.cfc?method=logout", function(){
        window.location = "index.cfm";
    });
});
</script>
</body>
</html>
