<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
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
input {
    width: 100%;
    padding: 10px;
    margin: 12px 0;
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid #ddd;
    border-radius: 8px;
    color: #fff;
    font-size: 16px;
    transition: all 0.3s ease;
}

input:focus {
    outline: none;
    border: 1px solid #ffd369;
    background: rgba(255, 255, 255, 0.3);
}

button {
    width: 100%;
    padding: 10px;
    background-color: #ffd369;
    border: none;
    border-radius: 8px;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    transition: all 0.3s ease;
}

button:hover {
    background-color: #f9b232;
}

p {
    text-align: center;
    margin-top: 15px;
}

a {
    color: #ffd369;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
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

/* Mobile Responsiveness */
@media (max-width: 480px) {
    .container {
        width: 90%;
        padding: 15px;
    }
    h2 {
        font-size: 20px;
    }
    input, button {
        font-size: 14px;
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
    <h1>Checkout</h1>
    <form action="process_booking.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone Number:</label>
        <input type="number" id="phone" name="phone" required>

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" required></textarea>

        <input type="submit" value="Book Now">
    </form>
</div>

</body>
</html>