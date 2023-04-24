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
	<title>Upcoming Events</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
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
	<link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap" rel="stylesheet" />
	<!--  -->
	<!-- BOOTSTRAP ICONS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
</head>

<body onLoad="setAllMapsImageSrc()">
<div class="top-half p-3">
<!-- NAV BAR -->
	<div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
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
        </div>
        <!-- NAVBAR ENDS -->
        
	<!-- Upcoming Events Header -->
  <main class="p-3 mx-4 mb-5">
    <div class="d-flex align-items-start row-gapping">
      <!-- Left Column -->    
      <div class="mr-3 col-sm-3">
        <img
        src="/images/event_list_img.png"
        alt=""
        style="width: 100%"
        />
      </div>
      
      <!-- Right Column -->
      <div>
      <h1 class="mb-3" style="margin-left: -10px;">Upcoming Events</h1>        
	<!-- Event Cards -->
	<div class="row mt-3 row-gapping">
		<c:forEach var="event" items="${events}">
      <div class="g-col-6 mx-1 mb-2">
          <a href="/events/${event.id}" class="pet-card">
          <div class="card form-card pet-card h-100 p-2" style="width: 18rem;">
            <!-- PET PROFILE PIC -->
		  				<img
				            class="google-map img-thumbnail pet-profile card-img-top"
				            alt="${event.location}"
				          />
              <!-- CARD BODY -->
		  				<div class="card-body" style="padding: 10px; padding-bottom: 10px;" >
                <!-- NAME ROW -->
		  				<div class="d-flex align-items-center mb-2">
		  					<h5 class="card-title mx-1 mb-0 pt-1"><a href="/events/${event.id}" class="inquiry-link"><c:out value="${event.eventName}"/></a></h5>
		  				</div>
                <div class="d-flex align-items-center mb-2 btn-gapping">
                  <i class="bi bi-calendar-fill"></i>
                  <p class=" my-0 form-label-filter" style="font-size: 15px;">
                <fmt:formatDate pattern="MMMM dd, yyyy" value="${event.date}"/>
                  </p>
                </div>
                <div class="d-flex align-items-center mb-2 btn-gapping">
                  <i class="bi bi-geo-alt-fill"></i>
                  <p class=" my-0 form-label-filter" style="font-size: 15px;">
                <c:out value="${event.location}"></c:out>
                  </p>
                </div>
					</div>
        </div>
      </a>
				</div>
		</c:forEach>
	</div>
	<!-- Event Card End  -->
	</div>
</div>
</main>
<!-- Footer -->
    <div class="footer px-4" style="margin-top:115px;">
      <div class="d-flex flex-wrap justify-content-between">
        <div class="d-flex flex-column mb-1">
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
        <div class="d-flex flex-column">
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
      <hr class="my-2">
      <div class="d-flex align-items-baseline btn-gapping mb-3">
<a
                  href="https://github.com/Mamadzhonov/Pet-Adoption-Website"
                  class="p-0 nav-link"
                  style="font-size: 1.5rem"
                  ><i class="bi bi-github"></i 
                ></a>
        <p class="mb-0 ms-2">Visit our GitHub repo!</p> 
      </div>
    </div>

</body>
</html>