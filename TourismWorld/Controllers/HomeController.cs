using System.Linq;
using System.Web.Mvc;
using TourismWorld.Models;

namespace TourismWorld.Controllers
{
    public class HomeController : Controller
    {
        private tourismwebEntities entities = new tourismwebEntities();
        public ActionResult Index(int? id)
        {
            ViewBag.Country = entities.countries;
            if (id == null)
                id = 1;
            ViewBag.count = id;
            ViewBag.Hotels = from hotels in entities.hotels
                             join city in entities.cities on hotels.id_cities equals city.id
                             join country in entities.countries on city.id_country equals country.id
                             select new Class1 { id = hotels.id, hotel_name = hotels.hotel_name, img_src = hotels.img_src, rank = hotels.rank, cities_name = city.cities_name, country_name = country.country_name, cimg_src = country.img_src };
            return View();
        }
        public ActionResult Aboutcompany()
        {
            return View();
        }

        public ActionResult About(int id)
        {
          var a = from hotels in entities.hotels
                    join city in entities.cities on hotels.id_cities equals city.id
                    where hotels.id == id
                    join country in entities.countries on city.id_country equals country.id
                    select new Class1 { id = hotels.id, hotel_name = hotels.hotel_name, img_src = hotels.img_src, rank = hotels.rank, cities_name = city.cities_name, country_name = country.country_name, cimg_src = country.img_src };
            ViewBag.Hotels = a.FirstOrDefault();
            ViewBag.id = id;
            return View();
        }

        [HttpPost]
        public JsonResult CitySearch(string country)
        {
            var city = entities.cities.Join(entities.countries, a => a.id_country, b => b.id, (a, b) => new
            {
                Name = a.cities_name,
                country = b.country_name
            }).Where(a => a.country.Contains(country));
            return Json(city);
        }
        public ActionResult Wherebuy()
        {
            return View();
        }

        public ActionResult Signin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signin(string name,string password)
        {
            var Person=entities.people.Where(a => a.login.Contains(name)).Where(a => a.password.Contains(password));
            if (Person.Count() == 0)
            {
                return View();
            }
            return Redirect("/Home/Index/1");
        }

        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(string name, string password)
        {
            var Person = entities.people.Where(a => a.login.Contains(name));
            if (Person.Count() == 0)
            {
                entities.people.Add(new person() { login = name, password = password });
                entities.SaveChanges();
                return Redirect("/Home/Index/1");
            }
            return View();
        }

        public ActionResult Fortourists()
        {
            return View();
        }
    }
}