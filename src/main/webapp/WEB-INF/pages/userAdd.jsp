<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>

</head>
<style>
    .hiddenRow {
        padding: 0 !important;
    }
</style>


<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">WebStore</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <!--<li class="active"><a href="#">Home</a></li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Users <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="usersPage">
                            <span class="glyphicon glyphicon-th-list"></span>
                            Overview </a></li>
                        <li><a href="userAdd">
                            <span class="glyphicon glyphicon-plus-sign"></span>
                            New User</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Categories</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1> User Add</h1>


    <div class="divider"/>
    <form id="userForm" method="post">
        <div class="modal-body">
            <div class="container-fluid">
                <div class="form-group row">
                    <label for="firstname-text-input" class="col-2 col-form-label">First Name</label>
                    <div class="col-10">
                        <input id="firstname-text-input" name="firstName" class="form-control" type="text" value=""/>
                    </div>

                </div>
                <div class="form-group row">
                    <label for="lastName">Last Name</label>
                    <div class="col-10">
                        <input id="lastName" name="lastName" class="form-control" type="text" value=""/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="salary">Salary</label>

                    <div class="col-10">
                        <input id="salary" name="salary" class="form-control" type="text" value="0.0"/>
                    </div>
                </div>
                <div class="form-group row">

                    <label for="dateOfBirth">Date of Birth</label>
                    <div class="col-10">
                        <input id="dateOfBirth" name="dateOfBirth" class="form-control" placeholder="yyyy-mm-dd" type="date" value=""/>

                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary" value="Submit"> Save changes</button>
        </div>
    </form>
</div>
<script type='text/javascript'>
    /* attach a submit handler to the form */
    $("#userForm").submit(function(event) {

        /* stop form from submitting normally */
        event.preventDefault();
        var formDt= new FormData($('#userForm'));
        var result = {};

        for (var entry of formData.entries())
        {
            result[entry[0]] = entry[1];
        }
        result = JSON.stringify(result)
        console.log(result);

        var formData = JSON.stringify($('#userForm').serializeArray());
        console.log(formData);
        $.ajax({
            method: "PUT",
            url: "user",
            dataType: "json",
            data: result,
            contentType:"application/json",
            success: function (result) {
                console.log(result);
            },
            error: function () {
                console.log("error");
            }
        });


    });
</script>

</body>


</html>

