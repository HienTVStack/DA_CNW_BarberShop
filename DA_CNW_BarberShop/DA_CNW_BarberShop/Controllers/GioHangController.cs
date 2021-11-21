using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_CNW_BarberShop.Models;

namespace DA_CNW_BarberShop.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        DBBarberShopDataContext db = new DBBarberShopDataContext();
        public ActionResult Index()
        {
            return View();
        }
        // Đếm số lượng sản phẩm có trong giỏ hàng
        public int CountSPInGioHang(int MaKH)
        {
            var query = from gioHang in db.tblCarts
                        join chiTietGH in db.tblCartDetails
                        on gioHang.PK_iCartID equals chiTietGH.FK_iCartID
                        where gioHang.FK_iCustomID == MaKH
                        select new { chiTietGH.FK_iProductID };
            return query.Count();
        }
        //public int MaGioHang(int MaKH)
        //{
        //    return Convert.ToInt32(db.tblCarts.Where(c => c.FK_iCustomID == MaKH).FirstOrDefault().PK_iCartID.ToString());
        //}
        public ActionResult GioHang()
        {
            int MaKhachHang = 1;
            if (Session["DangNhap"] != null)
            {
                MaKhachHang = LayMaKhachHang(Session["DangNhap"].ToString());
            }
            else
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var query = from gioHang in db.tblCarts
                        join chiTietGioHang in db.tblCartDetails
                        on gioHang.PK_iCartID equals chiTietGioHang.FK_iCartID
                        join sanPham in db.tblProducts on chiTietGioHang.FK_iProductID equals sanPham.PK_iProductID
                        join giamGia in db.tblDiscounts on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where gioHang.FK_iCustomID == MaKhachHang
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
            ViewBag.SoLuong = query.Count();
            ViewBag.TongTien = TongTien();
            ViewBag.ThanhToan = TongTien() + 17000;
            return View(query.ToList());
        }
        public ActionResult ThemGioHang(int MaSanPham, string strUrl)
        {
            int MaKhachHang = 1;
            if (Session["DangNhap"] != null)
            {
                MaKhachHang = LayMaKhachHang(Session["DangNhap"].ToString());
            }
            else
            {
                Session["isXemChiTiet"] = MaSanPham;
                Session["DangNhap"] = null;
                return RedirectToAction("DangNhap", "Home");
            }
            if (CountSPInGioHang(MaKhachHang) == 0)
            {
                tblCart gioHang = new tblCart();
                gioHang.FK_iCustomID = MaKhachHang;
                db.tblCarts.InsertOnSubmit(gioHang);
                db.SubmitChanges();
            }
            ViewBag.MaGioHang = db.tblCarts.Where(c => c.FK_iCustomID == MaKhachHang).FirstOrDefault().PK_iCartID;
            tblCartDetail chiTietGH = new tblCartDetail();
            chiTietGH.FK_iCartID = ViewBag.MaGioHang;
            chiTietGH.FK_iProductID = MaSanPham;
            chiTietGH.dDateAddCart = DateTime.Now;
            chiTietGH.iQuantity = 1;
            db.tblCartDetails.InsertOnSubmit(chiTietGH);
            db.SubmitChanges();
            return Redirect(strUrl);
        }
        public ActionResult GioHangPartial()
        {
            int MaKhachHang = 1;
            if (Session["DangNhap"] != null)
            {
                MaKhachHang = LayMaKhachHang(Session["DangNhap"].ToString());
            }
            else MaKhachHang = 0;
            var query = from gioHang in db.tblCarts
                        join chiTietGioHang in db.tblCartDetails
                        on gioHang.PK_iCartID equals chiTietGioHang.FK_iCartID
                        join sanPham in db.tblProducts on chiTietGioHang.FK_iProductID equals sanPham.PK_iProductID
                        join giamGia in db.tblDiscounts on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where gioHang.FK_iCustomID == MaKhachHang
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
            ViewBag.SoLuong = query.Count();
            return View(query.ToList());
        }
        public double TongTien()
        {
            double sum = 0;
            int MaKhachHang = 1;
            if (Session["DangNhap"] != null)
            {
                MaKhachHang = LayMaKhachHang(Session["DangNhap"].ToString());
            }
            var query = from gioHang in db.tblCarts
                        join chiTietGioHang in db.tblCartDetails
                        on gioHang.PK_iCartID equals chiTietGioHang.FK_iCartID
                        join sanPham in db.tblProducts on chiTietGioHang.FK_iProductID equals sanPham.PK_iProductID
                        join giamGia in db.tblDiscounts on sanPham.FK_sDiscountID equals giamGia.PK_sDiscountID
                        where gioHang.FK_iCustomID == MaKhachHang
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

            if (CountSPInGioHang(MaKhachHang) != 0)
            {
                sum += query.Sum(s => s.GiaSanPham);
            }
            return sum;
        }
        public int LayMaKhachHang(string tenKhachHang)
        {
            return db.tblCustomers.Where(kh => kh.sNameCustomer == tenKhachHang).FirstOrDefault().PK_iCustomerID;
        }
        public int LayMaGioHang(int MaKhacHang)
        {
            return db.tblCarts.Where(c => c.FK_iCustomID == MaKhacHang).FirstOrDefault().PK_iCartID;
        }
        public ActionResult ThanhToan()
        {
            tblReceipt hoaDon = new tblReceipt();
            hoaDon.FK_iCustomID = LayMaKhachHang(Session["DangNhap"].ToString());
            hoaDon.dTimeCreate = DateTime.Now;
            db.tblReceipts.InsertOnSubmit(hoaDon);

            xoaTatCaChiTietGioHang(LayMaGioHang(LayMaKhachHang(Session["DangNhap"].ToString())));
            db.SubmitChanges();
            return RedirectToAction("DanhSachSanPham", "SanPham");
        }
        public void xoaTatCaChiTietGioHang(int MaGioHang)
        {
            var query = from c in db.tblCartDetails
                        where c.FK_iCartID == MaGioHang
                        select c;
            db.tblCartDetails.DeleteAllOnSubmit(query);
            db.SubmitChanges();
        }
        public ActionResult xoaMotSanPhamTrongGioHang(int MaSanPham, int isCheck)
        {
            var query = from c in db.tblCartDetails
                        where c.FK_iProductID == MaSanPham
                        where c.FK_iCartID == LayMaGioHang(LayMaKhachHang(Session["DangNhap"].ToString()))
                        select c;
            db.tblCartDetails.DeleteAllOnSubmit(query);
            db.SubmitChanges();
            if(isCheck == 1)
            {
                return RedirectToAction("GioHang", "GioHang");
            }
            else return RedirectToAction("DanhSachSanPham", "SanPham");
        }
    }
}