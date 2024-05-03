import model.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "/Register", urlPatterns = "/Register")
    public class Register extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String name = request.getParameter("name");
            String password = request.getParameter("pass");
            String email = request.getParameter("mail");


            UserEntity user = new UserEntity();
            user.setName(name);
            user.setPassword(password);
            user.setEmail(email);

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            try {
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root123");

                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO user (id_user, name, password, email) VALUES(null, ?, ?, ?);");
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, email);

                int result = preparedStatement.executeUpdate();
                if(result>0){
                    response.sendRedirect("welcome.jsp");
                }
            }  catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }
    }

