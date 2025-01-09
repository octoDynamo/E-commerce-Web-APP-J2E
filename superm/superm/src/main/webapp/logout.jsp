<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%
  // Invalidate the user session
  if (session != null) {
    session.invalidate(); // Destroy the session to log out the user
  }

  // Clear "Remember Me" cookies if they exist
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if ("userEmail".equals(cookie.getName()) || "userRole".equals(cookie.getName())) {
        cookie.setMaxAge(0); // Delete the cookie
        cookie.setPath("/"); // Apply deletion to the entire application
        response.addCookie(cookie);
      }
    }
  }

  // Redirect to index.jsp after logout
  response.sendRedirect("index.jsp");
%>
