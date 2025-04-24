<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - </title>
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
    <h2>Login</h2>

    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
            out.println("<p>" + message + "</p>");
            session.removeAttribute("message");
        }
    %>

    <form method="post">
        <input type="email" name="email">
        <input type="password" name="password">
        <button type="submit">Login</button>
    </form>

    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</div>

<%
    String dbURL = "jdbc:mysql://localhost:3306/bike_showroom";
    String dbUser = "root";
    String dbPass = "root75"; 

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("userId", rs.getInt("id"));
                response.sendRedirect("index.jsp");
            } else {
                out.println("<p style='color: red;'>Invalid email or password.</p>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
%>

</body>

</html>
