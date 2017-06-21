using Mindlance.CORE.Entities;
using Mindlance.CORE.Population;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace Mindlance.WebAPI.Controllers
{
    public class CityPopulationController : ApiController
    {
        // GET: api/CityPopulation
        Population objPopulation = new Population();

        [HttpGet]
        public HttpResponseMessage GetPopulation()
        {
            IEnumerable<CPS> lstPopulation = objPopulation.GetPopulation();

            return new HttpResponseMessage()
            {
                Content = new StringContent(JArray.FromObject(lstPopulation).ToString(), Encoding.UTF8, "application/json")
            };

        }

        [HttpGet]
        //api/CityPopulation/5
        public HttpResponseMessage GetPopulation(string id)
        {
            IEnumerable<CPS> lstPopulation = objPopulation.GetPupulationByCity(id);

            return new HttpResponseMessage()
            {
                Content = new StringContent(JArray.FromObject(lstPopulation).ToString(), Encoding.UTF8, "application/json")
            };
        }

        // POST: api/CityPopulation
        [HttpPost]
        public void Post(CPS data)
        {
            objPopulation.UpdateCPS(data.pop, data._id);
        }

        // PUT: api/CityPopulation/5
        public void Put(int id, [FromBody]string value)
        {
            objPopulation.UpdateCPS(id, value);
        }

    }
}
