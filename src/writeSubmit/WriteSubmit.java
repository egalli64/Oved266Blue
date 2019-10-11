package writeSubmit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
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
        FileWriter fw = new FileWriter("/"+fname+"-"+lname+".txt");
        BufferedWriter bw = new BufferedWriter(fw);             
        bw.write("First name: "+fname+"\n");
        bw.write("Last name: "+lname+"\n");
        bw.write("Email: "+email+"\n");
        bw.write("Address: "+address+"\n");
        bw.write("Phone number: "+phone+"\n");
        bw.write("Message: \n"+message);
        bw.close();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter respWriter = response.getWriter()) {// stiamo scrivendo sulla response
        	respWriter.println("<!DOCTYPE html><html>");
        	respWriter.println("<head><meta charset=\"utf-8\">");
        	respWriter.println("<title>Tranks you</title></head>");
        	respWriter.println("<body>");
        	respWriter.println("<h1> Thanks for your submit</h1>");
        	//respWriter.println("<a href=\"..\">" + "back home" + "</a>");
        	respWriter.println("</body></html>");}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}