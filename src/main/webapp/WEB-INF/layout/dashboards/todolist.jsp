<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.net.MalformedURLException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.name.Clerk" %>
<%@ page import="your.package.name.User" %>
<%@ page import="your.package.name.Navigate" %>
<%@ page import="your.package.name.TodoProps" %>
<%@ page import="your.package.name.TaskProps" %>

<%
    Clerk clerk = new Clerk();
    User user = clerk.getUser();
    Navigate navigate = new Navigate();
    List<TaskProps> taskList = new ArrayList<>();
    String tokens = null;

    try {
        // Method to get tokens
        tokens = getTokens();
        // Fetch data from API
        taskList = fetchData(tokens, user.getId());
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Method to get tokens
    String getTokens() throws Exception {
        // Your existing getTokens function
    }

    // Method to fetch data from API
    List<TaskProps> fetchData(String tokens, String userId) throws Exception {
        // Your existing fetchData function
    }

    // Method to add task
    void addTask(TodoProps task) throws Exception {
        // Your existing addRequest function
    }

    // Method to remove task
    void removeTask(TaskProps task) throws Exception {
        // Your existing removeRequest function
    }

    // Method to modify status
    void modifyStatus(TaskProps task) throws Exception {
        // Your existing modifyStatusRequest function
    }
%>

<!DOCTYPE html>
<html>
<head>
    <!-- Include your stylesheet and script imports here -->
</head>
<body>
    <div class="h-screen w-screen bg-[#faebd7] text-center">
        <div class="mb-3 bg-[#ffe4c4] p-6 text-3xl font-bold">ToDo List</div>
        <form class="mx-auto my-7 flex max-w-[92vw] flex-row justify-center text-left outline-none md:w-[850px]"
            action="handleSubmit" method="post">
            <input class="mx-1 my-0 box-border rounded-md border-none px-7 py-2 text-left outline-none sm:min-w-[310px]"
                name="title" type="text" placeholder="Enter Title" value="" />
            <input class="mx-1 my-0 box-border rounded-md border-none px-4 py-2 text-left outline-none sm:w-[450px]"
                name="description" type="text" placeholder="Enter Description" value="" />
            <button class=" mx-1 my-0 rounded-md border-none bg-[#49ff58] px-6 py-3" type="submit">Add</button>
        </form>

        <div class="m-auto mt-[55px] flex max-w-[60vw] flex-wrap rounded-md p-[15px] xl:w-[1100px]">
            <% for (TaskProps task : taskList) { %>
                <div key="<%= task.getPostId() %>"
                    class="m-[5px] flex justify-between rounded-lg bg-[#ffe4c4] text-left"
                    style="flex: 1 0 40%;">
                    <div class="ml-6 px-0 py-[15px]">
                        <div class=" mb-2 text-lg font-bold capitalize text-black"
                            style="<%= task.isStatus() ? 'text-decoration: line-through;' : '' %>">
                            <%= task.getTitle() %>
                        </div>
                        <div class="text-black"
                            style="<%= task.isStatus() ? 'text-decoration: line-through;' : '' %>">
                            <%= task.getDescription() %>
                        </div>
                    </div>

                    <div class="box-border flex h-full flex-col justify-around gap-2 px-[10x] py-[15px]"
                        style="border-left: 1px solid #8b8b8b;">
                        <button
                            class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-[#27ce4b] outline-none hover:bg-[#27ce4b] hover:text-white"
                            onclick="handleComplete('<%= task.getPostId() %>')">Complete
                        </button>
                        <button
                            class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-blue-500 outline-none hover:bg-blue-500 hover:text-white"
                            onclick="handleEdit()">Edit
                        </button>
                        <button
                            class="mx-4 my-0 flex cursor-pointer rounded border-none bg-white p-2 align-middle text-red-600 outline-none hover:bg-[#ce2727] hover:text-white"
                            onclick="handleRemove('<%= task.getPostId() %>')">Remove
                        </button>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    <!-- Include your script imports here -->
    <script>
        // Your JavaScript code here
        function handleComplete(postId) {
            // Implement the handleComplete logic using JSP and Java
        }

        function handleEdit() {
            // Implement the handleEdit logic using JSP and Java
        }

        function handleRemove(postId) {
            // Implement the handleRemove logic using JSP and Java
        }
    </script>
</body>
</html>
