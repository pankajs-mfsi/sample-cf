
<cfif NOT session.isLoggedIn>
    <cflocation url="index.cfm">
</cfif>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow">
        <h4>Add User</h4>
        <div id="userMessage"></div>
        <form id="userForm" novalidate>
            <input type="text" id="name" name="name" class="form-control mb-2" placeholder="Name">
            <input type="email" id="email" name="email" class="form-control mb-2" placeholder="Email">
            <button class="btn btn-primary">Save</button>
        </form>

        <hr>
        <h4>User List</h4>
        <table class="table table-bordered" id="userTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <a href="dashboard.cfm" class="btn btn-secondary">Back</a>
    </div>
</div>

<script>
function loadUsers(){
    $.get("components/User.cfc?method=getUsers", function(res){
        var data = JSON.parse(res);
        var rows = "";
        data.DATA.forEach(function(u){
            rows += "<tr><td>"+u.ID+"</td><td>"+u.NAME+"</td><td>"+u.EMAIL+"</td></tr>";
        });
        $("#userTable tbody").html(rows);
    });
}

$("#userForm").submit(function(e){
    e.preventDefault();

    let name = $("#name").val().trim();
    let email = $("#email").val().trim();
    let errors = [];

    if(name === ""){
        errors.push("Name is required");
    }

    if(email === ""){
        errors.push("Email is required");
    } else {
        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(!emailPattern.test(email)){
            errors.push("Enter a valid email address");
        }
    }

    if(errors.length > 0){
        $("#userMessage").html('<div class="alert alert-danger">'+errors.join("<br>")+'</div>');
        return;
    }

    $.post("components/User.cfc?method=addUser", $(this).serialize(), function(){
        loadUsers();
        $("#userForm")[0].reset();
        $("#userMessage").html('<div class="alert alert-success">User added successfully</div>');
    });
});

$(document).ready(function(){
    loadUsers();
});
</script>

</body>
</html>
