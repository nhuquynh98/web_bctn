using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webMVC.Models;
using System.ComponentModel.DataAnnotations;
using System.Net;
using PayPal.Api;

namespace webMVC.Controllers
{
    public class ProductController : Controller
    {
        BCTNEntities db = new BCTNEntities();
        // GET: Product
        public ActionResult Index()
        {
            DAO listModel = new DAO();
            listModel.Thongtins = db.thongtins.ToList();
            listModel.Sanphams = db.sanphams.Where(x=> x.slsp > 0 && x.trangthai ==1).ToList<sanpham>();
            listModel.thongtingiohang = new List<sanpham>();
            listModel.dschitietsanpham = db.chitietsanphams.ToList<chitietsanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }

        // GET:  Products/Details/id
        public ActionResult Details(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            sanpham sp = db.sanphams.Find(id);
            if(sp == null || sp.trangthai != 1 || sp.slsp <= 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.NotFound);
            }
            DAO listModel = new DAO();
            listModel.Thongtins = db.thongtins.ToList();
            listModel.sanpham = sp;
            // Truy vấn 5 giá trị ngẫu nhiên cùng loại với sản phẩm. Không lập lại sản phẩm đã lấy 
            listModel.Sanphams = db.sanphams.Where(x => x.MaLSP == sp.MaLSP && x.masp !=sp.masp && x.trangthai == 1).OrderBy(r => Guid.NewGuid()).Take(5).ToList<sanpham>();
            listModel.ketnoi = db.ketnois.Where(x => x.maSp == id).SingleOrDefault();
            listModel.tienich = db.Tieniches.Where(x => x.maSp == id).SingleOrDefault();
            listModel.bonho = db.bonhoes.Where(x => x.maSp == id).SingleOrDefault();
            listModel.camerasau = db.cameraSaus.Where(x => x.maSp == id).SingleOrDefault();
            listModel.cameratruoc = db.cameraTruocs.Where(x => x.maSp == id).SingleOrDefault();
            listModel.hedieuhanh = db.hedieuhanhs.Where(x => x.maSp == id).SingleOrDefault();
            listModel.manhinh = db.manhinhs.Where(x => x.maSp == id).SingleOrDefault();
            listModel.thietketrongluong = db.thietketrongluongs.Where(x => x.maSp == id).SingleOrDefault();
            listModel.thongtinsac = db.thongtinsacs.Where(x => x.maSp == id).SingleOrDefault();
            listModel.loaisp = db.LoaiSanPhams.Where(x => x.MaLSP == sp.MaLSP).SingleOrDefault();
            listModel.chitietsanpham = db.chitietsanphams.Where(x => x.masp == id).SingleOrDefault();
            listModel.thongtingiohang = new List<sanpham>();
            listModel.dschitietsanpham = db.chitietsanphams.ToList<chitietsanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }

        public ActionResult GioHang()
        {
            if (Session["Ten"] == null)
            {
                return Redirect("/Login/Index");
            }
            var khachhang = Session["TaiKhoan"] as TaiKhoan;
            DAO listModel = new DAO();
            listModel.dschitietsanpham = db.chitietsanphams.ToList<chitietsanpham>();
            var giohang = db.giohangs.Where(x => x.makhachhang == khachhang.makh).ToList<giohang>();
            var spDaMua = db.muahangs.Where(x => x.makhachhang == khachhang.makh).ToList<muahang>();
            List<sanpham> dsSanPham = new List<sanpham>();
            List<SANPHAMDAMUA> dsSanPhamDaMua = new List<SANPHAMDAMUA>();
            foreach (var itemD in spDaMua)
            {
                var sanphamDaMua = db.sanphams.Find(itemD.masp);
                SANPHAMDAMUA SPDM = new SANPHAMDAMUA();
                if (sanphamDaMua!= null)
                {
                    SPDM.masp = sanphamDaMua.masp;
                    SPDM.tensp = sanphamDaMua.tensp;
                    SPDM.MaLSP = sanphamDaMua.MaLSP;
                    SPDM.trangthai = sanphamDaMua.trangthai;
                    SPDM.mota = sanphamDaMua.mota;
                    SPDM.gia = itemD.gia;
                    SPDM.slsp = itemD.soluongdamua;
                    dsSanPhamDaMua.Add(SPDM);
                }
            }
            listModel.SanphamDaMua = dsSanPhamDaMua;
            listModel.Thongtins = db.thongtins.ToList();
            foreach (var item in giohang)
            {
                var sanphamGioHang = db.sanphams.Where(x => x.masp == item.masp && x.slsp >= item.soluongdamua && x.trangthai == 1).SingleOrDefault();
                if (sanphamGioHang != null)
                {
                    sanphamGioHang.slsp = item.soluongdamua;
                    dsSanPham.Add(sanphamGioHang);
                }
            }
            listModel.Sanphams = dsSanPham;
            Session["giohang"] = dsSanPham;
            listModel.thongtingiohang = new List<sanpham>();
            if (Session["giohang"] != null)
            {
                listModel.thongtingiohang = (List<sanpham>)Session["giohang"];
            }
            return View(listModel);
        }

