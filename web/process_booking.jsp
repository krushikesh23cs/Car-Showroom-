<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Confirmation</title>
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
    <h1>Booking Confirmation</h1>
    <div class="message">
        <%
            String dbURL = "jdbc:mysql://localhost:3306/bike_showroom";
            String dbUser = "root";
            String dbPass = "root75";

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                Integer userId = (Integer) session.getAttribute("userId");
                String userBookingQuery = "INSERT INTO user_bookings (user_id, name, email, phone, address) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(userBookingQuery);
                pstmt.setInt(1, userId);
                pstmt.setString(2, name);
                pstmt.setString(3, email);
                pstmt.setString(4, phone);
                pstmt.setString(5, address);
                pstmt.executeUpdate();
                pstmt.close();

                List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    for (Map<String, String> item : cart) {
                        String bikeModel = item.get("bike_model");
                        String brand = item.get("brand");
                        String price = item.get("price");
                        String quantity = item.get("quantity");

                        String query = "INSERT INTO orders (user_id, bike_model, brand, price, quantity) VALUES (?, ?, ?, ?, ?)";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, userId);
                        pstmt.setString(2, bikeModel);
                        pstmt.setString(3, brand);
                        pstmt.setString(4, price);
                        pstmt.setInt(5, Integer.parseInt(quantity));
                        pstmt.executeUpdate();
                    }
                    session.removeAttribute("cart");

                    out.println("<p>Your booking has been confirmed. Thank you for shopping with us!</p>");
                    out.println("<p><a href='feedback.jsp' class='btn'>Give Feedback</a></p>");
                } else {
                    out.println("<p>Your cart is empty. Please add items to your cart before proceeding to checkout.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p class='text-red-500 text-center mt-4'>Database error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </div>
</div>

</body>
</html>