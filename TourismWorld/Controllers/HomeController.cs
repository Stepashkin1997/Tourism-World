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
            //ViewBag.Hotels = entities.hotels;
            ViewBag.Country = entities.countries;
            ViewBag.Hotels = from hotels in entities.hotels
                             join city in entities.cities on hotels.id_cities equals city.id join country in entities.countries on city.id_country equals country.id
                             select new Class1{ id=hotels.id, hotel_name=hotels.hotel_name, img_src=hotels.img_src, rank= hotels.rank, cities_name=city.cities_name, country_name=country.country_name, cimg_src=country.img_src };
           
            //ViewBag.Hotels = entities.hotels;
            return View();
        }

        public ActionResult About(int id)
        {
            ViewBag.id = id;
            return View();
        }
    }
}