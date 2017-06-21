using Mindlance.CORE.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mindlance.CORE.IPopulation
{
     interface IPopulation
    {
        IEnumerable<CPS> GetPopulation();
        IEnumerable<CPS> GetPupulationByCity(string city);
        void UpdateCPS(int pop, string zipId);

    }
}
