package models;

import models.utils.AppException;
import models.utils.Hash;
import play.data.format.Formats;
import play.data.validation.Constraints;
import play.db.ebean.Model;
import scala.collection.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.lang.Boolean;
import java.lang.Long;
import java.lang.String;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

/**
 * User: Anshika Gupta
 * Date: 20/12/14
 */
@Entity
public class Users extends Model {

    @Id
    public Long id;

    @Constraints.Required
    @Formats.NonEmpty
    @Column(unique = true)
    public String email;

    @Constraints.Required
    @Formats.NonEmpty
    @Column(unique = false)
    public String fullname;

    @Constraints.Required
    @Formats.NonEmpty
    @Column(unique = true)
    public String username;

    public String confirmationToken;

    @Constraints.Required
    @Formats.NonEmpty
    public String passwordHash;

    @Formats.DateTime(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date dateCreation;

    @Formats.NonEmpty
    public Boolean validated = false;

    @Formats.NonEmpty
    public Boolean isadmin = false;

    @Formats.NonEmpty
    public Boolean status = true;

    @OneToMany(mappedBy="user")
    public List<Records> records;


    // -- Queries (long id, user.class)
    public static Model.Finder<Long, Users> find = new Model.Finder<Long, Users>(Long.class, Users.class);

    /**
     * Retrieve a user from an email.
     *
     * @param email email to search
     * @return a user
     */
    public static Users findByEmail(String email) {
        return find.where().eq("email", email).findUnique();
    }

    /**
     * Retrieve a user from a fullname.
     *
     * @param fullname Full name
     * @return a user
     */
    public static Users findByFullname(String fullname) {
        return find.where().eq("fullname", fullname).findUnique();
    }

    /**
     * Retrieve a user from a username.
     *
     * @param fullname Full name
     * @return a user
     */
    public static Users findByUserName(String username) {
        return find.where().eq("username", username).findUnique();
    }


    /**
     * Retrieves a user from a confirmation token.
     *
     * @param token the confirmation token to use.
     * @return a user if the confirmation token is found, null otherwise.
     */
    public static Users findByConfirmationToken(String token) {
        return find.where().eq("confirmationToken", token).findUnique();
    }

    /**
     * Authenticate a User, from a email and clear password.
     *
     * @param email         email
     * @param clearPassword clear password
     * @return User if authenticated, null otherwise
     * @throws AppException App Exception
     */
    public static Users authenticate(String username, String clearPassword) throws AppException {

        // get the user with username only to keep the salt password
        Users users = find.where().eq("username", username).findUnique();
        if (users != null) {
            // get the hash password from the salt + clear password
            if (Hash.checkPassword(clearPassword, users.passwordHash)) {
                return users;
            }
        }
        return null;
    }
    public static Boolean isActive(String username)throws AppException {
        Users users = find.where().eq("username", username).findUnique();
        if (users != null) {
            if(users.status==true)
                return true;
        }
        return false;
    }
    public static Boolean isAdmin(String username) throws AppException {

        // get the user to know user is a admin or not
        Users users = find.where().eq("username", username).eq("isadmin", ((Boolean) true)).findUnique();
        if (users != null) {
            // get the hash password from the salt + clear password
               return true;

        }

        return false;
    }
    
    public void changePassword(String password) throws AppException {
        this.passwordHash = Hash.createPassword(password);
        this.save();
    }

    /**
     * Confirms an account.
     *
     * @return true if confirmed, false otherwise.
     * @throws AppException App Exception
     */
    public static boolean confirm(Users users) throws AppException {
        if (users == null) {
            return false;
        }

        users.confirmationToken = null;
        users.validated = true;
        users.save();
        return true;
    }

    public static List<Users> findAll() throws AppException {
        return find.select("id, username,status").where().eq("validated", true).findList();
    }

   public static List<Users> findAllRecords(Date d1,Date d2) throws AppException {
        return find.where().eq("validated", true).gt("records.date_punch_in", d1).lt("records.date_punch_in", d2).findList();
    }

    public static List<Users> findAllRecordsByUserId(Date d1,Date d2, Long id) throws AppException {
        return find.where().eq("validated", true).gt("records.date_punch_in", d1).lt("records.date_punch_in", d2).eq("id", id).findList();
    }
}
