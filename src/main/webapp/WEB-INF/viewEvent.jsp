<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>View Event</title>
</head>
<body>
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
        <!-- NAV BAR END -->
	  </div>
	</div>
	
	<!-- Main Content -->
	<main class="p-5 mb-5 min-vh-100">
    <div class="card form-card p-4">

      <div class="d-flex justify-content-between align-items-top row-gapping">
        <!-- Left Column -->
        <div class="col px-0">
          <!-- EVENT NAME -->
          <h1 class="text-start"><c:out value="${event.eventName}"/></h1>
          <!-- location row -->
          <div class="d-flex align-items-baseline mb-1">
            <i class="bi bi-geo-alt-fill" style="padding-right: 10px; font-size: 1.25rem;"></i>
            <h6 style="font-weight: 300;"><c:out value="${event.location}"/></h6>
          </div>
          <!-- date of event row-->
          <div class="d-flex align-items-baseline mb-1">
            <i class="bi bi-calendar-fill" style="padding-right: 10px; font-size: 1.25rem;"></i>
            <h6 style="font-weight: 300;"><fmt:formatDate pattern="MMMM dd, yyyy" value="${event.date}"/></h6>
          </div>
          <!-- EVENT CREATOR -->
          <div class="d-flex align-items-baseline mb-1">
            <i class="bi bi-person-fill" style="padding-right: 10px; font-size: 1.25rem;"></i>
            <h6 style="font-weight: 300;"><c:out value="${event.postedBy}"></c:out></h6>
          </div>
          <div class="card form-card p-3 mb-3">
            <h6>About this event:</h6>
            <p><c:out value="${event.eventDetails}"/></p>
          </div>
          <div class="card form-card p-3">
            <h6>
              Location Details:
            </h6>
            <!-- put map api code here! -->
          </div>
          <!-- button row for admins -->
          <!-- ADMIN CONTROLS -->
        </div>
        <!-- Right column -->
        <div>
          
          <div>
            <c:if test="${loggedUser.userType == 'admin'}">
              <div class="d-flex justify-content-end mb-3">
                <a class="btn" href="/event/edit/${event.id}" style="margin-right: 10px;">Edit Event</a> </p>
                <a class="btn admin-btn" href="/event/delete/${event.id}">Delete Event</a>
              </div>
            </c:if>
             <img
            src="/images/event.png"
            class="img-thumbnail pet-profile"
            alt="picture of dog at an adoption fair"
            style="height:350px"
            />
          </div>
        </div>
      </div>
    </div>
	</main>
	<!-- Footer -->
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