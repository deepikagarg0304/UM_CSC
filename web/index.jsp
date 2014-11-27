<%-- 
    Document   : index
    Created on : Nov 8, 2014, 11:59:24 AM
    Author     : DELL
--%>

<%@page import="services.CountryStateCityServices"%>
<%@page import="java.util.List"%>
<%@page import="beans.CountryBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            CountryStateCityServices objCSC = new CountryStateCityServices();
            List<CountryBean> lstCountry = objCSC.getAllCountries();
            pageContext.setAttribute("LIST_COUNTRIES", lstCountry);
        %>
        <script type="text/javascript">
            var xmlObject;
            function getObject() {
                try {
                    xmlObject = new XMLHttpRequest();
                }
                catch (err1) {
                    try {
                        xmlObject = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (err2) {
                        xmlObject = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                }
                return xmlObject;
            }

            function getStates() {
                getObject();
                var url = "state.jsp?countryId=" + document.getElementById("ddlCountry").value;
                xmlObject.onreadystatechange = function()
                {
                    if (xmlObject.readyState == 4) {
                        document.getElementById("divState").innerHTML = xmlObject.responseText;
                    }
                };
                xmlObject.open("GET", url, true);
                xmlObject.send(null);
            }

            function getCities() {
                getObject();
                var url = "city.jsp?stateId=" + document.getElementById("ddlState").value;
                xmlObject.onreadystatechange = function()
                {
                    if (xmlObject.readyState == 4) {
                        document.getElementById("divCity").innerHTML = xmlObject.responseText;
                    }
                };
                xmlObject.open("GET", url, true);
                xmlObject.send(null);
            }
        </script>
    </head>
    <body>
        <select id="ddlCountry" onchange="getStates()">
            <option value="0" selected="selected">Select</option>
            <c:forEach items="${LIST_COUNTRIES}" var="obj">
                <option value="${obj.countryId}">${obj.countryName}</option>
            </c:forEach>
        </select>
        <div id="divState">
            <select id="ddlState">
                <option value="0" selected="selected">Select</option>
            </select>
        </div>
        <div id="divCity">
            <select>
                <option value="0" selected="selected">Select</option>
            </select>
        </div>
    </body>
</html>
