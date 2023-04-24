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
    <!-- <script src="/webjars/bootstrap/js/bootstrap.min.js"></script> -->
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
    <!-- top half of landing page -->
    <div class="top-half p-3">
      <!-- NAV BAR -->
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
            <!-- will be replacing with {user.name} -->
            <c:out value="${loggedUser.userName}"></c:out>
          </a>

          <ul class="dropdown-menu dropdown-menu-end">
            <c:if test="${loggedUser.userType == 'admin'}">
              <li><h6 class="dropdown-header">Admin Actions:</h6></li>
              <li><a class="dropdown-item" href="/pet/inquire/dashboard">Inquiry Dashboard</a></li>
              <li><a class="dropdown-item" href="/pet/add">+ New Pet</a></li>
              <li>
                <a class="dropdown-item" href="/event/new">+ New Event</a>
              </li>
              <li><hr class="dropdown-divider" /></li>
            </c:if>
            <li><a class="dropdown-item" href="/logout">Logout</a></li>
          </ul>
        </div>
        <!--  -->
      </div>
      <!--  ADOPTION BLOCK -->
      <div
        class="d-flex align-items-center justify-content-between px-3 pb-3 pt-0"
      >
        <div class="col-4">
          <h3 class="mb-2">Adopt and give a pet a second chance.</h3>
          <a href="/pet" class="btn">Adopt a pet today!</a>
        </div>
        <div class="mb-3 col-8 p-2 text-center">
          <img
            src="/images/pet_shelter_withPerson.png"
            alt=""
            style="width: 100%"
          />
        </div>
      </div>
    </div>
    <!-- EVENT CAROUSEL  -->
    <div class="event-row p-3 mb-3">
      <div
        id="carouselExampleControls"
        class="carousel slide px-4"
        data-bs-ride="false"
      >
        <div class="carousel-inner">
          <!-- FOR LOOP - CAROUSEL -->
          <c:forEach var="event" items="${allEvents}" varStatus="loop">
            <c:choose>
            <c:when test="${loop.index == 0}">
          <div class="carousel-item active">
            <!-- EVENT -->
            <div class="event-card card">
              <div class="d-flex">
                  <img
                    src="/images/event.png"
                    class="card-img-top"
                    alt="..."
                  />
                <!-- MAIN CARD CONTENT -->
                <div class="card-body">
                  <h5 class="card-title mb-1"><c:out value="${event.eventName}"></c:out></h5>
                  <div class="d-flex align-items-baseline mb-1">
                    <i class="bi bi-calendar-fill" style="padding-top: 5px;padding-right: 10px; font-size: 1rem;"></i>
                    <h6 class="card-subtitle  text-body-secondary">
                      <fmt:formatDate pattern="MMMM dd, yyyy" value="${event.date}"/>
                    </h6>
                  </div>
                  <div class="d-flex align-items-baseline mb-2">
                    <i class="bi bi-geo-alt-fill" style="padding-top: 5px;padding-right: 10px; font-size: 1rem;"></i>
                    <h6 class="card-subtitle  text-body-secondary">
                      <c:out value="${event.location}"></c:out>
                    </h6>
                  </div>
                  <p class="card-text">
                    <c:out value="${event.eventDetails}"></c:out>
                  </p>
                  <a href="/events/${event.id}" class="btn">Event Details</a>
                </div>
              </div>
            </div>
          </div>
          </c:when>
          <c:otherwise>
            <div class="carousel-item">
                <div class="event-card card">
                <div class="d-flex">
                    <img
                      src="/images/event.png"
                      class="card-img-top"
                      alt="..."
                    />
                  <!-- MAIN CARD CONTENT -->
                  <div class="card-body">
                  <h5 class="card-title mb-1"><c:out value="${event.eventName}"></c:out></h5>
                  <div class="d-flex align-items-baseline mb-1">
                    <i class="bi bi-calendar-fill" style="padding-top: 5px;padding-right: 10px; font-size: 1rem;"></i>
                    <h6 class="card-subtitle  text-body-secondary">
                      <fmt:formatDate pattern="MMMM dd, yyyy" value="${event.date}"/>
                    </h6>
                  </div>
                  <div class="d-flex align-items-baseline mb-2">
                    <i class="bi bi-geo-alt-fill" style="padding-top: 5px;padding-right: 10px; font-size: 1rem;"></i>
                    <h6 class="card-subtitle  text-body-secondary">
                      <c:out value="${event.location}"></c:out>
                    </h6>
                  </div>
                  <p class="card-text">
                    <c:out value="${event.eventDetails}"></c:out>
                  </p>
                  <a href="/events/${event.id}" class="btn">Event Details</a>
                </div>
                </div>
              </div>
            </div>
          </c:otherwise>
          </c:choose>
        </c:forEach>     
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
      </div>
    </div>
    <!-- BOTTOM HALF CONTAINER AFTER CAROUSEL -->
    <div class="bottom-half pt-3 pb-0 mb-0">
      <div class="d-flex align-items-center justify-content-between mb-4 pb-4">
        <div class="col-7 p-3">
          <img
            src="/images/foster_landingPage.png"
            alt=""
            style="width: 100%"
          />
        </div>
        <div class="col-5">
          <h3>Fostering can bring more love into your home today!</h3>
          <a href="/pet" class="btn">Interested in fostering?</a>
        </div>
      </div>
      <div class="footer px-4 mt-3">
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

        <div class="d-flex justify-content-between pt-4 mb-0 border-top">
          <div>
            <p class="mt-0 mb-3 py-0">
              {will be putting the main repo github link }
            </p>
          </div>
          <div>© 2023 Pet Adoption Center</div>
        </div>
      </div>
    </div>
  </body>
</html>
