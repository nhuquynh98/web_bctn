using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;

namespace webMVC.Controllers
{
    public class LoginController : Controller
    {
        BCTNEntities db = new BCTNEntities();
        // GET: Login
        public ActionResult Index()
        {
            
            if(Session["Ten"] == null)
            {
                DAO listModel = new DAO();
                listModel.thongbaodangnhap = null;
                if (Session["dangnhapsai"]!=null)
                {
                    listModel.thongbaodangnhap = "Tài khoản không đúng!";
                    Session["dangnhapsai"] = null;
                }
                listModel.thongbaodangky = null;
                if (Session["dangkythanhcong"] != null)
                {
                    listModel.thongbaodangky = "Đăng ký tài khoản thành công!";
                    Session["dangkythanhcong"] = null;
                }
                if(Session["dangkyemail"] != null)
                {
                    listModel.thongbaodangky = "Email đăng ký đã tồn tại. Bạn nên dùng email khác để đăng ký!";
                    Session["dangkyemail"] = null;
                }

                listModel.Thongtins = db.thongtins.ToList();
                listModel.Sanphams = db.sanphams.ToList<sanpham>();
                listModel.thongtingiohang = new List<sanpham>();
                if (Session["giohang"] != null)
                {
                    listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
                }
                return View(listModel);
            }
            else
            {
                return Redirect("/Home/Index");
            }
        }

        [HttpPost]
        public ActionResult Dangnhap(TaiKhoan tk)
        {
            if (ModelState.IsValid)
            {
                MD5HASH md5Hash = new MD5HASH();
                var mk = md5Hash.encrypt(tk.Matkhau);
                var NguoiDung = db.TaiKhoans.SingleOrDefault(x => x.Email == tk.Email && x.Matkhau == mk);//kiểm tra giá trị nhập vào
                if (NguoiDung != null)
                {
                    Session["TaiKhoan"] = NguoiDung;
                    Session["Admin"] = null;
                    Session["Ten"] = NguoiDung.Ten;
                    Session["TenDangNhap"] = NguoiDung.TenDangnhap;
                    var giohang = db.giohangs.Where(x => x.makhachhang == NguoiDung.makh).ToList<giohang>();
                    List<sanpham> dsSanPham = new List<sanpham>();
                    foreach (var item in giohang)
                    {
                        sanpham sanpham = db.sanphams.Where(x => x.masp == item.masp && x.slsp >= item.soluongdamua && x.trangthai ==1).SingleOrDefault();
                        if (sanpham != null)
                        {
                            sanpham.slsp = item.soluongdamua;
                            dsSanPham.Add(sanpham);
                        }
                    }
                    if(dsSanPham.Count > 0)
                    {
                        Session["giohang"] = dsSanPham;
                    }
                    return Redirect("/Home/Index");
                }
            }
            Session["dangnhapsai"] = true;
            return Redirect("/Login/Index");
        }

        [HttpPost]
        public ActionResult Dangky(TaiKhoan tk)
        {
            var NguoiDung = db.TaiKhoans.Where(x => x.Email == tk.Email).ToList();
            if(NguoiDung.Count > 0)
            {
                Session["dangkyemail"] = true;
                return Redirect("/Login/Index");
            }
            TaiKhoan taikhoanmoi = new TaiKhoan();

            MD5HASH md5Hash = new MD5HASH();
            var mk = md5Hash.encrypt(tk.Matkhau);
            taikhoanmoi.Ten = tk.Ten;
            taikhoanmoi.Ho = tk.Ho;
            taikhoanmoi.Ngaysinh = tk.Ngaysinh;
            taikhoanmoi.Sdt = tk.Sdt;
            taikhoanmoi.Email = tk.Email;
            taikhoanmoi.Matkhau = mk;
            taikhoanmoi.Phanquyen = 0;
            db.TaiKhoans.Add(taikhoanmoi);
            db.SaveChanges();
            Session["dangkythanhcong"] = true;
            return Redirect("/Login/Index");
        }

        public ActionResult Dangxuat()
        {
            Session["Admin"] = null;
            Session["TaiKhoan"] = null;
            Session["HoTen"] = null;
            Session["TenDangNhap"] = null;
            Session["LoaiTs"] = null;
            Session["Ten"] = null;
            Session["giohang"] = null;
            return Redirect("/Home/Index");
        }
    }
}