package com.fzb.blog.web.controller.blog;

import com.fzb.blog.web.config.ZrlogConfig;
import com.fzb.blog.service.InstallService;
import com.fzb.blog.util.ResUtil;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class InstallController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(InstallController.class);

    public void testDbConn() {
        Map<String, String> dbConn = new HashMap<String, String>();
        dbConn.put("jdbcUrl", "jdbc:mysql://" + getPara("dbhost") + ":"
                + getPara("port") + "/" + getPara("dbname")
                + "?&characterEncoding=UTF-8");
        dbConn.put("user", getPara("dbuser"));
        dbConn.put("password", getPara("dbpwd"));
        dbConn.put("driverClass", "com.mysql.jdbc.Driver");
        setSessionAttr("dbConn", dbConn);
        if (new InstallService(PathKit.getWebRootPath() + "/WEB-INF", dbConn)
                .testDbConn()) {
            render("/install/message.jsp");
        } else {
            setAttr("errorMsg", ResUtil.getStringFromRes("connectDbError", getRequest()));
            index();
        }
    }

    public void installZrlog() {
        String home = getRequest().getScheme() + "://"
                + getRequest().getHeader("host")
                + getRequest().getContextPath() + "/";

        Map<String, String> dbConn = getSessionAttr("dbConn");
        Map<String, String> configMsg = new HashMap<String, String>();
        configMsg.put("title", getPara("title"));
        configMsg.put("second_title", getPara("second_title"));
        configMsg.put("username", getPara("username"));
        configMsg.put("password", getPara("password"));
        configMsg.put("email", getPara("email"));
        configMsg.put("home", home);
        if (new InstallService(PathKit.getWebRootPath() + "/WEB-INF", dbConn,
                configMsg).install()) {
            render("/install/success.jsp");
            ZrlogConfig config = (ZrlogConfig) JFinal.me().getServletContext().getAttribute("config");
            config.installFinish();
        }
    }

    public void index() {
        render("/install/index.jsp");
    }
}
