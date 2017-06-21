using Mindlance.CORE.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace Mindlance.CORE.Population
{
    public class Population : IPopulation.IPopulation
    {
        public IEnumerable<CPS> GetPopulation()
        {
            #region Read JSON File
            
            string file =  Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Model", "PopulationData.json");
            var json = File.ReadAllText(file);

            #endregion            

            JavaScriptSerializer ser = new JavaScriptSerializer();
            ser.MaxJsonLength = Int32.MaxValue;
            return ser.Deserialize<List<CPS>>(json);

            
        }
        public IEnumerable<CPS> GetPupulationByCity(string city)
        {
            IEnumerable<CPS> lstPopulation = GetPopulation();
            lstPopulation = lstPopulation.Where(s => s.city.Equals(city)).ToList();

            return lstPopulation;
        }
        public void UpdateCPS(int pop,string zipId)
        {
            try
            {
                IEnumerable<CPS> lstPopulation = GetPopulation();
                lstPopulation.Where(s => s._id.Equals(zipId)).First().pop = pop;               
                string output = Newtonsoft.Json.JsonConvert.SerializeObject(lstPopulation, Newtonsoft.Json.Formatting.Indented);
                string file = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Model", "PopulationData.json");
                File.WriteAllText(file, output);                
            }
            catch(Exception ex)
            {                
                //"Error Occured in Update City Population State";
            }
        }
    }
}
