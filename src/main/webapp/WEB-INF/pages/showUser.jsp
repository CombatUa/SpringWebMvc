<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<html>
<body>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Web Store</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.js"></script>
    <![endif]-->
</head>
<body>
<div class="container container-fluid">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">User Info</h3>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="form-group row">
                        <label for="userid-text-input" class="col-2 col-form-label">User ID</label>
                        <div class="col-10">
                            <input class="form-control" type="text" name="id" placeholder="User ID"
                                   id="userid-text-input" readonly value="${u.id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="firstname-text-input" class="col-2 col-form-label">First Name</label>
                        <div class="col-10">
                            <input class="form-control" type="text" name="first_name" placeholder="First Name"
                                   id="firstname-text-input" readonly value="${u.firstName}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lastname-text-input" class="col-2 col-form-label">Last Name</label>
                        <div class="col-10">
                            <input class="form-control" type="text" name="last_name" placeholder="Last Name"
                                   id="lastname-text-input" readonly value="${u.lastName}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="salary-number-input" class="col-2 col-form-label">Salary</label>
                        <div class="col-10">
                            <input class="form-control" type="number" name="salary" placeholder="Salary"
                                   id="salary-number-input" readonly value="${u.salary}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="dob-date-input" class="col-2 col-form-label">Date of Birth</label>
                        <div class="col-10">
                            <input class="form-control" type="date" name="dob" placeholder="yyyy-mm-dd"
                                   id="dob-date-input" readonly value="${u.dateOfBirth}">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="location.href = '/web-store/users';">Return to Users Page
                </button>
            </div>
        </div>
    </div>
</div>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js"></script>--%>

</body>
</html>