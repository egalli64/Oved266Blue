package writeSubmit;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckPassword")
public class CheckPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password1 = request.getParameter("password");
        String password2 = request.getParameter("cpassword");
        if(!password1.equals(password2)) {       
        try (PrintWriter respWriter = response.getWriter()) {
        	respWriter.println("<!DOCTYPE html><html>");
        	respWriter.println("<head><meta charset=\"utf-8\">");
        	respWriter.println("<title>Error</title></head>");
        	respWriter.println("<body>");
        	respWriter.println("<h1> Confirm password and entered password are different</h1>");
        	respWriter.println("<a href=\"createAdmin.html\">" + "Back" + "</a>");
        	respWriter.println("</body></html>");}
      }
   }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
