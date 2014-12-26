package models;

import models.utils.AppException;
import models.utils.Hash;
import play.data.format.Formats;
import play.data.validation.Constraints;
import play.db.ebean.Model;
import javax.persistence.ManyToOne;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.lang.Boolean;
import java.util.Date;
import java.util.List;

/**
 * User: Anshika Gupta
 * Date: 20/12/14
 */

@Entity
public class Records extends Model {

    @Id
    public Long id;









    @Formats.DateTime(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(unique = true)
    public Date date_punch_in;

    @Column(unique = false)
    public String note1;

    @Formats.DateTime(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(unique = true)
    public Date date_punch_out;


    @Column(unique = false)
    public String note2;

    @ManyToOne
    public Users user;


    /**
     * Retrieve a user from an email.
     *
     * @param email email to search
     * @return a user
     */
    // -- Queries (long id, user.class)
    public static Model.Finder<Long, Records> find = new Model.Finder<Long, Records>(Long.class, Records.class);


    public static Records findByUsernameJoin(Long username) {
        return find.where().eq("user_id", username).orderBy("id desc").setMaxRows(1).findUnique();
    }

  /*  public static List<Records> findAll() throws AppException {
        return find.where().gt("date_punch_in", d1).lt("date_punch_in", d2).eq("user_id",id).findList();
    }*/
  /*  public static Records findByUsernameJoina(String username) {
        return find.where().eq("username", username).orderBy("id desc").setMaxRows(1).findUnique(); }*/


}
