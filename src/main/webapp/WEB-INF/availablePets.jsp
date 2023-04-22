<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

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

<title>Current Available Pets</title>
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
            <li>
              <h6 class="dropdown-header">
                User Type: <c:out value="${loggedUser.userType}"></c:out>
              </h6>
            </li>
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
      </div>
        <!-- NAV BAR END -->
	</div>
<!-- Body -->

<div>
<h1>Our Available Pets:</h1>
</div>

<!-- Pet Cards -->
<!-- Row of Pets -->
	<div class="d-flex row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
	<!-- Filter Box -->
		<div class="">
			<div class="col">
				<div class="card h-100 opacity-50" style="width: 18rem;">
	  				<div class="card-body">
		  				<ul class="list-group list-group-flush ">
		  					<li class="text-start ">Filter Categories</li>
		  					<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="catCheckboxFilter" name="cat">
						    	<label class="form-check-label stretched-link" for="catCheckboxFilter"><small>Cats</small></label>
						  	</li>
						  	<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="dogCheckboxFilter" name="dog">
						    	<label class="form-check-label stretched-link" for="dogCheckboxFilter"><small>Dogs</small></label>
						  	</li>
						  	<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="birdCheckboxFilter" name="bird">
						    	<label class="form-check-label stretched-link" for="birdCheckboxFilter"><small>Birds</small></label>
						  	</li>
						  	<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="reptileCheckboxFilter" name="reptile">
						    	<label class="form-check-label stretched-link" for="reptileCheckboxFilter"><small>Reptiles</small></label>
						  	</li>
						  	<!-- change to select -->
						  	<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="maleCheckboxFilter">
						    	<label class="form-check-label stretched-link" for="maleCheckboxFilter"><small>Male</small></label>
						  	</li>
						  	<li class="list-group-item list-group-item-action">
						    	<input class="form-check-input me-1" type="checkbox" value="" id="femaleCheckboxFilter">
						    	<label class="form-check-label stretched-link" for="femaleCheckboxFilter"><small>Female</small></label>
						  	</li>
						</ul>
	  				</div>
				</div>
			</div>
		</div>
	
		<c:forEach var="pet" items="${pets}">
			<div class="col">
				<div class="card h-100" style="width: 18rem;">
	  				<img src="..." class="card-img-top" alt="Pet Image">
	  				<div class="card-body">
	  					<h5 class="card-title"><a href=""><c:out value="${pet.name}"/></a></h5>
	    				<p class="card-text"><c:out value="${pet.age}"/></p>
	    				<p class="card-text"><c:out value="${pet.breed}"/></p>
	  				</div>
				</div>
			</div>
		</c:forEach>
		
		<div class="col">
			<div class="card h-100" style="width: 18rem;">
  				<img src="..." class="card-img-top" alt="Pet Image">
  				<div class="card-body">
  					<h5 class="card-title">Pet Name</h5>
    				<p class="card-text">Some Pet Details Here</p>
    				<p class="card-text">Some Pet Details Here</p>
  				</div>
			</div>
		</div>
		
		
		<div class="col">
			<div class="card h-100" style="width: 18rem;">
  				<img src="..." class="card-img-top" alt="Pet Image">
  				<div class="card-body">
  					<h5 class="card-title">Pet Name</h5>
    				<p class="card-text">Some Pet Details Here</p>
    				<p class="card-text">Some Pet Details Here</p>
  				</div>
			</div>
		</div>
	</div>
	<!-- Row of Pets -->
	
	<!-- Pagination -->
	<div class="text-center">
	<a href="">1</a>
	<a href="">2</a>
	<a href="">3</a>
	<a href="">4</a>
	
	</div>


</body>
</html>