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
    <title>View Pet</title>
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
    <!-- BOOTSTRAP ICONS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"
    />
  </head>
  <body>
    <div class="p-3">
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
          <a href="/pet" class="nav-link">Pets</a>
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
    </div>
    <!-- MAIN CONTENT -->
    <main class="p-3 mb-5">
      <div class="d-flex align-items-stretch">
        <!-- LEFT COLUMN -->
        <div class="p-2 col-sm">
          <!-- might be a nice touch to add the species icon next to the name -->
          <div class="card p-4 form-card mb-3">
            <div class="d-flex align-items-center mb-2">
              <!-- will need a c:if for icon options -->
              <img src="/images/cat_icon.png" alt="" style="height: 45px" />
              <h1 class="mx-2">{Pet Name}</h1>
            </div>
            <h6>Species: {species}</h6>
            <h6>breed: {breed}</h6>
            <h6>Gender: {sex}</h6>
            <h6>Status: {status}</h6>
          </div>
          <div class="card p-4 form-card">
            <h3>About this pet:</h3>
            <hr />
            <p>
              Lorem ipsum, dolor sit amet consectetur adipisicing elit.
              Veritatis, unde quod, amet, et praesentium natus aut alias
              voluptatum quisquam omnis suscipit odio. Cupiditate voluptatem
              soluta delectus possimus! Eaque, qui atque!
            </p>
          </div>
        </div>
        <!-- RIGHT COLUMN -->
        <div class="p-2 col-sm">
          <img
            src="/images/cat_profile2.png"
            class="img-thumbnail pet-profile mb-3"
            alt="..."
          />
          <div class="card p-4 form-card">
            <h3>Location</h3>
            <!-- leaving space for location, if we need it -->
            <!-- can always take this out if we need to -->
          </div>
        </div>
      </div>
    </main>
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