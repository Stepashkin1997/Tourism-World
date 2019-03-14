using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TourismWorld.Models;

namespace TourismWorld.Controllers
{
    public class HomeController : Controller
    {
        tourismwebEntities entities = new tourismwebEntities();
        public ActionResult Index()
        {
            var Hotels = entities.hotels;
            var Contries = entities.countries;
            ViewBag.Hotels = Hotels;
            ViewBag.Country = Contries;
            return View();
        }

        public ActionResult About(int id)
        {
            ViewBag.id = id;
            return View();
        }
    }
}