package com.example.webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/hello")  // <-- Add this annotation
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        if (name == null || name.isEmpty()) {
            name = "Guest";
        }
        
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Hello Servlet</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); margin: 0; padding: 50px; }");
        out.println(".container { background: white; padding: 40px; border-radius: 10px; max-width: 600px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,0.3); }");
        out.println("h1 { color: #667eea; }");
        out.println("p { font-size: 18px; color: #333; }");
        out.println(".info { background: #f0f0f0; padding: 15px; border-radius: 5px; margin-top: 20px; }");
        out.println("a { color: #667eea; text-decoration: none; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>Hello, " + name + "!</h1>");
        out.println("<p>Welcome to My Java Web Application</p>");
        out.println("<div class='info'>");
        out.println("<p><strong>Current Time:</strong> " + formattedDateTime + "</p>");
        out.println("<p><strong>Version:</strong> 1.0-SNAPSHOT</p>");
        out.println("<p><strong>Environment:</strong> Development</p>");
        out.println("</div>");
        out.println("<p><a href='index.jsp'>← Back to Home</a></p>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
        out.println("Ending the code");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}