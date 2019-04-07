package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
public class workOnDB {
    ArrayList<student> listStudent = new ArrayList<>();

    public boolean addStudent(student studentAdd) {
        boolean studentInDB = true;
        Connection con = myConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("INSERT INTO `studentDB` (`admissionNo`,`name`,`grade`,`section`,`description`,`active`) VALUES (?,?,?,?,?,?)");
            ps.setInt(1,studentAdd.getAdmissionNo());
            ps.setString(2,studentAdd.getName());
            ps.setInt(3,studentAdd.getGrade());
            ps.setString(4, studentAdd.getSection());
            ps.setString(5,studentAdd.getDescription());
            ps.setBoolean(6,studentAdd.isActive());
            if (ps.executeUpdate() != 0) {
                System.out.println("New student in DB");
            } else {
                studentInDB= false;
                System.out.println("Something wrong with studentDB");
            }
        } catch (SQLException e) {
            System.out.println("problem in class studentDB: " + e);
            e.printStackTrace();
        }


        return studentInDB;
    }

    public boolean addBook (book bookAdd) {
        Connection con = myConnection.getConnection();
        PreparedStatement ps;
        boolean bookInDB = true;
        try {
            ps = con.prepareStatement("INSERT INTO `bookTitleDB` (`title`, `category`, `author`) VALUES (?,?,?)");
            ps.setString(1,bookAdd.getTitle());
            ps.setString(2, bookAdd.getCategory());
            ps.setString(3,bookAdd.getAuthor());
            if (ps.executeUpdate() != 0) {
                System.out.println("New book in DB");
            } else {
                bookInDB= false;
                System.out.println("Something wrong with bookDB");
            }
        } catch (SQLException e) {
            System.out.println("problem in class studentDB: " + e);
            e.printStackTrace();
        }
        return  bookInDB;
    }
    public boolean addBookItem (bookItem bookItemAdd) {
        Connection con = myConnection.getConnection();
        PreparedStatement ps;
        boolean bookItemInDB = true;
        try {
            ps = con.prepareStatement("INSERT INTO `bookItemDB` (`barCode`, `active`, `shelf`, `rack` ,`idTitle`) VALUES (?,?,?,?,?)");
            ps.setInt(1,bookItemAdd.getBarCode());
            ps.setBoolean(2, bookItemAdd.isActive());
            ps.setInt(3,bookItemAdd.getShelf());
            ps.setInt(4,bookItemAdd.getRack());
            ps.setInt(5,bookItemAdd.getIdTitle());
            if (ps.executeUpdate() != 0) {
                System.out.println("New bookItem in DB");
            } else {
                bookItemInDB= false;
                System.out.println("Something wrong with bookItemDB");
            }
        } catch (SQLException e) {
            System.out.println("problem in class bookItemDB: " + e);
            e.printStackTrace();
        }
        return  bookItemInDB;


    }

}

