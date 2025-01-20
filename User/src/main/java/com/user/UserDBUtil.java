package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static List<User> validate(String username, String password) {
        ArrayList<User> cus = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE username='" + username + "' AND password='" + password + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt(1);
                String username1 = rs.getString(2);
                String email = rs.getString(3);
                String password1 = rs.getString(4);
                String patientName = rs.getString(5);
                String patientAge = rs.getString(6);
                String patientGender = rs.getString(7);
                String patientCondition = rs.getString(8);
                String guardianName = rs.getString(9);
                String guardianContact = rs.getString(10);
                String guardianRelation = rs.getString(11);

                User c = new User(id, username1, email, password1, patientName, patientAge, patientGender, patientCondition, guardianName, guardianContact, guardianRelation);
                cus.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cus;
    }

    public static boolean insertcustomer(String username, String email, String password, String patientName, String patientAge,
                                          String patientGender, String patientCondition, String guardianName, String guardianContact, String guardianRelation) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO user VALUES (0, '" + username + "', '" + email + "', '" + password + "', '" +
                         patientName + "', '" + patientAge + "', '" + patientGender + "', '" + patientCondition + "', '" +
                         guardianName + "', '" + guardianContact + "', '" + guardianRelation + "')";
            int rs = stmt.executeUpdate(sql);

            isSuccess = rs > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean updatecustomer(String id, String username, String email, String password, String patientName,
                                         String patientAge, String patientGender, String patientCondition, String guardianName,
                                         String guardianContact, String guardianRelation) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "UPDATE user SET username='" + username + "', email='" + email + "', password='" + password + "', " +
                         "patientName='" + patientName + "', patientAge='" + patientAge + "', patientGender='" + patientGender + "', " +
                         "patientCondition='" + patientCondition + "', guardianName='" + guardianName + "', guardianContact='" + guardianContact + "', " +
                         "guardianRelation='" + guardianRelation + "' WHERE id='" + id + "'";
            int rs = stmt.executeUpdate(sql);

            isSuccess = rs > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static List<User> getCustomerDetails(String id) {
        int convertedID = Integer.parseInt(id);
        ArrayList<User> cus = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE id='" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int userId = rs.getInt(1);
                String username = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String patientName = rs.getString(5);
                String patientAge = rs.getString(6);
                String patientGender = rs.getString(7);
                String patientCondition = rs.getString(8);
                String guardianName = rs.getString(9);
                String guardianContact = rs.getString(10);
                String guardianRelation = rs.getString(11);

                User c = new User(userId, username, email, password, patientName, patientAge, patientGender, patientCondition, guardianName, guardianContact, guardianRelation);
                cus.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cus;
    }

    public static boolean deleteCustomer(String id) {
        int convId = Integer.parseInt(id);

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM user WHERE id='" + convId + "'";
            int r = stmt.executeUpdate(sql);

            isSuccess = r > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
