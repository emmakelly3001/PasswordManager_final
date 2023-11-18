/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package passwordmanagerapp;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.ResultSet;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PasswordManagerApp {

    private static Connection connection;

    public static boolean establishDatabaseConnection() {
        try {
            // My database login with the user the url and the password
            // This is my username, url and password. The user will have to connect their own database for the connection to be successful.
            String dbUrl = "jdbc:mysql://localhost:3306/passwordmanagers";
            String dbUser = "root";
            String dbPassword = "loveland1234";

            // DriverManager - establishing a connection to the database 
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            System.out.println("Connection to the database has been established");
            // The boolean will return true if the database is connected successfully
            return true;
            // The boolean will return true if the database is connecvted successfully
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Failed to connect to the database.", "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    //Return statement
    public static Connection getDatabaseConnection() {
        return connection;
    }

    public static boolean registerDB(Connection connection, String username, String rawPassword) {
        try {
            // Hashing the password using Bcrypt(i added jBCrypt-0.4.3.jar to my libraries for this)
            String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

            //Sql query to insert data into my users
            String insertQuery = "INSERT INTO users (username, password) VALUES (?, ?)";

            // Creating a prepared statement
            try ( PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                // Setting the values for the parameters
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, hashedPassword);

                // Executing the query
                preparedStatement.executeUpdate();

                //This will print in the output box if the username and password have been added successfully
                System.out.println("Data inserted into the database");
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            //This will print in the output box if the username and passwrd have not been added successfully
            JOptionPane.showMessageDialog(null, "Failed to insert data into the database.", "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
    //this method only works if the database is connected

    public static boolean performLogin(String username, String password) {
        if (connection == null) {
            //this will print if the database is not connnected; the method will not run
            System.out.println("Connection is null. Please establish the database connection first.");
            return false;
        }

        //this is the code for the login
        //line of code from the database
        String query = "SELECT * FROM users WHERE username = ?";

        try {
            // Creating a prepared statement
            //this is checking if the user is in the database so they can log in
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // User found, check password
                        String hashedPasswordFromDB = resultSet.getString("password");

                        // Verify the entered password against the hashed password from the database
                        if (BCrypt.checkpw(password, hashedPasswordFromDB)) {
                            // Password is correct, login successful
                            return true;
                        } else {
                            // Password is incorrect
                            return false;
                        }
                    } else {
                        // User not found
                        return false;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Error occurredd uring login verification
            return false; 
        }
    }

    public static void main(String[] args) {
        PasswordManagerApp passwordManagerApp = new PasswordManagerApp();

        // Establishing a database connection
        boolean isDatabaseConnected = passwordManagerApp.establishDatabaseConnection();

        if (isDatabaseConnected) {
            // Use passwordManagerApp.getDatabaseConnection() in other parts of your application
            // For example, you can pass it to your GUI class or use it where needed.
            SwingUtilities.invokeLater(() -> {
                // Running the GUI
                PasswordManagerGUI passwordManagerGUI = new PasswordManagerGUI();
                RegisterGUI registerGUI = new RegisterGUI();

                // Passing the database connection to the GUI classes
                passwordManagerGUI.setDatabaseConnection(passwordManagerApp.getDatabaseConnection());
                registerGUI.setDatabaseConnection(passwordManagerApp.getDatabaseConnection());

                // Show the Register GUI first
                registerGUI.setVisible(true);
                passwordManagerGUI.setVisible(false);
            });
        }
    }
}
