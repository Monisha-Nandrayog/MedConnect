<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style type="text/css">
        body {
            background-image: url("img/doctor_3.jpg"); /* Specify the path to your background image */
      background-size: cover;
      background-position: center;
      height:100vh;
        }
        .my-card {
            box-shadow: 0px 0px 10px 1px #54B4D3;
            border: none;
        }
        .card-body {
            padding: 3rem 1.5rem;
        }
        .card-icon {
            font-size: 3rem;
        }
        .card-title {
            font-size: 1.5rem;
            margin-top: 1rem;
        }
        .text-success {
            color: #28a745 !important;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- check if doctor is logged in -->
    <c:if test="${empty doctorObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container py-5">
        <div class="row">
            <%-- Count total number of doctors --%>
            <% DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
            int totalNumberOfDoctor = docDAO.countTotalDoctor();
            Doctor currentLoginDoctor = (Doctor)session.getAttribute("doctorObj"); %>

            <!--  <div class="col-md-6">
                <div class="card my-card">
                    <div class="card-body text-center text-info">
                        <i class="fas fa-user-md card-icon text-info"></i>
                        <h5 class="card-title fw-bold ">Total Doctors</h5>
                        <p class="fs-4 text-center">
                            <%= totalNumberOfDoctor %>
                        </p>
                    </div>
                </div>
            </div>-->

            <%-- Count total appointments of the current login doctor --%>
            <div class="container">
    		<div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card my-card">
                    <div class="card-body text-center text-info ">
                        <i class="far fa-calendar-check card-icon text-info"></i>
                        <a href="patient.jsp" class="card-title fw-bold " style="text-decoration:none;">Total Appointments</a>
                        <p class="fs-4 text-center">
                            <%= docDAO.countTotalAppointmentByDoctorId(currentLoginDoctor.getId()) %>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
