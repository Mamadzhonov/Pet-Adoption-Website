<%@ page isErrorPage="true" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>User Registration</title>

    <link
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
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap"
      rel="stylesheet"
    />
    <!-- BOOTSTRAP ICONS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"
    />
  </head>

  <body class="p-3">
    <div class="d-flex align-items-center ml-3 mb-0">
      <img
        src="/images/animalLogo_solid.png"
        alt=""
        style="height: 30px; padding-right: 10px; padding-bottom: 3px"
      />
      <h3 id="logo" class="my-0 flex-grow-1 pt-0 ms-2">Pet Adoption</h3>
    </div>
    <!--  -->
    <!-- error code -->
    <p class="text-danger">
      <c:out value="${emailExist}"></c:out>
    </p>
    <p class="text-danger">
      <c:out value="${permitionIssue}"></c:out>
    </p>
    <!--  -->
    <!--  -->
    <!-- REG/ LOGIN ROW -->
    <div class="d-flex">
      <!-- Registration COLUMN -->
      <div class="col">
        <div class="card form-card admin p-3">
          <div class="d-flex flex-wrap justify-content-between align-items-top">
            <h2>Admin Registration</h2>
            <a href="/" class="">Log in</a>
          </div>
          <hr />
          <form:form
            action="/admin/register"
            method="POST"
            modelAttribute="newUser"
          >
            <div class="mb-3">
              <form:label path="userName">User Name</form:label>
              <form:input
                path="userName"
                class="form-control"
                placeholder="Username"
              />
            </div>
            <!-- error: userName -->
            <form:errors class="text-danger" path="userName"></form:errors>
            <!-- email -->
            <div class="mb-3">
              <form:label path="email">Emails</form:label>
              <form:input
                path="email"
                class="form-control"
                type="email"
                placeholder="Email"
              />
            </div>
            <!-- error: email -->
            <form:errors class="text-danger" path="email"></form:errors>
            <!-- PASSWORD -->
            <div class="mb-3">
              <form:label path="password">Password</form:label>
              <form:input
                path="password"
                class="form-control"
                placeholder="Password"
                type="password"
              />
            </div>
            <!-- error: password -->
            <form:errors class="text-danger" path="password"></form:errors>
            <!-- CONFIRM PASSWORD -->
            <div class="mb-3">
              <form:label path="confirmPW">Confirm Password</form:label>
              <form:input
                path="confirmPW"
                class="form-control"
                placeholder="Confirm Password"
                type="password"
              />
            </div>
            <!-- error: confirmPW -->
            <form:errors class="text-danger" path="confirmPW"></form:errors>
            <!-- HIDDEN INPUT: userType == admin -->
            <form:input
              type="hidden"
              path="userType"
              value="admin"
            ></form:input>
            <div class="d-flex justify-content-between flex-wrap">
              <button class="btn admin-btn">Register</button>
              <a href="/" class="btn">Registering as a user?</a>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
