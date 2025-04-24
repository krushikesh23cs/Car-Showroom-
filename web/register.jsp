<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
    <h2>Register</h2>
    <form method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>

<%
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/bike_showroom";
    String dbUser = "root";
    String dbPass = "root75";

    Connection conn = null;
    PreparedStatement pstmt = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Check if the email is already registered
            String checkUser = "SELECT * FROM users WHERE email = ?";
            pstmt = conn.prepareStatement(checkUser);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<p style='color:red;'>Email already registered!</p>");
            } else {
                // Insert the new user into the database
                String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                int rows = pstmt.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("<p style='color:red;'>Registration failed! Please try again.</p>");
                }
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Database error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources safely
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
            }
        }
    }
%>

</body>
</html>