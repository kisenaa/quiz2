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
    <c:if test="${sessionScope.weather}">
      <c:set var="weathers" value="Todolist" scope="session" />
    </c:if>
    <!-- Changing State of Navbar  -->
  <script>
    async function setState(state) {
        if (state === "Weather") {
          await fetch('http://localhost:8080/getWeather', { method: 'POST' });
        }
        urlLink = 'http://localhost:8080/setState?value=' + state
        await fetch (urlLink, { method: 'POST' });
        window.location.reload();
    }
  </script>
  <script>
    async function removeTodo(id) {
        urlLink = 'http://localhost:8080/deleteTodo?ids=' + parseInt(id)
        await fetch(urlLink, { method: 'POST' });
        window.location.reload();
    }
  </script>
  <script>
    async function setTodo(id) {
        urlLink = 'http://localhost:8080/setFinished?ids=' + parseInt(id)
        await fetch(urlLink, { method: 'POST' });
        window.location.reload();
    }
  </script>
</head>

<body class="h-full w-full bg-[#faebd7]">
  <nav class="bg-gray-800">
    <div class="lg:px-[4%] sm:pl-2 max-w-9xl justify-between mr-0">
      <div class="relative flex h-[4.3rem] items-center justify-between">
        <!-- Content Navbar -->
        <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">

          <div class="flex flex-shrink-0 items-center">
            <img class="h-8 w-auto" src="../../../public/svgviewer-png-output.png" alt="Your Company">
          </div>

          <div class="hidden sm:ml-6 sm:block">
            <div class="flex space-x-4 gap-0">
              <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
              <button onclick="setState('Todolist')"  class="<%= "Todolist".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-3 text-lg font-medium">
                Todolist
              </button>              
              <button onclick="setState('Weather')" class="<%= "Weather".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-3 text-lg font-medium">
                Weather
              </button>   
              <button onclick="setState('Calendar')" class="<%= "Calendar".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-3 text-lg font-medium">
                Calendar
              </button>   
              <button onclick="setState('Profile')" class="<%= "Profile".equals(session.getAttribute("currentState")) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white" %> 
                rounded-md px-3 py-3 text-lg font-medium">
              Profile
              </button>   
            </div> 
          </div>
          
        </div>
        <!-- Profile and notification navbar (left part) -->
        <div class=" flex items-center gap-1">
          <button type="button" class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
            <span class="absolute -inset-1.5"></span>
            <span class="sr-only">View notifications</span>
            <svg class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
            </svg>
          </button>
  
          <div class="relative ml-3">
            <div>
              <button type="button" class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                <span class="absolute -inset-1.5"></span>
                <span class="sr-only">Open user menu</span>
                <img class="h-10 w-10 rounded-full" src="https://avatars.githubusercontent.com/u/41265413?v=4" alt="">
              </button>
            </div>
          </div>
          <a href="/">
          <button class="ml-4 bg-red-500 hover:brightness-90 text-white p-2 rounded-md font-medium" onclick="window.k">Sign Out</button>
          </a>
        </div>
      </div>
  </nav>       

  <c:if test="${sessionScope.currentState == 'Todolist'}">
    <div>
      <div class="bg-[#ffe4c4] mb-3 p-6 text-3xl font-bold text-center">ToDo List</div>
      <form
      class="mx-auto my-7 flex max-w-[92vw] flex-row justify-center text-left outline-none md:w-[850px]"
      action="/addTodo"
      method="get"
      >
      <input
      class="mx-1 my-0 box-border rounded-md border-none px-5 py-2 text-left outline-none sm:w-[360px]"
        name="title"
        type="text"
        placeholder="Enter Title"
      />
      <input
      class="mx-1 my-0 box-border rounded-md border-none px-4 py-2 text-left outline-none sm:w-[450px]"
        name="description"
        type="text"
        placeholder="Enter Description"
      />
      <button
        class=" mx-1 my-0 rounded-md border-none bg-[#49ff58] px-6 py-3"
        type="submit">
        Add
      </button>
      </form>

      <div class="m-auto mt-[55px] flex max-w-[68vw] flex-wrap rounded-md p-[15px]">
        <c:forEach var="todo" items="${sessionScope.TodoLists}" varStatus="ids">
          <div class="m-[5px] flex justify-between rounded-lg bg-[#ffe4c4] text-left" style="flex: 1 0 40%" >
            <div class="ml-6 px-0 py-[15px]">
              <div class="${todo.finished ? 'line-through' : ''} mb-2 text-lg font-bold capitalize text-black" 
              >
                ${todo.title}
              </div>

              <div class="${todo.finished ? 'line-through' : ''} text-black">
                ${todo.description}
              </div>
            </div>  

            <div
              class="box-border flex h-full flex-col justify-around gap-2 px-[10x] py-[15px]"
              style="border-left: 1px solid #8b8b8b;">
              <button 
                onclick="setTodo(`${ids.index}`)"
                class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-[#27ce4b] outline-none hover:bg-[#27ce4b] hover:text-white" >
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path fill="none" d="M0 0h24v24H0z"></path><path d="M18 7l-1.41-1.41-6.34 6.34 1.41 1.41L18 7zm4.24-1.41L11.66 16.17 7.48 12l-1.41 1.41L11.66 19l12-12-1.42-1.41zM.41 13.41L6 19l1.41-1.41L1.83 12 .41 13.41z"></path></svg>             
              </button>
              <button
                class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-blue-500 outline-none hover:bg-blue-500 hover:text-white" >
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path d="m16 2.012 3 3L16.713 7.3l-3-3zM4 14v3h3l8.299-8.287-3-3zm0 6h16v2H4z"></path></svg>              
              </button>
              <button
                class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-red-600 outline-none hover:bg-[#ce2727] hover:text-white"
                onclick="removeTodo(`${ids.index}`)">
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="18" width="18" xmlns="http://www.w3.org/2000/svg"><path fill="none" d="M0 0h24v24H0z"></path><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"></path></svg>            
              </button>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </c:if>
  <!-- Content -->


  <c:if test="${sessionScope.currentState == 'Weather'}">
    <div>
      <div class="bg-[#ffe4c4] mb-3 p-6 text-3xl font-bold text-center">Weather Information</div>
        <div class="mt-14 flex h-fit flex-col items-center">
          <div>
            <div class="text-center text-xl font-bold">
              <div class="flex flex-row items-center justify-center gap-2 pb-8">
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 384 512" class="text-red-500" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                  <path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"></path>
                </svg>Surabaya, Indonesia
              </div>
            </div>
            <div class="flex h-full gap-8">
              <div class="flex flex-col justify-center gap-0 text-center">
                <div class="flex justify-center">
                  <svg stroke="currentColor" fill="currentColor" stroke-width="0" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 30 30" class="h-16 w-16 text-gray-500" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4.65,15.5c0-0.22,0.08-0.41,0.23-0.56c0.16-0.15,0.35-0.22,0.57-0.22h12.08c0.22,0,0.4,0.07,0.54,0.22 c0.14,0.15,0.22,0.34,0.22,0.57c0,0.22-0.07,0.4-0.22,0.54c-0.14,0.14-0.32,0.22-0.54,0.22H5.45c-0.22,0-0.42-0.07-0.57-0.22 C4.72,15.9,4.65,15.72,4.65,15.5z M7.06,12.6c0-0.22,0.08-0.4,0.23-0.55c0.15-0.15,0.34-0.23,0.56-0.23h12.09 c0.21,0,0.39,0.08,0.54,0.23c0.15,0.15,0.22,0.33,0.22,0.55c0,0.22-0.07,0.4-0.22,0.56c-0.15,0.15-0.33,0.23-0.54,0.23H7.86 c-0.22,0-0.41-0.08-0.56-0.23S7.06,12.82,7.06,12.6z M8.68,18.34c0-0.21,0.08-0.39,0.24-0.54c0.14-0.14,0.32-0.22,0.54-0.22h12.1 c0.22,0,0.41,0.07,0.56,0.22c0.15,0.14,0.22,0.32,0.22,0.54s-0.08,0.41-0.23,0.56s-0.34,0.23-0.56,0.23H9.46 c-0.22,0-0.4-0.08-0.56-0.23S8.68,18.56,8.68,18.34z M19.26,15.5c0-0.23,0.07-0.42,0.22-0.57c0.15-0.15,0.34-0.22,0.57-0.22h4.52 c0.23,0,0.42,0.07,0.57,0.22c0.15,0.15,0.22,0.34,0.22,0.56c0,0.22-0.07,0.4-0.22,0.54c-0.15,0.14-0.34,0.22-0.56,0.22h-4.52 c-0.23,0-0.42-0.07-0.57-0.22C19.33,15.9,19.26,15.72,19.26,15.5z"></path>
                  </svg>
                </div>
                <p class="pt-2 font-bold">Haze</p>
              </div>
              <div class="flex h-full flex-col items-center justify-center gap-0 text-center">
                <p class="mb-1 text-gray-600">Temp</p>
                <h3 class="text-5xl tracking-tight">28°C</h3>
                <span class="mt-2 rounded-full px-5 py-1 text-center font-bold" style="color: white; font-size: 15px; background-color: rgb(255, 165, 0);">Warm</span>
              </div>
              <div class="flex h-full flex-col justify-center gap-2 text-center">
                <div class="mb-2 flex flex-col justify-center gap-0 text-center">
                  <p class="text-gray-600">Wind Speed</p>
                  <p class="font-bold">1.54m/s</p>
                </div>
                <div class="flex flex-col justify-center gap-0 text-center">
                  <p class="text-gray-600">Humidity</p>
                  <p class="font-bold">83%</p>
                </div>
              </div>
              <div class="flex h-full flex-col justify-center gap-2 text-center">
                <div class="mb-2 flex flex-col justify-center gap-0 text-center">
                  <p class="text-gray-600">Wind Direction</p>
                  <p class="font-bold">West</p>
                </div>
                <div class="flex flex-col justify-center gap-0 text-center">
                  <p class="text-gray-600">Visibility</p>
                  <p class="font-bold">5km</p>
                </div>
              </div>
            </div>
          </div>
        </div>
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
