using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_CNW_BarberShop.Models;

namespace DA_CNW_BarberShop.Controllers
{
    public class HomeController : Controller
    {
        DBBarberShopDataContext db = new DBBarberShopDataContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(TaiKhoan tk)
        {
            try
            {
                //var query = from kh in db.tblCustomers
                //            where kh.sPhoneNumber == tk.UserName
                //            where kh.sPassword == tk.Password
                //            select new TaiKhoan { UserName = kh.sPhoneNumber,
                //                Password = kh.sPassword };
                var query = db.tblCustomers.Where(kh => kh.sPhoneNumber == tk.UserName).FirstOrDefault();
                if(query != null)
                {
                    Session["DangNhap"] = query.sNameCustomer;
                    if(Session["isXemChiTiet"] != null)
                    {
                        return RedirectToAction("XemChiTietSanPham", "SanPham", new { @MaSP = Session["isXemChiTiet"] });
                    }
                    else
                    {
                        return RedirectToAction("DanhSachSanPham", "SanPham");

                    }
                }
                else
                {
                    Session["DangNhap"] = null;
                    ViewBag.DangNhapError = "Sai tài khoản hoặc mật khẩu";
                }
            }
            catch(Exception)
            {
                Session["DangNhap"] = null;
                ViewBag.DangNhapError = "Sai tài khoản hoặc mật khẩu";
            }
            return View();
        }
        public ActionResult TimKiem(string strSearch)
        {
            if(Session["DangNhap"] != null)
            {
                Session["DangNhap"] = Session["DangNhap"];
            }
            var query = from sanPham in db.tblProducts
                        join giamGia in db.tblDiscounts
                        on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where sanPham.sProductName.Contains(strSearch)
                        orderby giamGia.fRatioDiscount descending
                        select new TTSanPham
                        {
                            SanPhamID = sanPham.PK_iProductID,
                            TenSanPham = sanPham.sProductName,
                            MoTaSanPham = sanPham.sDescription,
                            GiaSanPham = Convert.ToDouble(sanPham.fPrice),
                            HinhAnh = sanPham.sImage,
                            SoLuongSPTon = Convert.ToInt32(sanPham.iQuantityInStock),
                            SoLuongXem = Convert.ToInt32(sanPham.iViewNumber),
                            SoSaoDanhGiaSP = Convert.ToInt32(sanPham.sStar),
                            LoaiGiamGia = giamGia.PK_sDiscountID,
                            TiLeGiamGia = giamGia.fRatioDiscount,
                            LoaiSanPham = sanPham.FK_sCategoryProductID
                        };
            return View(query.ToList());

        }
    }
}