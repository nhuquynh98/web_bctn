using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using webMVC.Models;

namespace webMVC.Models
{
    public class DAO
    {
        public List<thongtin> Thongtins { get; set; }
        public List<sanpham> Sanphams { get; set; }
        public List<SANPHAMDAMUA> SanphamDaMua { get; set; }
        public List<sanpham> spDienThoai { get; set; }
        public List<sanpham> spMaytinhbang { get; set; }
        public List<sanpham> spDongho { get; set; }
        public List<sanpham> spTainghe { get; set; }
        public List<sanpham> spPin { get; set; }
        public List<sanpham> spLoa { get; set; }
        public sanpham sanpham { get; set; }
        public ketnoi ketnoi { get; set; }
        public Tienich tienich { get; set; }
        public bonho bonho { get; set; }
        public cameraSau camerasau { get; set; }
        public cameraTruoc cameratruoc { get; set; }
        public hedieuhanh hedieuhanh { get; set; }
        public manhinh manhinh { get; set; }
        public thietketrongluong thietketrongluong { get; set; }
        public thongtinsac thongtinsac { get; set; }
        public LoaiSanPham loaisp { get; set; }
        public chitietsanpham chitietsanpham { get; set; }
        public List<sanpham> thongtingiohang { get; set; }
        public List<chitietsanpham> dschitietsanpham { get; set; }

        public string thongbaodangnhap { get; set; }
        public string thongbaodangky { get; set; }
    }
}