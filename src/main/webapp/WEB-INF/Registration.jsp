<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                    crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                    crossorigin="anonymous"></script>
                    
	            <link rel="stylesheet" href="/css/style.css">
                    

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Registration</title>
                </head>

             
                <body>


                    <h1>Hello</h1>

                    <div style="text-align: center;">
                        <p class="text-danger">
                            <c:out value="${emailExist}"></c:out>
                        </p>
                    </div>
                    <form:form action="/register" method="POST" modelAttribute="newUser">

                    <div class="col-md-5 mb-3">
                        <form:label path="userName">User Name</form:label>
                        <form:input path="userName" class="form-control" placeholder="Username" />
                        <form:errors class="text-danger" path="userName"></form:errors>
                    </div>

                    <div class="col-md-5 mb-3">
                        <form:label path="email">Emails</form:label>
                        <form:input path="email" class="form-control" type="email"
                            placeholder="Email" />
                        <form:errors class="text-danger" path="email"></form:errors>
                    </div>

                    <div class="col-md-5 mb-3">
                        <form:label path="password">Password</form:label>
                        <form:input path="password" class="form-control" placeholder="Password"
                            type="password" />
                        <form:errors class="text-danger" path="password"></form:errors>
                    </div>

                    <div class="col-md-5 mb-3">
                        <form:label path="confirmPW">Confirm Password</form:label>
                        <form:input path="confirmPW" class="form-control"
                            placeholder="Confirm Password" type="password" />
                        <form:errors class="text-danger" path="confirmPW"></form:errors>
                    </div>
                    <div>

                        <button class="btn-custome">Submit</button>
                    </div>
                </form:form>

                    <a class="btn btn-primary" href="/login">Sign in</a>

                </body>

                </html>