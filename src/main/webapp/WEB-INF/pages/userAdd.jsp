<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
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
            <h3 class="panel-title">Add User</h3>
        </div>
        <div class="panel-body">

            <mvc:form modelAttribute="user" action="result">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group row">
                            <label for="firstname-text-input" class="col-2 col-form-label">First Name</label>
                            <div class="col-10">
                                <mvc:input path="firstName" id="firstname-text-input"
                                           cssClass="form-control"></mvc:input>
                            </div>

                        </div>
                        <div class="form-group row">
                            <mvc:label path="lastName">Last Name</mvc:label>
                            <div class="col-10">
                                <mvc:input path="lastName" cssClass="form-control"></mvc:input>
                            </div>
                        </div>
                        <div class="form-group row">
                            <mvc:label path="salary">Salary</mvc:label>

                            <div class="col-10">
                                <mvc:input path="salary" cssClass="form-control"></mvc:input>
                            </div>
                        </div>
                        <div class="form-group row">
                                <%--<label for="dob-date-input" class="col-2 col-form-label">Date of Birth</label>--%>
                            <mvc:label path="dateOfBirth">Date of Birth</mvc:label>
                            <div class="col-10">
                                <mvc:input path="dateOfBirth" type="date" placeholder="yyyy-mm-dd"
                                           cssClass="form-control"></mvc:input>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" value="Submit"> Save changes</button>
                </div>
            </mvc:form>
        </div>
    </div>
</div>
</body>
</html>