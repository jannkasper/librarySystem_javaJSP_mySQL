package appLayer;

public class User {
    public User () {
//        int currentUserId = 7;
//        Connection con = database.myConnection.getConnection();
//        Statement st;
//        ResultSet rs;
//
//        try {
//            st = con.createStatement();
//            rs = st.executeQuery("SELECT `id`, `fname`, `lname`, `groupc`, `phone`, `email`, `address`, `pic` FROM `mycontact` WHERE `userid` = " + currentUserId);
//
//            while (rs.next()) {
//                System.out.println(rs.getInt("id")+ " " +
//                        rs.getString("fname")+" " +
//                        rs.getString("lname")+" " +
//                        rs.getString("groupc")+" " +
//                        rs.getString("phone")+" " +
//                        rs.getString("email")+" " +
//                        rs.getString("address")+" " +
//                        rs.getBytes("pic")+" " +
//                        currentUserId);
//
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

    public boolean isValidUserCredentials (String sUserName, String sUserPassword) {
        if(sUserName.equals("aaa") && sUserPassword.equals("bbb")) {
            return true;
        }
        return false;
    }
}
