<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart != null && index >= 0 && index < cart.size()) {
        Map<String, String> item = cart.get(index);
        item.put("quantity", String.valueOf(quantity));
        session.setAttribute("cart", cart);
    }

    response.sendRedirect("view_cart.jsp");
%>