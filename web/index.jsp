<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bike Showroom</title>
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
            color: #ffffff;
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
            max-width: 1100px;
            margin: 60px auto;
            padding: 30px 20px;
            background: rgba(255, 255, 255, 0.07);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            animation: fadeInUp 1s ease-out;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #ffd369;
            text-align: center;
        }

        p {
            font-size: 18px;
            line-height: 1.7;
            color: #f0f0f0;
            text-align: justify;
            margin-bottom: 35px;
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1.5s ease-out;
        }

        .image-container img {
            width: 100%;
            max-width: 800px;
            border-radius: 15px;
            transition: transform 0.4s ease, box-shadow 0.3s ease;
            box-shadow: 0 8px 24px rgba(0,0,0,0.5);
        }

        .image-container img:hover {
            transform: scale(1.03);
            box-shadow: 0 12px 32px rgba(0, 0, 0, 0.6);
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
    <h1>Welcome to Vighnharta Showroom</h1>
    <div class="image-container">
        <img src="https://i.postimg.cc/G3VPVk76/istockphoto-171255550-612x612.jpg" alt="Bike Showroom">
    </div>
</div>
</body>
</html>
