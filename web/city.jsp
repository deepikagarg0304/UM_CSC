<%-- 
    Document   : city
    Created on : Nov 10, 2014, 11:41:13 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="services.CountryStateCityServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            CountryStateCityServices objCSC = new CountryStateCityServices();
            List<CityBean> lstCity =  objCSC.getCitiesByStateId(Integer.parseInt(request.getParameter("stateId")));
            pageContext.setAttribute("LIST_CITY", lstCity);
            System.out.println("city:: " + lstCity.size());
        %>
        <select id="ddlCity">
            <option value="0" selected="selected">Select</option>
            <c:forEach items="${LIST_CITY}" var="obj">
                <option value="${obj.cityId}">${obj.cityName}</option>
            </c:forEach>
        </select>
    </body>
</html>
