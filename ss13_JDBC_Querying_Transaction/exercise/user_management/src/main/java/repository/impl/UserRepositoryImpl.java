package repository.impl;

import model.User;
import repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Minhtam753@";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
//    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SORT_BY_NAME = "select * from users order by name";
    private static final String  SELECT_ALL_USERS_SP= "call display_user_list()";
    private static final String  UPDATE_USERS_BY_ID= "call update_user_list(?,?,?,?)";
    private static final String  DELETE_USERS_BY_ID= "call delete_user_by_id(?)";





    public UserRepositoryImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public void addUserTransaction(User user,int[] permisions) throws SQLException {

            Connection conn = null;
            PreparedStatement pstmt = null;
            PreparedStatement pstmtAssignment = null;
            ResultSet rs = null;
            try {
                conn = getConnection();
                conn.setAutoCommit(false);
                pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getEmail());
                pstmt.setString(3, user.getCountry());
                int rowAffected = pstmt.executeUpdate();

                rs = pstmt.getGeneratedKeys();
                int userId = 0;
                if (rs.next())
                    userId = rs.getInt(1);

                if (rowAffected == 1) {
                    String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "
                            + "VALUES(?,?)";
                    pstmtAssignment = conn.prepareStatement(sqlPivot);
                    for (int permisionId : permisions) {
                        pstmtAssignment.setInt(1, userId);
                        pstmtAssignment.setInt(2, permisionId);
                        pstmtAssignment.executeUpdate();
                    }
                    conn.commit();
                } else {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                try {
                    if (conn != null)
                        conn.rollback();
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
                System.out.println(ex.getMessage());
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (pstmtAssignment != null) pstmtAssignment.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            }
        }


    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);)
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USERS_SP); ){
            System.out.println(callableStatement);

            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement0 = connection.prepareStatement("SET foreign_key_checks = 0;");
             CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_BY_ID);
             PreparedStatement statement1 = connection.prepareStatement("SET foreign_key_checks = 1;");
             ) {
            callableStatement.setInt(1, id);
            statement0.executeUpdate();
            rowDeleted = callableStatement.executeUpdate() > 0;
            statement1.executeUpdate();
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
//             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
             CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_BY_ID)
             ) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, user.getId());

            rowUpdated = callableStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public List<User> searchByCountry (String countrySearch){
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);) {
            preparedStatement.setString(1, "%"+countrySearch+"%");
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
              User user = new User(id, name, email, country);
              users.add(user);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList =new ArrayList<>();

        try {Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}

