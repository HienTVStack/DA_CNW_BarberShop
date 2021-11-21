using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DA_CNW_BarberShop.Models
{
    public class TTSanPham
    {
        public int SanPhamID { get; set; }
        public string TenSanPham { get; set; }
        public string MoTaSanPham { get; set; }
        public double GiaSanPham { get; set; }
        public int SoLuongSPTon { get; set; }
        public string HinhAnh { get; set; }
        public int SoLuongXem { get; set; }
        public int SoSaoDanhGiaSP { get; set; }
        public string LoaiGiamGia { get; set; }
        public double TiLeGiamGia { get; set; }
        public double GiaSau
        {
            get
            {
                return (GiaSanPham - GiaSanPham * (TiLeGiamGia / 100));
            }
        } 
        public string LoaiSanPham { get; set; }
    }
}