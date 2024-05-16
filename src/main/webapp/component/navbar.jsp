<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #2d6a4f;  ">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-hospital"></i> MedConnect
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="color:white;">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="admin_login.jsp">
                            <i class="fas fa-user-shield"></i> ADMIN
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="doctor_login.jsp">
                            <i class="fas fa-user-md"></i> DOCTOR
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="user_appointment.jsp">
                            <i class="fas fa-book"></i> APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="user_login.jsp">
                            <i class="fas fa-sign-in-alt"></i> USER
                        </a>
                    </li>
                </c:if>
                <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="user_appointment.jsp">
                            <i class="fas fa-book"></i> APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="view_appointment.jsp">
                            <i class="fas fa-calendar-check"></i> VIEW APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-circle"></i> ${userObj.fullName}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
