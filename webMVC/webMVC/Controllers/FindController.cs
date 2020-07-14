using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;

namespace webMVC.Controllers
{
    public class FindController : Controller
    {
        BCTNEntities db = new BCTNEntities();
        // GET: Find
        public ActionResult Index(string query)
        {
            DAO listModel = new DAO();
            listModel.Thongtins = db.thongtins.ToList();
            listModel.Sanphams = db.sanphams.Where(x => x.tensp.Contains(query) && x.slsp > 0 && x.trangthai == 1).ToList<sanpham>();
            listModel.thongtingiohang = new List<sanpham>();
            listModel.dschitietsanpham = db.chitietsanphams.ToList<chitietsanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }
    }
}