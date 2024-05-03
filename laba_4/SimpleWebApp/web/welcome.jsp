<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 24.10.2017
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome!</h1>
<%
    // Подключение к базе данных
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus", "root", "root123");

        // SQL запрос для получения данных
        String sql = "SELECT id_user, name FROM user";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        // Вывод данных в таблицу

            // Здесь вы можете вывести данные в HTML формате, например, в виде таблицы
            // Например, если вы хотите вывести данные в виде таблицы, вы можете использовать следующий код:
%><table border="3">
    <tr><td>ID пользователя</td><td>Имя</td></tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getString("id_user") %></td>
        <td><%= rs.getString("name") %></td>
    </tr>
    <% } %>
</table><%

    } catch (ClassNotFoundException | SQLException ex) {
        out.println("<p>При выполнении SQL запроса произошла ошибка: " + ex.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>



</body>
</html>