        [HttpPost]
        public ActionResult ThemGioHang(ADDGIOHANG sp)
        {
            if (Session["Ten"] == null)
            {
                return Redirect("/Login/Index");
            }
            var khachhang = Session["TaiKhoan"] as TaiKhoan;
            giohang gh = new giohang();
            var giohang = db.giohangs.Where(x => x.masp == sp.masp).SingleOrDefault();

            if (giohang == null)
            {
                var sanpham = db.sanphams.SingleOrDefault(x => x.masp == sp.masp && x.slsp >= sp.slsp && x.trangthai == 1);
                if (sanpham != null)
                {
                    gh.makhachhang = khachhang.makh;
                    gh.masp = sp.masp;
                    gh.soluongdamua = sp.slsp;
                    db.giohangs.Add(gh);
                }
            }
            else
            {
                var sanpham = db.sanphams.Where(x => x.masp == sp.masp && x.slsp >= (sp.slsp + giohang.soluongdamua) && x.trangthai == 1).SingleOrDefault();
                if (sanpham != null)
                {
                    giohang.soluongdamua += sp.slsp;
                }
            }
            db.SaveChanges();
            return Redirect("/product/giohang");
        }


        // GET:  Products/DeleteGioHang/id
        public ActionResult DeleteGioHang(int? id)
        {
            if (Session["Ten"] == null)
            {
                return Redirect("/Login/Index");
            }
            var itemToRemove = db.giohangs.SingleOrDefault(x => x.masp == id);
            db.giohangs.Remove(itemToRemove);
            db.SaveChanges();
            return Redirect("/product/giohang");
        }

        private Payment payment;

        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            var listItems = new ItemList()
            {
                items = new List<Item>()
            };
            List<sanpham> dsSanPham = (List<sanpham>)Session["giohang"];
            foreach (var item in dsSanPham)
            {
                LoaiSanPham loaisp = db.LoaiSanPhams.Where(x => x.MaLSP == item.MaLSP).SingleOrDefault();
                listItems.items.Add(new Item()
                {
                    name = item.tensp,
                    currency = "USD",
                    price = (item.gia/1000000).ToString(),
                    quantity = item.slsp.ToString(),
                    sku = loaisp.TenLSP,
                });
            }

            var payer = new Payer()
            {
                payment_method = "paypal"
            };

            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };

            // Create details object
            var details = new Details()
            {
                tax = "1",
                shipping = "1",
                subtotal = listItems.items.Sum(x => int.Parse(x.price) * int.Parse(x.quantity)).ToString(),
            };

            // Create amount object
            var amount = new Amount()
            {
                currency = "USD",
                total = (int.Parse(details.tax) + int.Parse(details.shipping) + int.Parse(details.subtotal)).ToString(),
                details = details,
            };

            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = "Mua sản phẩm",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                item_list = listItems
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls,
            };

            return payment.Create(apiContext);
        }

        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };

            payment = new Payment()
            {
                id = paymentId
            };

            return payment.Execute(apiContext, paymentExecution);
        }

        public ActionResult PaymentWithPaypal()
        {
            if (Session["TaiKhoan"] == null)
            {
                Redirect("/Login/Index");
            }
            var kh = Session["TaiKhoan"] as TaiKhoan;
            var giohang = db.giohangs.Where(x => x.makhachhang == kh.makh).ToList<giohang>();
            List<sanpham> dssp = new List<sanpham>();
            foreach (var item in giohang)
            {
                var sanphamGioHang = db.sanphams.Where(x => x.masp == item.masp && x.slsp >= item.soluongdamua && x.trangthai == 1).SingleOrDefault();
                if (sanphamGioHang != null)
                {
                    sanphamGioHang.slsp = item.soluongdamua;
                    dssp.Add(sanphamGioHang);
                }
            }
            if (dssp.Count <= 0)
            {
                return Redirect("/product/giohang");
            }
            APIContext apiContext = PaypalConfig.GetAPIContext();
            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Product/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createdPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);

                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;

                    while (links.MoveNext())
                    {
                        Links link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = link.href;
                        }
                    }
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    var guid = Request.Params["guid"];
                    var executePayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if (executePayment.state.ToLower() != "approved")
                    {
                        return Redirect("/product/giohang");
                    }
                }
            }
            catch (Exception ex)
            {
                return Redirect("/product/giohang");
            }

            var khachhang = Session["TaiKhoan"] as TaiKhoan;
            List<sanpham> dsSanPham = (List<sanpham>)Session["giohang"];
            //foreach (var item in dsSanPham)
            //{
            //    var sl = item.slsp;
            //    sanpham spduocmua = new sanpham();
            //    spduocmua = db.sanphams.SingleOrDefault(x => x.masp == item.masp);
            //    spduocmua.slsp -= sl;

            //    db.SaveChanges();
            //}

            foreach (var item in dsSanPham)
            {
                muahang spDaMua = new muahang();
                spDaMua.makhachhang = khachhang.makh;
                spDaMua.masp = item.masp;
                spDaMua.soluongdamua = item.slsp;
                spDaMua.gia = item.gia;
                spDaMua.ngaymua = DateTime.Now;
                db.muahangs.Add(spDaMua);

                var itemToRemove = db.giohangs.SingleOrDefault(x => x.masp == item.masp && x.makhachhang == khachhang.makh);
                db.giohangs.Remove(itemToRemove);

                db.SaveChanges();
            }


            return Redirect("/product/giohang");
        }
        

    }
}
