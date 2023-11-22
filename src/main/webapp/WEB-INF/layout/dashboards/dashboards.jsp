<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="EN">
<head>
    <title>Quiz 2</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Initial State of Navbar  -->
    <c:if test="${empty sessionScope.currentState}">
      <c:set var="currentState" value="Todolist" scope="session" />
  </c:if>
    <!-- Changing State of Navbar  -->
  <script>
    async function setState(state) {
        urlLink = 'http://localhost:8080/setState?value=' + state
        fetch(urlLink, { method: 'POST' });
        window.location.reload();
    }
  </script>
</head>

<body>
  <nav class="bg-gray-800">
    <div class="lg:px-[4%] sm:pl-2 max-w-9xl justify-between mr-0">
      <div class="relative flex h-16 items-center justify-between">
        <!-- Content Navbar -->
        <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">

          <div class="flex flex-shrink-0 items-center">
            <img class="h-8 w-auto" src="../../../public/svgviewer-png-output.png" alt="Your Company">
          </div>

          <div class="hidden sm:ml-6 sm:block">
            <div class="flex space-x-4">
              <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
              <button onclick="setState('Todolist')"  class="<%= "Todolist".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-2 text-md font-medium">
                Todolist
              </button>              
              <button onclick="setState('Weather')" class="<%= "Weather".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-2 text-md font-medium">
                Weather
              </button>   
              <button onclick="setState('Calendar')" class="<%= "Calendar".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-2 text-md font-medium">
                Calendar
              </button>   
              <button onclick="setState('Profile')" class="<%= "Profile".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-2 text-md font-medium">
              Profile
              </button>   
            </div> 
          </div>
          
        </div>
        <!-- Profile and notification navbar (left part) -->
        <div class=" flex items-center">
          <button type="button" class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
            <span class="absolute -inset-1.5"></span>
            <span class="sr-only">View notifications</span>
            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
            </svg>
          </button>
  
          <div class="relative ml-3">
            <div>
              <button type="button" class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                <span class="absolute -inset-1.5"></span>
                <span class="sr-only">Open user menu</span>
                <img class="h-8 w-8 rounded-full" src="https://avatars.githubusercontent.com/u/41265413?v=4" alt="">
              </button>
            </div>
          </div>
        </div>
      </div>
  </nav>       

  <!-- Content -->
  <c:if test="${sessionScope.currentState == 'Todolist'}">
    <div class="mt-3">
      <div class="font-bold text-xl text-center items-center content-center">
        Todolist page here
      </div>
    </div>
  </c:if>


  <c:if test="${sessionScope.currentState == 'Weather'}">
    <div class="mt-3">
      <div class="font-bold text-xl text-center items-center content-center">
        Weather page here
      </div>
    </div>
  </c:if>

  <c:if test="${sessionScope.currentState == 'Calendar'}">
    <div class="mt-3">
      <div class="font-bold text-xl text-center items-center content-center">
        Calendar page here
      </div>
    </div>
  </c:if>

  <c:if test="${sessionScope.currentState == 'Profile'}">
    <div class="mt-3">
      <div class="font-bold text-xl text-center items-center content-center">
        Profile page here
      </div>
    </div>
  </c:if>

</body>
</html>
