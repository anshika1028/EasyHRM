package controllers;

import play.Logger;
import models.Users;
import models.Records;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.users.index;
import play.data.Form;
import play.data.format.Formats;
import play.data.validation.Constraints;
import play.i18n.Messages;
import play.db.ebean.Model;
import java.lang.String;
import java.util.Date;
import java.util.List;
import models.utils.AppException;
import static play.libs.Json.*;
@Security.Authenticated(Secured.class)
public class ManageUsers extends Controller {





    public static Result index() throws AppException{
        String username = request().username();
        if(username==null){
            flash("error","session expired");
            return redirect( "/");
        }
        Users user = Users.findByUserName(username);
        List<Users> users =Users.findAll();


        return ok(index.render(user,users));
    }

    public static Result changeStatus(String user_name) {
        String username = request().username();

        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }

        Users user2 = Users.findByUserName(user_name);
        Logger.debug("Di ===============" + user_name);
        Logger.debug("Di ===============" + username);
        if(username.equals(user_name)){
            Logger.debug("inside if" + user_name);
            flash("error","Admin status can not be changed");
        }else {
            Logger.debug("inside else" + user_name);
            if (user2.status) {
                user2.status = false;
            } else {
                user2.status = true;
            }
            user2.update();
            flash("success"," Status  for user "+user2.fullname+" is changed");
        }

        return redirect(routes.ManageUsers.index());
    }



}