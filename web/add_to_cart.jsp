<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        session.setAttribute("message", "Please log in first to add items to the cart.");
        response.sendRedirect("login.jsp");
    } else {
        String bikeModel = request.getParameter("bike_model");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String quantity = "1";
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        Map<String, String> item = new HashMap<>();
        item.put("bike_model", bikeModel);
        item.put("brand", brand);
        item.put("price", price);
        item.put("quantity", quantity);

        cart.add(item);
        session.setAttribute("cart", cart);
        String dbURL = "jdbc:mysql://localhost:3306/bike_showroom";
        String dbUser = "root";
        String dbPass = "root75";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String query = "INSERT INTO orders (user_id, bike_model, brand, price, quantity) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            pstmt.setString(2, bikeModel);
            pstmt.setString(3, brand);
            pstmt.setString(4,price);
            pstmt.setInt(5, Integer.parseInt(quantity));
            pstmt.executeUpdate();

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
        response.sendRedirect("view_cart.jsp");
    }
%>