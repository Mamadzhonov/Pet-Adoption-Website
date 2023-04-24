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
          <c:if test="${loggedUser.userType == 'user'}">
          <a 
            class="btn dropdown-toggle"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          ></c:if>
          <c:if test="${loggedUser.userType == 'admin'}">
             <a
            class="btn admin-btn dropdown-toggle dropdown-toggle-admin"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
          </c:if>
            <!-- user icon -->
            <i class="bi bi-person-fill me-3"></i>
            <c:out value="${loggedUser.userName}"></c:out>
          </a>

          <ul class="dropdown-menu dropdown-menu-end">
            <c:if test="${loggedUser.userType == 'admin'}">
              <li><h6 class="dropdown-header">Admin Actions:</h6></li>
              <li><a class="dropdown-item" href="/inquire/dashboard">Inquiry Dashboard</a></li>
              <li><a class="dropdown-item" href="/pet/add">+ New Pet</a></li>
              <li>
                <a class="dropdown-item" href="/event/new">+ New Event</a>
              </li>
              <li><hr class="dropdown-divider" /></li>
            </c:if>
            <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </div>
    </div>
    <!-- MAIN CONTENT -->
    <main class="p-3 mb-5">
      <div class="d-flex align-items-stretch">
        <!-- LEFT COLUMN -->
        <div class="p-2 col-sm">
          <!-- might be a nice touch to add the species icon next to the name -->
          <div class="card p-3 form-card mb-3">
            <div class="d-flex align-items-center justify-content-between mb-2">
              <!-- PET IMAGE -->
              <div class="d-flex align-items-center justify-content-between">
                <img
                  src="/images/${pet.species}_icon.png"
                  alt=""
                  style="height: 35px"
                />
                <h1 class="mx-2 mb-0"><c:out value="${pet.name}"></c:out></h1>
              </div>
              <!-- only appears if user is NOT an admin -->
              <c:if test="${loggedUser.userType == 'user'}">
                <!-- PET INQUIRY BTN -->
                 <div>
                  <a href="/pet/add/inquiry/${pet.id}" class="btn">Interested in this pet?</a>
                </div>
              </c:if>
            </div>
            <hr class="my-1 mb-3"/>
            <h6>Species: <span style="font-weight: 300;"><c:out value="${pet.species}"></c:out></span></h6>
            <h6>Breed: <span style="font-weight: 300;"><c:out value="${pet.breed}"></c:out></span></h6>
            <h6>Gender: <span style="font-weight: 300;"><c:out value="${pet.sex}"></c:out></span></h6>
            <h6>Status: <span style="font-weight: 300;"><c:out value="${pet.petStatus}"></c:out></span></h6>
            <c:if test="${loggedUser.userType == 'admin'}">
              <div>
              <hr />
              <h6>Admin Actions:</h6>
              <div class="d-flex">
                <a
                  href="/pet/edit/${pet.id}"
                  class="btn"
                  style="margin-right: 15px"
                  >Edit Pet</a
                >
                <a href="/" class="btn admin-btn">Delete Pet</a>
              </div>
            </div>
            </c:if>
            

          </div>
          <div class="card p-3 form-card">
            <h3>About this pet:</h3>
            <hr />
            <!-- <a href="https://www.flaticon.com/free-icons/dog" title="dog icons">Dog icons created by Freepik - Flaticon</a> -->
            <p>
              <c:out value="${pet.description}"></c:out>
            </p>
          </div>
        </div>
        <!-- RIGHT COLUMN -->
        <div class="p-2 col-sm">
          <!-- instead of a c:if, we can pass through what species to find the image -->
          <img
            src="/images/${pet.species}.png"
            class="img-thumbnail pet-profile mb-3"
            alt="..."
          />
          <!-- <div class="card p-3 form-card"> -->
            <!-- <h3>Location</h3> -->
            <!-- leaving space for location, if we need it -->
            <!-- can always take this out if we need to -->
          <!-- </div> -->
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
            <a href="/pet?page=1" class="nav-link p-0 text-muted">Pets</a>
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
      <div>� 2023 Pet Adoption Center</div>
    </div>
  </div>
  </body>
</html>
