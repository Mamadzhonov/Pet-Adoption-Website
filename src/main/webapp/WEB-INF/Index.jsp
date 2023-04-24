<%@ page isErrorPage="true" %> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

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
<script src="/js/app.js" defer></script>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Home</title>
  </head>

  <body>
    <h1>Hello, <c:out value="${loggedUser.userName}"></c:out></h1>
    <div style="text-align: center">
      <p class="text-danger">
        <c:out value="${permitionIssue}"></c:out>
      </p>
    </div>
    <div>
      <button onclick="getAJoke()">Click me i will say a joke</button>
      <p id="title1"></p>

      <button onclick="getCatImage()">Click me i will show a cat</button>
      <button onclick="getDogImage()">Click me i will show a dog</button>

      <a class="btn btn-danger" href="/logout">Logout</a>
    </div>
  </body>
</html>
