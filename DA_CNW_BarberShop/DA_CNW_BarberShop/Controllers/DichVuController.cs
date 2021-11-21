using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA_CNW_BarberShop.Models;

namespace DA_CNW_BarberShop.Controllers
{
    public class DichVuController : Controller
    {
        // GET: DichVu
        DBBarberShopDataContext db = new DBBarberShopDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult loadDichVu()
        {
            var query = db.tblServices.Take(4).ToList();
            return View(query);
        }
    }
}