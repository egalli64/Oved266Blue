package writeSubmit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/write")
public class WriteSubmit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        PrintWriter writer = new PrintWriter("./"+fname+"_"+lname+".txt", "UTF-8");
        writer.println("First name: "+fname);
        writer.println("Last name: "+lname);
        writer.println("Email: "+email);
        writer.println("Address: "+address);
        writer.println("Phone number: "+phone);
        writer.println("Message: \n"+message);
        writer.close();  
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}