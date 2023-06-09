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
    <title>Create New Pet Inquiry</title>
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
      <main class="mb-5" style="padding-left:0.5rem; padding: 1rem;">
        <div class="d-flex align-items-center">
          <!-- LEFT COLUMN -->
          <div class="p-2 flex-fill">
            <!-- <div class="card"> -->
            <img
              src="/images/inquiry_img.png"
              alt=""
              style="height: auto; width: 375px"
            />
            <!-- </div> -->
          </div>
          <div class="p-2 col-sm">
            <div class="card p-4 form-card">
              <h6>Thank you for showing interest in <c:out value="${pet.name}"></c:out>! Please fill out
					the following information, and our staff will respond within 48 hours.</h6>
              <hr />
              <p>I am interested in</p>
              <form:form
                action="/pet/add/inquiry"
                class="mt-2"
                method="POST"
                modelAttribute="newInquiry">
              <!-- ADOPT/FOSTER -->
                <div class="mb-3">

                 
                 
                 <input type="radio" id="inquiryType"  name="inquiryType" value="Adopting" checked="checked">
				<label for="inquiryType">Adopting</label><br>
				<input type="radio" id="inquiryType" name="inquiryType" value="Fostering">
				<label for="inquiryType">Fostering</label><br>                   
                  
                </div>
                <!-- ERROR: INQUIRY TYPE -->
                <form:errors
                  path="inquiryType"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- DATE OF PICKUP -->
                <div class="mb-3">
                  <form:label path="dateOfPickup" class="form-label"
                    >Pickup:</form:label
                  >
                  <form:input
                    type="date"
                    class="form-control"
                    path="dateOfPickup"
                  />
                </div>
                <!-- ERROR: date of pickup -->
                <form:errors
                  path="dateOfPickup"
                  class="py-1 alert alert-danger"
                ></form:errors>

                <!-- DATE OF DROPOFF -->
                <div class="mb-3">
                  <form:label path="dateOfDropoff" class="form-label"
                    >Dropoff:</form:label>
                  <form:input
                    type="date"
                    class="form-control"
                    path="dateOfDropoff"
                  />
                </div>
                <!-- ERROR: date of dropoff -->
                <form:errors
                  path="dateOfDropoff"
                  class="py-1 alert alert-danger"
                ></form:errors>
                
                <!-- NOTES -->
                <div class="mb-3">
                  <form:label path="notes" class="form-label"
                    >Notes</form:label>
                  <form:textarea
                    path="notes"
                    class="form-control"
                    style="height: 100px"
                    placeholder="Questions..."
                  ></form:textarea>
                </div>
                <form:errors
                  path="notes"
                  class="py-1 alert alert-danger"
                ></form:errors>
                <!-- PET ID OF THE PET BEING FOSTERED OR ADOPTED -->
                <input type="hidden" id="pet" name="pet" value="${pet.id}">
                
                <!-- USER ID OF THE USER THAT IS INQUIRING -->
                <input type="hidden" id="inquirer" name="inquirer" value="${loggedUser.id}">

                <!-- DEFAULT THE RESPONDED FLAG TO NO  -->
                <input type="hidden" id="responded" name="responded" value="No">

                <button class="btn">Submit</button>
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
        <div>© 2023 Pet Adoption Center</div>
      </div>
    </div>
  </body>
</html>
