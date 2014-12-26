package controllers;

import models.Users;
import play.mvc.Controller;
import play.mvc.Result;
import play.mvc.Security;
import views.html.dashboard.index;
import play.Logger;
/**
 * User: yesnault
 * Date:
 */
@Security.Authenticated(Secured.class)
public class Dashboard extends Controller {

    public static Result index() {

        String username = request().username();
        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }

        return ok(index.render(Users.findByUserName(request().username())));
    }

    public static Result admin() {

        String username = request().username();
        if(username==null){
            flash("error","session expired");

            return redirect( "/");
        }
        return ok(index.render(Users.findByUserName(request().username())));
    }
}

