<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Home</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/style.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;400;500;800&display=swap"
      rel="stylesheet"
    />
    <!--  -->
    <!-- BOOTSTRAP ICONS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"
    />
  </head>
  <body>
    <!-- NAV BAR -->
    <div
      class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
      id="header"
    >
      <div class="d-flex align-items-center">
        <img
          src="/images/animalLogo_solid.png"
          alt=""
          style="height: 30px; padding-right: 10px; padding-bottom: 3px"
        />
        <h3 id="logo" class="my-0 flex-grow-1 pt-0 ms-2">Pet Adoption</h3>
      </div>
      <div class="d-flex">
        <a href="/about" class="nav-link">Home</a>
        <a href="/about" class="nav-link">About</a>
      </div>
      <!-- navbar: end section -->
      <div class="d-flex trip_row flex-wrap">
        <a href="/trip/new" class="nav-link">+ New Pet</a>
        <a href="#" class="nav-link">
          <i class="bi bi-person-fill me-3"></i>
          {user name here}</a
        >
        <a href="/logout" class="nav-link logout">Logout</a>
      </div>
    </div>
    <!--  -->
  </body>
</html>
