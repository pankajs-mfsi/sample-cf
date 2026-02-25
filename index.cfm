
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow">
        <h3>Login</h3>
        <div id="message"></div>
        <form id="loginForm" novalidate>
            <input type="text" id="username" name="username" class="form-control mb-3" placeholder="Username">
            <input type="password" id="password" name="password" class="form-control mb-3" placeholder="Password">
            <button class="btn btn-primary w-100">Login</button>
        </form>
    </div>
</div>

<script>
$("#loginForm").submit(function(e){
    e.preventDefault();

    let username = $("#username").val().trim();
    let password = $("#password").val().trim();
    let errors = [];

    if(username === ""){
        errors.push("Username is required");
    }

    if(password === ""){
        errors.push("Password is required");
    }

    if(errors.length > 0){
        $("#message").html('<div class="alert alert-danger">'+errors.join("<br>")+'</div>');
        return;
    }

    $.post("components/Auth.cfc?method=login", $(this).serialize(), function(res){
        var data = JSON.parse(res);
        if(data.success){
            window.location = "dashboard.cfm";
        } else {
            $("#message").html('<div class="alert alert-danger">'+data.message+'</div>');
        }
    });
});
</script>

</body>
</html>
