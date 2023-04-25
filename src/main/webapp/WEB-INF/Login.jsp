<%@ page isErrorPage="true" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!-- <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
  crossorigin="anonymous"
/>
<script
  src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
  integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
  integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
  crossorigin="anonymous"
></script>

<link rel="stylesheet" href="/css/style.css" />
<-- FONTS -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap"
  rel="stylesheet"
/>
<!--  -->
<!DOCTYPE html>
<html>
  <body>
    <h1 class="text-primary">Log in</h1>

    <div style="text-align: center">
      <p class="text-danger">
        <c:out value="${permitionIssue}"></c:out>
      </p>
    </div>

    <form:form action="/login" method="POST" modelAttribute="newLogin">
      <div class="col-md-5 mb-3">
        <form:label path="email">Email:</form:label>
        <form:input
          path="email"
          class="form-control"
          type="email"
          placeholder="Email"
        />
        <form:errors class="text-danger" path="email"></form:errors>
      </div>

      <div class="col-md-5 mb-3">
        <form:label path="password">Password:</form:label>
        <form:input
          path="password"
          class="form-control"
          placeholder="Password"
          type="password"
        />
        <form:errors class="text-danger" path="password"></form:errors>
      </div>
      <button>Log in</button>
    </form:form>
  </body>
</html>
