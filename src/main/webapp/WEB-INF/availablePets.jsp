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
        class="d-flex flex-wrap justify-content-between align-items-center mb-2"
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
        </div>
	</div>
        <!-- NAV BAR END -->
	
	<!-- Body/Main Content -->
	<!-- Available Pets Header -->
	<!-- Header End -->
	<main class="p-4 px-5 mb-5">
    <div class="mb-2 pl-2">
      <h1>Our Available Pets:</h1>
    </div>
	<div class="d-flex align-items-stretch flex-wrap">
	
	<!-- Left Column -->
	<div class="p-2 col-sm-3" style="min-width: 300px; max-width:450px">
		<!-- Filter Box -->
			<div class="card form-card p-3 mb-3">
			<form action="/pet/filter" method="POST" class="">
			  <fieldset class="d-flex mb-2">
			    <legend class="" style="font-weight: 500;"><i class="bi bi-funnel px-1"></i>Filter</legend>
			    <div class="">
			    <!-- Species Filter -->
          <label class="form-label">Species:</label>
			      <div class="">
			        <input class="" type="checkbox" name="cat" id="catCheckboxFilter" <c:if test="${filterList.remove('cat')}">checked</c:if>>
			        <label class="form-label-filter" for="catCheckboxFilter">
			          Cats
			        </label>
			      </div>
			      <div class="">
			        <input class="" type="checkbox" name="dog" id="dogCheckboxFilter" <c:if test="${filterList.remove('dog')}">checked</c:if>>
			        <label class="form-label-filter" for="dogCheckboxFilter">
			          Dogs
			        </label>
			      </div>
			      <div class="">
			        <input class="" type="checkbox" name="bird" id="birdCheckboxFilter" <c:if test="${filterList.remove('bird')}">checked</c:if>>
			        <label class="form-label-filter" for="birdCheckboxFilter">
			          Birds
			        </label>
			      </div>
			      <div class="">
			        <input class="" type="checkbox" name="reptile" id="reptileCheckboxFilter" <c:if test="${filterList.remove('reptile')}">checked</c:if>>
			        <label class="form-label-filter" for="reptileCheckboxFilter">
			          Reptiles
			        </label>
			      </div>
			      <!-- Age Filter  -->
            <hr>
				  <label class="form-label">Age Range:</label>
			      <div class="d-flex mb-2 row-gapping flex-wrap">
				      <div class="col-sm px-0">
				        <input class="form-control" type="number" name="low-age" id="lowAgeFilter" placeholder="0" value="${lowAge}">
				      </div>
				      <div class="col-sm px-0">
				        <input class="form-control" type="number" name="high-age" id="highAgeFilter" placeholder="10" value="${highAge}">
				      </div>
			      </div>
				<!-- Gender Filter -->
        <hr>
         <label class="form-label">Gender:</label>
			      <div class="col-sm px-0 mb-2">
					<select class="select p-2" id="sexFilter" name="sex">
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
		
		<!-- Right Column -->
		<div class="p-2 col-sm ml-4">
		<!-- Pet Cards -->
		<div class="row btn-gapping">
      <!-- if there are no pets in db -->
      <c:if test="${petList.size() == 0}">
        <div class="card form-card p-3">
          <div class="d-flex align-items-start row-gapping">
            <i class="bi bi-bookmark-heart-fill" style="font-size:3.75rem"></i>
            <div>

              <h3>All of our pets are either adopted or being fostered!</h3>
              <h6 style="font-weight: 300;">We'll update our website when we have a pet in need of a home...</h6>
            </div>
          </div>
        </div>
      </c:if>
      <!-- PET FOR LOOP -->
			<c:forEach var="pet" items="${petList}">
        <div class="g-col-6 mx-1 mb-2">
          <a href="/pet/${pet.id}" class="pet-card">
          <div class="card form-card pet-card h-100 p-2" style="width: 18rem;">
            <!-- PET PROFILE PIC -->
		  				<img
				            src="/images/${pet.species}.png"
				            class="img-thumbnail pet-profile card-img-top"
				            alt="Pet Image"
				          />
              <!-- CARD BODY -->
		  				<div class="card-body" style="padding: 15px; padding-bottom: 10px;" >
                <!-- NAME ROW -->
		  				<div class="d-flex align-items-center mb-2">
		  					<img
				                src="/images/${pet.species}_icon.png"
				                alt=""
				                style="height: 1.25rem; padding-right: 5px;"
				              />
		  					<h5 class="card-title mx-1 mb-0 pt-1"><a href="/pet/${pet.id}" class="inquiry-link"><c:out value="${pet.name}"/></a></h5>
		  				</div>
                <div class="d-flex align-items-center mb-2">
                  <h6 class="my-0" style="margin-right: 10px;">Age:</h6>
                  <p class=" my-0 form-label-filter" style="font-size: 15px;">
                      <c:out value="${pet.age}"/> y.o. <c:out value="${pet.sex}"/>
                  </p>
                </div>
                <div class="d-flex">
                  <h6 style="margin-right: 10px;">Breed:</h6>
                  <p class="my-0 form-label-filter" style="font-size: 15px;"><c:out value="${pet.breed}"/></p>
                </div>
					</div>
        </div>
      </a>
				</div>
			</c:forEach>
			</div>
			<!-- Pet Card End -->

			<!-- Pagination -->
			<c:if test="${lastPage > 1}">
				<div class="text-center">
				<a href="/pet?page=1${filterURL}">First</a>
				<c:if test="${currentPage != 1}">
					<a href="/pet?page=${currentPage-1}${filterURL}">Previous</a>
				</c:if>
			
				<c:if test="${currentPage != lastPage}">
					<a href="/pet?page=${currentPage+1}${filterURL}">Next</a>
				</c:if>
				<a href="/pet?page=${lastPage}${filterURL}">Last</a>
				</div>
			</c:if>
			<!-- Pagination End-->
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