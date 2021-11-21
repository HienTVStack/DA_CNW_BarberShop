using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_CNW_BarberShop.Models;
using PagedList;
using PagedList.Mvc;

namespace DA_CNW_BarberShop.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        DBBarberShopDataContext db = new DBBarberShopDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult loadSanPhamCoGiamGia()
        {
            var query = from sanPham in db.tblProducts
                        join giamGia in db.tblDiscounts
                        on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
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
            return View(query.Take(4).ToList());
        }
        public ActionResult XemChiTietSanPham(int MaSP)
        {
            if (Session["DangNhap"] != null)
                Session["DangNhap"] = Session["DangNhap"];
            var query = from sanPham in db.tblProducts
                        join giamGia in db.tblDiscounts
                        on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where sanPham.PK_iProductID == MaSP
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
        public ActionResult DanhSachSanPham( int ? i)
        {

            if(Session["DangNhap"] != null)
            {
                Session["DangNhap"] = Session["DangNhap"];
            }
            var query = from sanPham in db.tblProducts
                        join giamGia in db.tblDiscounts
                        on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        orderby sanPham.PK_iProductID descending
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
            return View(query.ToPagedList(i ?? 1, 12));
        }
        public ActionResult TenLoaiSanPham()
        {
            var query = db.tblCategoryProducts.Take(6).ToList();
            return View(query);
        }
        public ActionResult SanPhamTrongLoai(string MaLoai)
        {
            var query = from sanPham in db.tblProducts
                        join giamGia in db.tblDiscounts
                        on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where sanPham.FK_sCategoryProductID == MaLoai
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