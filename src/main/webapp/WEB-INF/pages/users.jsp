<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h3 class="panel-title">Manage Users</h3>
        </div>
        <div class="panel-body">


            <h1> Users lists</h1>
            <button type="button" class="btn btn-success" onclick="location.href = 'user/add';"
                    data-mybtnname="Add">
                <span class="glyphicon glyphicon-plus"></span>User
            </button>

            <div class="divider"/>
            <table class="table table-hover" id="users_tab">
                <thead>
                <tr>
                    <th>User ID</th>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Salary</th>
                    <th>date of birth</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>


                <c:if test="${not empty usersList}">
                    <c:forEach var="user" items="${usersList}" varStatus="loop">

                        <tr id="${user.id}">
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.salary}</td>
                            <td>${user.dateOfBirth}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-success edit-user-btnn"
                                            data-mybtnname="Edit" data-btnrow="${loop.index}"
                                            onclick="location.href = 'user/${user.id}/edit'">Edit
                                    </button>
                                    <button type="button" class="btn btn-sm btn-danger my-delete-button"
                                            data-mybtnnameid="${user.id}">
                                        &nbsp;<span class="glyphicon glyphicon-trash"/>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                </c:if>

                </tbody>

            </table>

        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>

    $('#users_tab').on('click', '.my-delete-button', function (e) {
        var button = $(e.currentTarget);
        var userId = button.data('mybtnnameid');
        $.ajax({
            url: 'user/' + userId,
            type: 'delete',
            success: function () {
                button.parents('tr').remove();
            },
            error: function (a, b, c) {
                alert("User Not Deleted!");
            }
        })
    });
</script>
</body>
</html>