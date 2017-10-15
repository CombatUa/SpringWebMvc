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
    <h1> Users lists</h1>


    <div class="divider"/>
    <table class="table table-hover " id="usersTable">
        <thead>
        <tr>
            <th data-field="firstName">First name</th>
            <th data-field="lastName">Last name</th>
            <th data-field="salary">Salary</th>
            <th data-field="dateOfBirth">date of birth</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<script>
    function getPhone(i, item) {
        if (item.phones && item.phones[i]) {
            return item.phones[i].phoneNumber;
        }
        return '';
    }

    function initPage (usersData) {
         var htmlText = '';
            $.each(usersData, function (i, item) {
                htmlText +=
                    '        <tr data-toggle="collapse" data-target="#phonelist' + item.id + '" class="accordion-toggle clickable-row"\n' +
                    '            data-href="" id="usrid' + item.id + '">\n' +
                    '            <td>' + item.firstName + '</td>\n' +
                    '            <td>' + item.lastName + '</td>\n' +
                    '            <td>' + item.salary + '</td>\n' +
                    '            <td>' + item.dateOfBirth.join("/") + '</td>\n' +
                    '            <td>\n' +
                    '                <div class="btn-group">\n' +
                    '                    <button type="button" class="btn btn-sm btn-success" data-toggle="modal"\n' +
                    '                            data-target="#myModal" data-mybtnname="Edit" data-btnrow="' + i + '">Edit\n' +
                    '                    </button>\n' +
                    '                    <button type="button" class="btn btn-sm btn-danger my-delete-button" data-mybtnnameid="'+item.id+'"><span\n' +
                    '                            class="glyphicon glyphicon-trash"/></button>\n' +
                    '                </div>\n' +
                    '            </td>\n' +
                    '        </tr>\n' +
                    '        <tr>\n' +
                    '            <td colspan="5" class="hiddenRow row-fluid id="phones' + item.id + '">\n' +
                    '                <div class="accordian-body collapse" id="phonelist' + item.id + '">\n' +
                    '                    <table class="table" style="margin: 0px 0px 0px 0px;">\n' +
                    '                        <tr>\n' +
                    '                            <td>\n' +
                    '                                <div class="form-group">\n' +
                    '                                    <label for="phoneValue1">Phone1</label>\n' +
                    '                                    <input type="phone" disabled class="form-control" id="phoneValue1"\n' +
                    '                                           value="' + getPhone(0, item) + '">\n' +
                    '                                </div>\n' +
                    '                                <div class="form-group">\n' +
                    '                                    <label for="phoneValue2">Phone2</label>\n' +
                    '                                    <input type="phone" disabled class="form-control" id="phoneValue2"\n' +
                    '                                           value="' + getPhone(1, item) + '">\n' +
                    '                                </div>\n' +
                    '                            </td>\n' +
                    '                            <td>\n' +
                    '                                <div class="form-group">\n' +
                    '                                    <label for="phoneValue3">Phone3</label>\n' +
                    '                                    <input type="phone" disabled class="form-control" id="phoneValue3"\n' +
                    '                                           value="' + getPhone(2, item) + '">\n' +
                    '                                </div>\n' +
                    '                                <div class="form-group">\n' +
                    '                                    <label for="phoneValue4">Phone4</label>\n' +
                    '                                    <input type="phone" disabled class="form-control" id="phoneValue4"\n' +
                    '                                           value="' + getPhone(3, item) + '">\n' +
                    '                                </div>\n' +
                    '                            </td>\n' +
                    '                            <td>\n' +
                    '                                <div class="form-group">\n' +
                    '                                    <label for="phoneValue5">Phone5</label>\n' +
                    '                                    <input type="phone" disabled class="form-control" id="phoneValue5"\n' +
                    '                                           value="' + getPhone(4, item) + '">\n' +
                    '                                </div>\n' +
                    '                            </td>\n' +
                    '                        </tr>\n' +
                    '                    </table>\n' +
                    '                </div>\n' +
                    '                <!--<div class="accordion-body collapse" id="demo1">Demo1</div>-->\n' +
                    '            </td>\n' +
                    '        </tr>';

            });

            $('#usersTable tbody').append(htmlText);
        };

    $(document).ready( function () {
        $.ajax({
            method: "GET",
            url: "users",
            dataType: "json",
            contentType:"application/json",
            success: function (result) {
                initPage(result);
            },
            error: function () {
                console.log("error");
            }
        });
    });


//    $.getJSON("users", function(result){
//        console.log('json '+result);
//    });

    //        [
    //            {
    //                "firstName": "TestLastName",
    //                "lastName": "asdfasdf",
    //                "salary": 308,
    //                "dateOfBirth": [
    //                    2000,
    //                    7,
    //                    17
    //                ],
    //                "phones": [],
    //                "id": 1
    //            },
    //            {
    //                "firstName": "the last",
    //                "lastName": "sadfs",
    //                "salary": 4503,
    //                "dateOfBirth": [
    //                    1920,
    //                    7,
    //                    9
    //                ],
    //                "phones": [
    //                    {
    //                        "id": 2,
    //                        "phoneNumber": "+38067-000-00-00"
    //                    },
    //                    {
    //                        "id": 2,
    //                        "phoneNumber": "+38067-000-00-01"
    //                    },
    //                    {
    //                        "id": 2,
    //                        "phoneNumber": "+38067-000-00-02"
    //                    }
    //                ],
    //                "id": 2
    //            }
    //        ];



</script>
<script>
    $('#usersTable').on('click', '.my-delete-button', function (e) {
        e.stopPropagation();
        var button = $(e.currentTarget);
        var userId = button.data('mybtnnameid');
        console.log(userId);
        $.ajax({
            url: 'user/' + userId,
            type: 'delete',
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function () {
//                button.parents('tr').remove();
                $('#usrid'+userId).remove();
                $('#phones'+userId).remove();
            },
            error: function (a, b, c) {
                alert("User Not Deleted!");
            }
        })
    });
</script>
</body>


</html>

