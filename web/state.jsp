<%-- 
    Document   : state
    Created on : Nov 10, 2014, 10:32:12 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.CountryBean"%>
<%@page import="services.CountryStateCityServices"%>
<%@page import="beans.StateBean"%>
<%@page import="java.util.List"%>
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
            List<StateBean> lstStates =  objCSC.getStatesByCountryId(Integer.parseInt(request.getParameter("countryId")));
            pageContext.setAttribute("LIST_STATES", lstStates);
            System.out.println("sttes:: " + lstStates.size());
        %>
        
        <select id="ddlState" onchange="getCities()">
            <option value="0" selected="selected">Select</option>
            <c:forEach items="${LIST_STATES}" var="obj">
                <option value="${obj.stateId}">${obj.stateName}</option>
            </c:forEach>
        </select>
    </body>
</html>
