using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using webMVC.Models;

namespace webMVC.Areas.admin.Models
{
    public class DAOADMIN
    {
        public sanpham sp { get; set; }
        public chitietsanpham chitietsp { get; set; }
        public TaiKhoan taikhoan { get; set; }
        public List<GIOHANG> listGioHang { get; set; }
        public List<sanpham> listsanpham { get; set; }

        public string taikhoansai { get; set; }
    }
}