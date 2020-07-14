﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace webMVC
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
        protected void Session_Start()
        {
            Session["Admin"] = null;
            Session["TaiKhoan"] = null;
            Session["HoTen"] = null;
            Session["TenDangNhap"] = null;
            Session["LoaiTs"] = null;
            Session["Ten"] = null;
            Session["giohang"] = null;
            Session["dangnhapsai"] = null;
            Session["dangkythanhcong"] = null;
            Session["dangkyemail"] = null;
            Session["dangnhapAdminSai"] = null;
        }
    }
}
