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
            <li>
              <h6 class="dropdown-header">
                User Type: <c:out value="${loggedUser.userType}"></c:out>
              </h6>
            </li>
            <li><a class="dropdown-item" href="/api">Temp: API testing</a></li>
            <li><a class="dropdown-item" href="/user/edit">Edit Profile</a></li>
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
        <!-- NAV BAR END -->
	</div>
<!-- Body -->
<main class="p-3 mb-5">
	<div>
		<h1>Our Available Pets:</h1>
	</div>
	<div class="d-flex align-items-stretch">

	<!-- Filter Box -->
	<div class="row">
	<div class="p-2 col-sm" style="">
		<div class="card form-card">
		<form action="/pet/filter" method="POST" class="">
		  <fieldset class="">
		    <legend class="">Filter Categories</legend>
		    <div class="">
		    <!-- Species Filter -->
		      <div class="">
		        <input class="" type="checkbox" name="cat" id="catCheckboxFilter" <c:if test="${filterList.remove('cat')}">checked</c:if>>
		        <label class="form-label" for="catCheckboxFilter">
		          Cats
		        </label>
		      </div>
		      <div class="">
		        <input class="" type="checkbox" name="dog" id="dogCheckboxFilter" <c:if test="${filterList.remove('dog')}">checked</c:if>>
		        <label class="form-label" for="dogCheckboxFilter">
		          Dogs
		        </label>
		      </div>
		      <div class="">
		        <input class="" type="checkbox" name="bird" id="birdCheckboxFilter" <c:if test="${filterList.remove('bird')}">checked</c:if>>
		        <label class="form-label" for="birdCheckboxFilter">
		          Birds
		        </label>
		      </div>
		      <div class="">
		        <input class="" type="checkbox" name="reptile" id="reptileCheckboxFilter" <c:if test="${filterList.remove('reptile')}">checked</c:if>>
		        <label class="form-label" for="reptileCheckboxFilter">
		          Reptiles
		        </label>
		      </div>
		      <!-- Age Filter  -->
			  <label class="form-label">Age Range:</label>
		      <div class="row g-3">
			      <div class="col-sm">
			        <input class="" type="number" name="low-age" id="lowAgeFilter" placeholder="0" value="${lowAge}">
			      </div>
			      <div class="col-sm">
			        <input class="" type="number" name="high-age" id="highAgeFilter" placeholder="10" value="${highAge}">
			      </div>
		      </div>
			<!-- Gender Filter -->
		      <div class="col-auto">
				<select class="form-select" id="sexFilter" name="sex">
		
					<option value="">Pick a gender...</option>
					<option value="Female" <c:if test="${sexFilter == 'Female'}">selected</c:if>>Female</option>
					<option value="Male" <c:if test="${sexFilter == 'Male'}">selected</c:if>>Male</option>
				</select>
		      </div>
		    </div>	      
		  </fieldset>
		  <button type="submit" class="btn my-0">Filter</button>
		</form>
		</div>
	</div>
	<!-- End Filter Box -->
	<!-- Pet Cards -->
	<div class="d-flex row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
		<c:forEach var="pet" items="${petList}">
			<div class="col">
				<div class="card h-100" style="width: 18rem;">
	  				<img
			            src="/images/${pet.species}.png"
			            class="img-thumbnail pet-profile mb-3 card-img-top"
			            alt="Pet Image"
			          />
	  				<div class="card-body">
	  				<div class="row px-2">
	  					<img
			                src="/images/${pet.species}_icon.png"
			                alt=""
			                style="height: 20px"
			              />
	  					<h5 class="card-title mx-1"><a href="/pet/${pet.id}"><c:out value="${pet.name}"/></a></h5>
	  				</div>
	  				<div class="row px-2">
	    				<p class="card-subtitle card-text mx-1"><small><c:out value="${pet.age}"/> y.o. <c:out value="${pet.sex}"/></small></p>
	    				<p class="card-subtitle card-text"><small><c:out value="${pet.breed}"/></small></p>
	  				</div>
				</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
	</div>
	</main>
	</div>
	
	<!-- Pagination -->
	<div class="text-center">
	<a href="/pet?page=1${filterURL}">1</a>
	<a href="/pet?page=2${filterURL}">2</a>
	<a href="/pet?page=3${filterURL}">3</a>
	<a href="/pet?page=4${filterURL}">4</a>
	
	</div>


</body>
</html>