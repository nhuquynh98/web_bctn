using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webMVC.Models
{
    public class SANPHAMDAMUA
    {
        public int masp { get; set; }
        public string tensp { get; set; }
        public string MaLSP { get; set; }
        public Nullable<int> gia { get; set; }
        public string donvi { get; set; }
        public string mota { get; set; }
        public Nullable<int> slsp { get; set; }
        public Nullable<int> trangthai { get; set; }
    }
}