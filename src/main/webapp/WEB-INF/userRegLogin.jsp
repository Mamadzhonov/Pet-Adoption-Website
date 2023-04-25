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
    <!-- LOGO HEADER -->
    <div class="d-flex align-items-center ml-3 mb-4">
      <img
        src="/images/animalLogo_solid.png"
        alt=""
        style="height: 30px; padding-right: 10px; padding-bottom: 3px"
      />
      <h3 id="logo" class="my-0 flex-grow-1 pt-0 ms-2">Pet Adoption</h3>
    </div>
    <!-- REG/ LOGIN ROW -->
    <div class="d-flex flex-wrap row-gapping">
      <!-- Registration COLUMN -->
      <div class="col px-0">
        <div class="card form-card p-3">
          <h2>Register</h2>
          <hr />
          <!-- ERROR VALIDATIONS FOR EMAIL -->
          <div>
            <p class="text-danger">
              <c:out value="${emailExist}"></c:out>
            </p>
            <p class="text-danger">
              <c:out value="${permitionIssue}"></c:out>
            </p>
          </div>
          <form:form action="/register" method="POST" modelAttribute="newUser">
            <div class="mb-3">
              <form:label path="userName">Username:</form:label>
              <form:input
                path="userName"
                class="form-control"
                placeholder="Username"
              />
            </div>
            <!-- error: userName -->
            <div class="mb-3">
              <form:errors
                path="userName"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <!-- email -->
            <div class="mb-3">
              <form:label path="email">Email:</form:label>
              <form:input
                path="email"
                class="form-control"
                type="email"
                placeholder="Email"
              />
            </div>
            <!-- error: email -->
            <div class="mb-3">
              <form:errors
                path="email"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <!-- PASSWORD -->
            <div class="mb-3">
              <form:label path="password">Password:</form:label>
              <form:input
                path="password"
                class="form-control"
                placeholder="Password"
                type="password"
              />
            </div>
            <!-- error: password -->
            <div class="mb-3">
              <form:errors
                path="password"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <!-- CONFIRM PASSWORD -->
            <div class="mb-3">
              <form:label path="confirmPW">Confirm Password:</form:label>
              <form:input
                path="confirmPW"
                class="form-control"
                placeholder="Confirm Password"
                type="password"
              />
            </div>
            <!-- error: confirmPW -->
            <div class="mb-3">
              <form:errors
                path="confirmPW"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <form:input type="hidden" path="userType" value="user"></form:input>
            <div class="d-flex justify-content-between flex-wrap btn-gapping">
              <button class="btn">Register</button>
              <a href="/admin/register-login" class="btn admin-btn"
                >Registering as an Admin?</a
              >
            </div>
          </form:form>
        </div>
      </div>
      <!-- LOGIN COLUMN -->
      <div class="col px-0">
        <div class="card form-card p-3">
          <h2>Log in</h2>
          <hr />
          <div>
            <p class="text-danger">
              <c:out value="${loginIssue}"></c:out>
            </p>
          </div>
          <form:form action="/login" method="POST" modelAttribute="newLogin">
            <div class="mb-3">
              <form:label path="email">Email:</form:label>
              <form:input
                path="email"
                class="form-control"
                type="email"
                placeholder="Email"
              />
            </div>
            <div class="mb-3">
              <form:errors
                path="email"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <div class="mb-3">
              <form:label path="password">Password:</form:label>
              <form:input
                path="password"
                class="form-control"
                placeholder="Password"
                type="password"
              />
            </div>
            <div class="mb-3">
              <form:errors
                path="password"
                class="py-1 mb-3 alert alert-danger"
              ></form:errors>
            </div>
            <button class="btn">Log in</button>
          </form:form>
        </div>
      </div>
    </div>
    <!--  -->
  </body>
</html>
