<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
           
            overflow-x: hidden;
        }

        header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 25px 0;
            text-align: center;
            font-size: 36px;
            font-weight: 600;
            letter-spacing: 1px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            animation: slideDown 1.2s ease-out;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        nav {
            background: rgba(255, 255, 255, 0.05);
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            animation: fadeIn 1.5s ease-out;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            letter-spacing: 1px;
            padding: 10px 15px;
            transition: all 0.3s ease-in-out;
            position: relative;
        }

        nav a::after {
            content: "";
            position: absolute;
            width: 0%;
            height: 2px;
            left: 0;
            bottom: 0;
            background: #ffffff;
            transition: 0.3s ease;
        }

        nav a:hover::after {
            width: 100%;
        }

        nav a:hover {
            color: #ffd369;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 60px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.07);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            animation: fadeInUp 1.6s ease-out;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #ffd369;
            text-align: center;
        }

        p {
            font-size: 18px;
            line-height: 1.8;
            color: #f0f0f0;
            text-align: justify;
            margin-bottom: 20px;
        }
form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-size: 18px;
            color: #ffd369;
        }

        input[type="number"] {
            padding: 10px;
            font-size: 16px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #ffd369;
            background: rgba(255, 255, 255, 0.15);
        }

        input[type="submit"] {
            padding: 10px 15px;
            font-size: 18px;
            color: #1f1c2c;
            background: #ffd369;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background: #f0a500;
            color: #fff;
        }
        footer {
            background: rgba(255, 255, 255, 0.05);
            color: #ddd;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
            border-top: 1px solid rgba(255,255,255,0.1);
            animation: fadeInUp 2s ease-out;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="about.jsp">About</a>
    <a href="bikes.jsp">Cars</a>
    <a href="login.jsp">Login</a>
    <a href="view_cart.jsp">Cart</a>
</nav>

<div class="container">
    <h1>Give Feedback</h1>
    <form action="process_feedback.jsp" method="post">
        <label for="rating">Rating (1-5):</label>
        <input type="number" id="rating" name="rating" min="1" max="5" required>
        <input type="submit" value="Submit Feedback">
    </form>
</div>

</body>
</html>