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
            <title>Home</title>
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
            <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@200;300;400;500;800&display=swap"
              rel="stylesheet" />
            <!--  -->
            <!-- BOOTSTRAP ICONS -->
            <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
          </head>

          <body>
            <!-- NAV BAR -->
            <div class="top-half p-3">
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
        </div>
        
        
<!-- Event Cards -->
	<div class="d-flex row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
		<c:forEach var="event" items="${events}">
			<div class="col">
				<div class="card h-100" style="width: 18rem;">
	  				<div class="card-body">
	  					<h5 class="card-title mx-2"><a href="/events/${event.id}"><c:out value="${event.eventName}"/></a></h5>
	  				</div>
	  				<div>
	    				<p class="card-text"><c:out value="${event.date}"/></p>
	    				<p class="card-text"><c:out value="${event.location}"/></p>
	  				</div>
				</div>
			</div>
		</c:forEach>
	</div>

                      <c:forEach var="event" items="${allEvents}">
                          <tr>
                              <th scope="row">
                                  <a href="/event/${event.id}">
                                      <c:out value="${event.eventName}"></c:out>
                                  </a>
                              </th>
                              <td>
                                  <c:out value="${event.date}"></c:out>
                              </td>
                              <td>
                                  <c:out value="${event.location}"></c:out>
                              </td> 
                                <td>
                                  <c:out value="${event.eventDetails}"></c:out>
                              </td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
              <p>
                  <a class="btn btn-primary" href="/event/new">Add a Show </a>
              </p>
          </div>
          </body>

          </html>