<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Cart</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 3px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .btn {
            background-color: #007bff;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .total-amount {
            margin-top: 20px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            color: #ffd369;
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
         /* Mobile View */
        @media screen and (max-width: 768px) {
 .container {
        width: 100%;
        margin: 20px auto;
        padding: 15px;
        background: rgba(255, 255, 255, 0.07);
        border-radius: 15px;
        backdrop-filter: blur(12px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }

    table {
        width: 100%;
        font-size: 14px;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
    }

    th {
        text-align: left;
    }

    .total-amount {
        font-size: 16px;
        text-align: center;
        margin-top: 10px;
    }

    .btn {
        width: 100%;
        font-size: 18px;
    }

    footer {
        font-size: 12px;
        padding: 10px 0;
    }
}

        /* Tablet View */
        @media screen and (max-width: 1024px) {
            nav {
                gap: 20px;
            }

            .container {
                margin: 50px auto;
            }

            table, th, td {
                font-size: 16px;
            }
        }

    </style>
    </style>
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="about.jsp">About</a>
    <a href="bikes.jsp">Bikes</a>
    <a href="login.jsp">Login</a>
    <a href="view_cart.jsp">Cart</a>
</nav>

<div class="container">
    <h1>Shopping Cart</h1>
    <table>
        <tr>
            <th>Bike Model</th>
            <th>Brand</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Total (₹)</th>
            <th>Actions</th>
        </tr>
        <%
            List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                for (int i = 0; i < cart.size(); i++) {
                    Map<String, String> item = cart.get(i);
                    String priceStr = item.get("price");
                    String quantityStr = item.get("quantity");
                    int price = 0;
                    int quantity = 0;
                    if (priceStr != null && !priceStr.isEmpty()) {
                        price = Integer.parseInt(priceStr);
                    }
                    if (quantityStr != null && !quantityStr.isEmpty()) {
                        quantity = Integer.parseInt(quantityStr);
                    }
        %>
        <tr>
            <td><%= item.get("bike_model") %></td>
            <td><%= item.get("brand") %></td>
            <td><%= price %></td>
            <td>
                <form action="update_cart.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="index" value="<%= i %>">
                    <input type="number" name="quantity" value="<%= quantity %>" min="1">
                    <input type="submit" value="Update">
                </form>
            </td>
            <td><%= price * quantity %></td>
            <td>
                <form action="delete_from_cart.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="index" value="<%= i %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">Your cart is empty.</td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="checkout.jsp" class="btn">Proceed to Checkout</a>
</div>


</body>
</html>