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
    <title>Edit Pet</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/style.css" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap"
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
    <!-- PAGE CONTAINER -->
    <div class="p-3">
      <!-- NAV BAR -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-4"
      >
        <div class="d-flex align-items-center mb-1 nav-links">
          <img
            src="/images/animalLogo_solid.png"
            alt=""
            style="height: 30px; padding-right: 10px; padding-bottom: 3px"
          />
          <h3 id="logo" class="my-0 flex-grow-1 pt-0 ms-2">Pet Adoption</h3>
        </div>
        <div class="d-flex align-items-center ms-auto">
          <a href="/home" class="nav-link">Home</a>
          |
          <a href="/pet?page=1" class="nav-link">Pets</a>
          |
          <a href="/about" class="nav-link">About</a>
          |
          <a href="/events" class="nav-link">Upcoming Events</a>
        </div>
        <!-- navbar: end section -->
        <div class="dropdown" id="dropdown">
          <a
            class="btn dropdown-toggle"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <!-- user icon -->
            <i class="bi bi-person-fill me-3"></i>
            <!-- will be replacing with {user.name} -->
            <c:out value="${loggedUser.userName}"></c:out>
          </a>

          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="/api">Temp: API testing</a></li>
            <li><a class="dropdown-item" href="/user/edit">Edit Profile</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><h6 class="dropdown-header">Admin Actions:</h6></li>
            <li><a class="dropdown-item" href="/pet/add">+ New Pet</a></li>
            <li><a class="dropdown-item" href="/event/add">+ New Event</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </div>
        <!--  -->
      </div>
      <main class="p-3 mb-5">
        <div class="d-flex align-items-center">
          <!-- LEFT COLUMN -->
          <div class="p-2 flex-fill">
            <!-- <div class="card"> -->
            <img
              src="/images/new_pet.png"
              alt=""
              style="height: auto; width: 375px"
            />
            <!-- </div> -->
          </div>
          <div class="p-2 col-sm">
            <div class="card p-4 form-card">
              <h2>Edit Pet</h2>
              <hr />
              <form:form
                action="/pet/edit"
                class="mt-2"
                method="POST"
                modelAttribute="pet"
              >
                <!-- NAME -->
                <input type="hidden" name="_method" value="PUT" />
                <div class="mb-3">
                  <form:label path="name" class="form-label"
                    >Pet Name:</form:label
                  >
                  <form:input
                    path="name"
                    type="text"
                    class="form-control"
                    placeholder="Pet name here..."
                  />
                </div>
                <!-- ERROR: NAME -->
                <form:errors
                  path="name"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- AGE -->
                <div class="mb-3">
                  <form:label path="age" class="form-label">Age:</form:label>
                  <form:input
                    path="age"
                    type="number"
                    class="form-control"
                    placeholder="Pet age here..."
                  />
                </div>
                <!-- ERROR: AGE -->
                <form:errors
                  path="name"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- GENDER -->
                <form:label path="sex" class="form-label">Gender:</form:label>
                <div class="mb-3">
                  <select class="select p-2" path="sex">
                    <option>Pick a gender...</option>
                    <option value="female">Female</option>
                    <option value="male">Male</option>
                  </select>
                </div>
                <!-- ERROR: sex -->
                <form:errors
                  path="name"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- DATE OF ARRIVAL -->
                <div class="mb-3">
                  <form:label path="dateOfArrival" class="form-label"
                    >Date of Arrival:</form:label
                  >
                  <form:input
                    type="date"
                    class="form-control"
                    path="dateOfArrival"
                  />
                </div>
                <!-- ERROR: date of arrival -->
                <form:errors
                  path="dateOfArrival"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- SPECIES -->
                <form:label path="species" class="form-label"
                  >Species</form:label
                >
                <div class="mb-3">
                  <select class="select p-2" path="species">
                    <option>Add a species...</option>
                    <option value="cat">cat</option>
                    <option value="dog">dog</option>
                    <option value="bird">bird</option>
                    <option value="reptile">reptile</option>
                  </select>
                </div>
                <form:errors
                  path="species"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- BREED -->
                <div class="mb-3">
                  <form:label path="breed" class="form-label"
                    >Breed:</form:label
                  >
                  <form:input
                    path="breed"
                    type="text"
                    class="form-control"
                    placeholder="Pet breed here..."
                  />
                </div>
                <!-- ERROR: BREED -->
                <form:errors
                  path="breed"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- DESCRIPTION -->
                <div class="mb-3">
                  <form:label path="description" class="form-label"
                    >Tell us about your pet!</form:label
                  >
                  <form:textarea
                    path="description"
                    class="form-control"
                    style="height: 100px"
                    placeholder="In what condition did your pet arrive? Did they use to live with another family or did they arrive alone? Let us know..."
                  ></form:textarea>
                </div>
                <form:errors
                  path="description"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <div class="d-flex align-items-end justify-content-between">
                  <div class="">
                    <form:label path="species" class="form-label"
                      >Pet Status</form:label
                    >
                    <div>
                      <select class="select p-2" path="species">
                        <option>Set a status...</option>
                        <option value="In process of adoption">
                          In process of adoption
                        </option>
                        <option value="In process of fostering">
                          In process of fostering
                        </option>
                        <option value="Available">Available</option>
                        <option value="Not Available">Not Available</option>
                      </select>
                    </div>
                  </div>
                  <button class="btn my-0">Create Pet</button>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </main>
    </div>
    <div class="footer px-4 pt-5 mt-5">
      <div class="d-flex flex-wrap justify-content-between">
        <div class="d-flex flex-column mb-3">
          <h5>
            <img
              src="/images/animalLogo_solid.png"
              alt=""
              style="height: 30px; padding-right: 10px; padding-bottom: 3px"
            />Pet Adoption
          </h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2">
              <a href="/home" class="nav-link p-0 text-muted">Home</a>
            </li>
            <li class="nav-item mb-2">
              <a href="/pet" class="nav-link p-0 text-muted">Pets</a>
            </li>
            <li class="nav-item mb-2">
              <a href="/events" class="nav-link p-0 text-muted"
                >Upcoming Events</a
              >
            </li>
            <li class="nav-item mb-2">
              <a href="/about" class="nav-link p-0 text-muted">About</a>
            </li>
          </ul>
        </div>
        <div class="d-flex flex-column mb-3">
          <form>
            <h5>Subscribe to our newsletter</h5>
            <p>Monthly digest of what's new and exciting from us.</p>
            <div class="d-flex flex-column justify-content-between">
              <label for="newsletter1" class="visually-hidden"
                >Email address</label
              >
              <div class="d-flex justify-content-between row-gapping">
                <input
                  id="newsletter1"
                  type="text"
                  class="form-control"
                  placeholder="Email address"
                />
                <button class="btn" type="button">Subscribe</button>
              </div>
            </div>
          </form>
        </div>
      </div>

      <div class="d-flex justify-content-between pt-4 mb-2 mt-1 border-top">
        <div>
          <p>{will be putting the main repo github link }</p>
        </div>
        <div>© 2023 Pet Adoption Center</div>
      </div>
    </div>
  </body>
</html>
