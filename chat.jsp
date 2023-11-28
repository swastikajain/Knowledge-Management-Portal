<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%   User user = (User) session.getAttribute("currentUser");%>
    <head>
        <title>KMP KNOWLEDGE NETWORK</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            html,body {
                font-family: Arial, sans-serif;
                margin: 0; /* Reset margin */
                padding: 0; /* Reset padding */
                background: linear-gradient(to right,#FFC988 ,#E288F9,#FFC988,#FFC988  ,#E288F9);

                background-size: cover;
            }



            #header2 {
                background: linear-gradient(to left,#f7b42c,#fc575e);
                color: black;
                text-align: center;
                padding: 30px;
                font-size: 24px;

                border-radius:  25px;
                position: fixed;
                top: 100px;
                left:800px;
            }



            #content1 {
                width: 80%;
                margin: 20px auto;
                margin-top: 200px;
                padding: 10px;
                background: linear-gradient(to right,#f7b42c,#fc575e);
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
                max-height: 400px;
                overflow-y: auto;

            }

            .message {
                margin-bottom: 10px;
                padding: 8px;
                border-radius: 5px;
                background-color: #f0f0f0;
                display: flex;
                align-items: center;
            }


            /* ... other styles ... */

            .timestamp {
                font-size: 12px;
                color: #777;
                margin-left: 10px;
            }

            .content {
                flex: 1;
            }

            #chat-form {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 80%;
                margin: 0 auto;
                padding: 10px;
                background: linear-gradient(to right,#f7b42c,#fc575e);
                border: 1px solid #ddd;
                border-top: none;
                border-radius: 0 0 5px 5px;
                box-shadow: 0px -1px 5px rgba(0, 0, 0, 0.1);
            }


            #message-input {
                flex: 1;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 3px;
            }


            #message-input:focus {
                outline: none;
                border-color: #007bff;
            }

            #chat-form button {
                padding: 8px 15px;
                background-color: #007bff;
                border: none;
                border-radius: 3px;
                color: #ffffff;
                cursor: pointer;
            }

            #chat-form button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <!-- nav bar -->

        <nav id="nav" class="navbar navbar-expand-lg navbar-dark" style="font-size: 25px">
            <a id="home" class="navbar-brand" href="index.jsp" style="font-size: 40px"> <span class="fa fa-asterisk"> </span> &nbsp;Knowledge Management Portal</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a id="back" class="nav-link" href="profile.jsp"> <span class="fa fa-hand-peace-o"></span> Home  <span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item active">
                        <a id="back" class="nav-link" href="webChat.jsp"> <span class="fa fa-arrow-left"></span> Back  </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">


                    <li class="nav-item">
                        <a id="prof" class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a id="out" class="nav-link" href="LogoutServlet"> <span class="fa fa-hand-o-up"></span> Logout</a>
                    </li>
                    <li class="nav-item">
                        <a id="con" class="nav-link" href="contact_us.jsp"> <span class="fa fa-address-book-o"></span> Contact Us</a>
                    </li>

                </ul>
            </div>
        </nav>

        <!-- End of Nav Bar-->

        <div id="header2">
            KMP KNOWLEDGE NETWORK
        </div>
        <div id="logo"></div>

        <div id="content1">
            <!-- Messages will be displayed here -->
        </div>

        <form id="chat-form">
            <input type="text" id="message-input" placeholder="Type your message..." />
            <button type="submit">Send</button>
        </form>
        <script>
            const socket = new WebSocket('ws://localhost:1780');

            socket.onmessage = (event) => {
                const content1 = document.getElementById('content1');
                const messages = JSON.parse(event.data);

                messages.forEach((messageData) => {
                    const messageDiv = document.createElement('div');
                    messageDiv.className = 'message';

                    const nameSpan = document.createElement('span');
                    nameSpan.className = 'name';
                    nameSpan.textContent = messageData.name + ': ';

                    const contentSpan = document.createElement('span');
                    contentSpan.className = 'content';
                    contentSpan.textContent = messageData.content;

                    const timestampSpan = document.createElement('span');
                    timestampSpan.className = 'timestamp';
                    timestampSpan.textContent = formatTimestamp(messageData.timestamp);

                    messageDiv.appendChild(nameSpan);
                    messageDiv.appendChild(contentSpan);
                    messageDiv.appendChild(timestampSpan);

                    content1.appendChild(messageDiv);
                    content1.scrollTop = content1.scrollHeight;
                });
            };

            function formatTimestamp(timestampString) {
                const timestamp = new Date(timestampString); // Parse the timestamp string into a Date object
                return `${timestamp.toLocaleDateString()} ${timestamp.toLocaleTimeString()}`;
                    }


                    const chatForm = document.getElementById('chat-form');
                    const messageInput = document.getElementById('message-input');

                    chatForm.addEventListener('submit', (event) => {
                        event.preventDefault();
                        const message = messageInput.value.trim();

                        if (message !== '') {
                            const messageData = {
                                name: '<%= user.getName()%>', // Retrieve username from session
                                content: message
                            };

                            socket.send(JSON.stringify(messageData));

                            messageInput.value = '';
                            location.reload();
                        }
                    });
        </script>
    </body>
</html>
