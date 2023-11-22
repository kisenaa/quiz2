<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.jsp.JspException" %>
<%@ page import="javax.servlet.jsp.tagext.TagSupport" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page import="your.package.name.Clerk" %>
<%@ page import="your.package.name.User" %>
<%@ page import="your.package.name.Navigate" %>

<%
  Clerk clerk = new Clerk();
  User user = clerk.getUser();
  Navigate navigate = new Navigate();
%>

<div>
  <c:choose>
    <c:when test="${currentPage eq 'Dashboard'}">
      <%-- Set the appropriate variables for Dashboard --%>
    </c:when>
    <c:otherwise>
      <%-- Set the appropriate variables for Weather --%>
    </c:otherwise>
  </c:choose>

  <hr class="my-3" />

  <button onclick="<%= clerk.getOpenUserProfileFunction() %>">
    <div>
      <%-- Render the Edit Profile button content --%>
    </div>
  </button>

  <hr class="my-2" />

  <button onclick="<%= clerk.setCurrentPageFunction('Dashboard') %>">
    <div>
      <%-- Render the Dashboard button content --%>
    </div>
  </button>

  <hr class="my-2" />

  <button onclick="<%= clerk.setCurrentPageFunction('Weather') %>">
    <div>
      <%-- Render the Weather button content --%>
    </div>
  </button>

  <hr class="my-2" />

  <button onclick="<%= clerk.signOutFunction(navigate.getLogoutPath()) %>">
    <div>
      <%-- Render the Logout button content --%>
    </div>
  </button>
</div>
