<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Formatting (dates) -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8" />
                        <title>Home</title>
                        <link rel="stylesheet"
                            href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                            crossorigin="anonymous" />
                        <link rel="stylesheet" href="/css/style.css" />
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                            crossorigin="anonymous"></script>
                        <script type="text/javascript" src="/js/app.js"></script>
                        <!-- change to match your file/naming structure -->
                        <!-- FONTS -->
                        <link rel="preconnect" href="https://fonts.googleapis.com" />
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                        <link
                            href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap"
                            rel="stylesheet" />
                        <!--  -->
                        <!-- BOOTSTRAP ICONS -->
                        <link rel="stylesheet"
                            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
                    </head>

                    <body>
                        <!-- NAV BAR -->
                        <div class="top-half p-3">
                            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                                <div class="d-flex align-items-center mb-1 nav-links">
                                    <img src="/images/animalLogo_solid.png" alt=""
                                        style="height: 30px; padding-right: 10px; padding-bottom: 3px" />
                                    <h3 id="logo" class="my-0 flex-grow-1 pt-0 ms-2">Pet Adoption</h3>
                                </div>
                                <div class="d-flex align-items-center ms-auto">
                                    <a href="/about" class="nav-link">Home</a>
                                    |
                                    <a href="/about" class="nav-link">Pets</a>
                                    |
                                    <a href="/about" class="nav-link">About</a>
                                    |
                                    <a href="/events" class="nav-link">Upcoming Events</a>
                                </div>
                                <!-- navbar: end section -->
                                <div class="dropdown" id="dropdown">
                                    <a class="btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <!-- user icon -->
                                        <i class="bi bi-person-fill me-3"></i>
                                        <!-- will be replacing with {user.name} -->
                                        <c:out value="${loggedUser.userName}"></c:out>
                                    </a>

                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/api">Temp: API testing</a></li>
                                        <li><a class="dropdown-item" href="/pet/new">+ New Pet</a></li>
                                        <li><a class="dropdown-item" href="/user/edit">Edit Profile</a></li>
                                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="hearderLinks" style="margin-bottom: 90px;">
                            <h1>
                                <c:out value="${eventById.eventName}"></c:out>
                            </h1>
                            <a class="text-info" href="/events">Back to Events</a>
                        </div>

                        <form:form action="/event/edit/${updatedForm.id}" method="POST" modelAttribute="updatedForm">

                            <div class="col-md-5 mb-3">
                                <form:label path="title">Title</form:label>
                                <form:input path="title" class="form-control" placeholder="Title" />
                                <form:errors class="text-danger" path="title"></form:errors>
                            </div>

                            <div class="col-md-5 mb-3">
                                <form:label path="network">Network</form:label>
                                <form:input path="network" class="form-control" />
                                <form:errors path="network" class="text-danger"></form:errors>
                            </div>

                            <div class="col-md-5 mb-3">
                                <form:label path="description">Description</form:label>
                                <form:textarea path="description" class="form-control" />
                                <form:errors path="description" class="text-danger"></form:errors>
                            </div>
                            <button class="btn btn-success">Submit</button>
                            <a class="btn btn-primary" href="/shows">Cancel</a>
                            <a class="btn btn-danger" href="/show/delete/${updatedForm.id}">Delete</a>

                        </form:form>


                    </body>

                    </html>