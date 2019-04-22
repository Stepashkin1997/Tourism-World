using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using TourismWorld.Models;

namespace TourismWorld.Controllers
{
    public class HomeController : Controller
    {
        private tourismwebEntities entities = new tourismwebEntities();
        private IQueryable<Class1> search;
        public ActionResult Index(int? id)
        {
            ViewBag.Countrys = entities.countries;
            if (id == null)
                id = 1;
            ViewBag.count = id;
            ViewBag.Method = "Index";
            search = from hotels in entities.hotels
                     join city in entities.cities on hotels.id_cities equals city.id
                     join country in entities.countries on city.id_country equals country.id
                     select new Class1 { id = hotels.id, hotel_name = hotels.hotel_name, img_src = hotels.img_src, rank = hotels.rank, cities_name = city.cities_name, country_name = country.country_name, cimg_src = country.img_src };
            ViewBag.Hotels = search;
            return View();
        }

        public ActionResult Search(string country, string city, int? star, int? id)
        {
            if (id == null)
            {
                id = 1;
            }
            search = (from hotels in entities.hotels
                      join cities in entities.cities on hotels.id_cities equals cities.id
                      join countries in entities.countries on cities.id_country equals countries.id
                      select new Class1 { id = hotels.id, hotel_name = hotels.hotel_name, img_src = hotels.img_src, rank = hotels.rank, cities_name = cities.cities_name, country_name = countries.country_name, cimg_src = countries.img_src });
            if (country != "All")
            {
                search = search.Where(a => a.country_name.Contains(country));
            }
            if (city != "All")
            {
                search = search.Where(a => a.cities_name.Contains(city));
            }
            if (star != -1)
            {
                search = search.Where(a => a.rank == star);
            }

            ViewData["country"] = country;
            ViewData["city"] = city;
            ViewData["star"] = star;
            ViewBag.Hotels = search;
            ViewBag.Countrys = entities.countries;
            ViewBag.count = id;
            ViewBag.Method = "Search";
            return View("Index");
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
        public ActionResult Signin(string name, string password)
        {
            var Person = entities.people.Where(a => a.login.Contains(name) && a.password.Contains(password));
            if (Person.Count() == 0)
            {
                return View();
            }
            AddCookies(name);
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
                AddCookies(name);
                return Redirect("/Home/Index/1");
            }
            return View();
        }

        public ActionResult Fortourists()
        {
            return View();
        }

        public ActionResult Order(int id)
        {
            if (Request.Cookies["name"] == null)
                return Redirect("/Home/Signin");
            else
            {
                var list = (List<int>)Session["order"];
                if (list == null)
                {
                    list = new List<int>();
                }
                list.Add(id);
                Session["order"] = list;
                return Redirect("/Home/Index/1");
            }
        }
        public ActionResult Shop()
        {
            List<int> id = (List<int>)Session["order"];
            if (id == null)
            {
                id = new List<int>();
                id.Add(-1);
            }
            var Hotel = entities.hotels.Where(a => id.Contains(a.id));
            ViewBag.Hotel = Hotel;
            return View();
        }
        [HttpPost]
        public ActionResult Shop(int id)
        {
            var idperson = Request.Cookies["name"].Value;
            int person = entities.people.Where(a => a.login.Contains(idperson)).Select(b => b.id).FirstOrDefault();
            entities.purchases.Add(new purchase() { hotel = id, date = System.DateTime.Now, id_person = person });
            entities.SaveChanges();
            List<int> ids = (List<int>)Session["order"];
            ids.Remove(id);
            return Redirect("/Home/Shop");
        }
        public ActionResult Person(string id)
        {
            return View(entities);
        }
        private void AddCookies(string name)
        {
            Response.Cookies["name"].Value = name;
            Response.Cookies["name"].Expires = System.DateTime.Now.AddHours(3);
        }
    }
}