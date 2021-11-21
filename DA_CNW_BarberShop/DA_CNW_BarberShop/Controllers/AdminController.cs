using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_CNW_BarberShop.Models;

namespace DA_CNW_BarberShop.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        DBBarberShopDataContext db = new DBBarberShopDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TrangChu()
        {
            if (Session["DangNhap"] != null)
            {
                ViewBag.TongSoSanPham = TongSoLuongSanPham();
                ViewBag.TongSoKhacHang = TongSoKhachHang();
                ViewBag.TongSoNhanVien = TongSoNhanVien();
                ViewBag.TongSPVSCN = TongSoSanPhamTrongLoai("VESINHCANHAN");
                ViewBag.PhanTramVSCN = tinhPhanTramTungLoai(TongSoSanPhamTrongLoai("VESINHCANHAN"), TongSoLuongSanPham());
                ViewBag.TongSPTTBC = TongSoSanPhamTrongLoai("TAYTEBAOCHET");
                ViewBag.PhanTramTBC = tinhPhanTramTungLoai(Convert.ToInt32(TongSoSanPhamTrongLoai("TAYTEBAOCHET")), Convert.ToInt32(TongSoLuongSanPham()));

                ViewBag.TongSPTAM = TongSoSanPhamTrongLoai("TAM");
                ViewBag.PhanTramTam = tinhPhanTramTungLoai(Convert.ToInt32(TongSoSanPhamTrongLoai("TAM")), Convert.ToInt32(TongSoLuongSanPham()));

                ViewBag.TongSPSRM = TongSoSanPhamTrongLoai("SUARUAMAT");
                ViewBag.PhanTramSRM = tinhPhanTramTungLoai(Convert.ToInt32(TongSoSanPhamTrongLoai("SUARUAMAT")), Convert.ToInt32(TongSoLuongSanPham()));

                ViewBag.TongSPDX = TongSoSanPhamTrongLoai("DAUXA");
                ViewBag.PhanTramDX = tinhPhanTramTungLoai(Convert.ToInt32(TongSoSanPhamTrongLoai("DAUXA")), Convert.ToInt32(TongSoLuongSanPham()));

                return View();
            }
            else return RedirectToAction("DangNhap", "Admin");
        }
        public ActionResult DanhSachSanPham()
        {
            if(Session["DangNhap"] != null)
            {
                var query = db.tblProducts.Take(20).ToList();
                return View(query);
            }
            else return RedirectToAction("DangNhap", "Admin");
        }
        public double TongSoLuongSanPham()
        {
            return db.tblProducts.ToList().Count();
        }
        public int TongSoKhachHang()
        {
            return db.tblCustomers.ToList().Count();
        }
        public int TongSoNhanVien()
        {
            return db.tblStaffs.ToList().Count();
        }
        public double TongSoSanPhamTrongLoai(string loaiSanPham)
        {
            return db.tblProducts.Where(s => s.FK_sCategoryProductID == loaiSanPham).ToList().Count();
        }
        public double tinhPhanTramTungLoai(double soLuongSanPhamTrongLoai, double TongSoSanPham)
        {
            return (soLuongSanPhamTrongLoai / TongSoSanPham) * 100;
        }
        public ActionResult HoaDonPartial()
        {
            var query = db.tblReceipts.Take(5).OrderByDescending(s => s.PK_iReceiptID).ToList();
            return View(query);
        }
        public ActionResult NhapSanPham()
        {
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(TaiKhoan tk)
        {
            var query = db.tblStaffs.Where(kh => kh.sPhone == tk.UserName).FirstOrDefault();
            if (query != null)
            {
                Session["DangNhap"] = query.sNameStaff;
                return RedirectToAction("TrangChu", "Admin");
            }
            else return View();
        }
    }
}