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
    <div class="d-flex flex-column justify-content-between p-3">
      <!-- NAVBAR -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3"
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
            <li>
              <h6 class="dropdown-header">
                User Type: <c:out value="${loggedUser.userType}"></c:out>
              </h6>
            </li>
            <li><hr class="dropdown-divider" /></li>
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
      <!-- MAIN PAGE CONTENT -->
      <main>
        <div>
          <div class="p-3">
            <h1>About This Project</h1>
            <hr />
            <div class="d-flex flex-wrap mb-3 row-gapping flex-wrap">
              <div class="card form-card col-sm p-3">
                <!-- LEFT COLUMN -->
                <h4>Project summary</h4>
                <p>
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                  Facilis blanditiis voluptatem nesciunt est dolorum
                  perspiciatis rem labore ex et officia adipisci libero nostrum
                  eos a accusantium nisi, vitae doloribus sed.
                </p>
                <div class="d-flex align-items-center">
                  <!-- GITHUB REPO LINK -->
                  <a
                    href="https://github.com/Mamadzhonov/Pet-Adoption-Website"
                    class="p-0 nav-link"
                    style="font-size: 40px"
                    ><i class="bi bi-github"></i
                  ></a>
                  <i class="bi bi-arrow-left pl-2 pr-1"></i>
                  <h4 class="my-0">Come checkout our code!</h4>
                </div>
              </div>
              <!-- RIGHT COL -->
              <div class="card form-card p-3">
                <h4>Members:</h4>
                <div class="mb-1 d-flex row-gapping">
                  <p class="p-0 m-0">Stephen Brown</p> 
                  <i class="bi bi-github" style=""></i>
                </div>
              </div>
            </div>
            <div class="card form-card p-3">
              <h4>Credits and resources</h4>
              <p>
                Images and image decoration assets resourced from
                <a href="canva.com">Canva</a>
              </p>
              <p>
                Icons and logo resourced from
                <a href="https://www.flaticon.com/">FlatIcon</a> and
                <a href="https://icons.getbootstrap.com/">Bootstrap</a>
              </p>
            </div>
          </div>
        </div>
      </main>
      <!-- FOOTER -->
      <div class="footer fixed-bottom px-4">
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

        <div class="d-flex justify-content-between py-4 mb-0 border-top">
          <div>
            <p>{will be putting the main repo github link }</p>
          </div>
          <div>© 2023 Pet Adoption Center</div>
        </div>
      </div>
    </div>
  </body>
</html>
