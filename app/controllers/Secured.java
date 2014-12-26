package controllers;

import play.mvc.Http;
import play.mvc.Result;
import play.mvc.Security;
import play.Logger;
import play.*;
import play.mvc.Http.Context;
import play.mvc.Http.Session;
import play.mvc.Http.Flash;

import java.util.Date;



import play.mvc.Controller;
import play.mvc.Result;

import views.html.record.index;
import play.data.Form;
import play.data.format.Formats;
import play.data.validation.Constraints;
/**
 * User: yesnault
 * Date: 22/01/12
 */
public class Secured extends Security.Authenticator {

    @Override
    public String getUsername(Http.Context ctx) {

       // Logger.debug("Hello============="+Play.application().configuration().getString("sessionTimeout"));

        //* see if user is logged in*//*
        if (ctx.session().get("username") == null)
            return null;

        // see if the session is expired
        String previousTick = ctx.session().get("userTime");
        if (previousTick != null && !previousTick.equals("")) {


            long previousT = Long.valueOf(previousTick);
            long currentT = new Date().getTime();
            long timeout = Long.valueOf(Play.application().configuration().getString("sessionTimeout")) * 1000 * 60;
            if ((currentT - previousT) > timeout) {
                // session expired
                ctx.session().clear();
                Logger.debug("expired after minuites>>>"+Play.application().configuration().getString("sessionTimeout"));
                return null;
            }
        }

        // update time in session
        String tickString = Long.toString(new Date().getTime());
        ctx.session().put("userTime", tickString);
       // Logger.debug("ctx.session().get(userTime)=============" + ctx.session().get("userTime"));

        return ctx.session().get("username");







    }

    @Override
    public Result onUnauthorized(Http.Context ctx) {
        return redirect(routes.Application.index());
    }
}
