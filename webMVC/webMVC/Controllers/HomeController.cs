using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;
using System.ComponentModel.DataAnnotations;

namespace webMVC.Controllers
{
    public class HomeController : Controller
    {
        
        BCTNEntities db = new BCTNEntities();
        // GET: Home
        public ActionResult Index()
        {
            DAO listModel = new DAO();
            listModel.Thongtins = db.thongtins.ToList();
            listModel.Sanphams = db.sanphams.ToList<sanpham>();
            listModel.spDienThoai = db.sanphams.Where(sanpham => sanpham.MaLSP == "spdt" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.spMaytinhbang = db.sanphams.Where(sanpham => sanpham.MaLSP == "spmtb" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.spDongho = db.sanphams.Where(sanpham => sanpham.MaLSP == "spdh" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.spTainghe = db.sanphams.Where(sanpham => sanpham.MaLSP == "sptn" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.spLoa = db.sanphams.Where(sanpham => sanpham.MaLSP == "spl" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.spPin = db.sanphams.Where(sanpham => sanpham.MaLSP == "spp" && sanpham.trangthai == 1 && sanpham.slsp > 0).Take(5).ToList<sanpham>();
            listModel.dschitietsanpham = db.chitietsanphams.ToList<chitietsanpham>();
            listModel.thongtingiohang = new List<sanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }
    }
}