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
    <title>WelcomeAdmin</title>
</head>
<body>
<h1>Welcome! Admin!</h1>
<%
    // Подключение к базе данных
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus", "root", "root123");

        // SQL запрос для получения данных
        String sql = "SELECT id_bus, price, numberBus FROM buss";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        // Вывод данных в таблицу
            // Здесь вы можете вывести данные в HTML формате, например, в виде таблицы
            // Например, если вы хотите вывести данные в виде таблицы, вы можете использовать следующий код:
%><table border="3", align="left">
    <tr><td>ID автобуса</td><td>Цена</td><td>Номер автобуса</td></tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getString("id_bus") %></td>
        <td><%= rs.getString("price") %></td>
        <td><%= rs.getString("numberBus") %></td>
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

<%
    // Подключение к базе данных
    Connection conn1 = null;
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root123");

        // SQL запрос для получения данных
        String sql = "SELECT id_user, name, password, email, role FROM user";
        pstmt1 = conn1.prepareStatement(sql);
        rs1 = pstmt1.executeQuery();

        // Вывод данных в таблицу
%><table border="3" align="right">
    <tr><td>ID пользователя</td><td>Имя</td><td>Пароль</td><td>Email</td><td>Роль</td></tr>
    <% while (rs1.next()) { %>
    <tr>
        <td><%= rs1.getString("id_user") %></td>
        <td><%= rs1.getString("name") %></td>
        <td><%= rs1.getString("password") %></td>
        <td><%= rs1.getString("email") %></td>
        <td><%= rs1.getString("role") %></td>
    </tr>
    <% } %>
</table><%

    } catch (ClassNotFoundException | SQLException ex) {
        out.println("<p>При выполнении SQL запроса произошла ошибка: " + ex.getMessage() + "</p>");
    } finally {
        if (rs1 != null) try { rs1.close(); } catch (SQLException ignore) {}
        if (pstmt1 != null) try { pstmt1.close(); } catch (SQLException ignore) {}
        if (conn1 != null) try { conn1.close(); } catch (SQLException ignore) {}
    }
%>
</body>
</html>
