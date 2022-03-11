using people_data.Repositories.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace people_data.Repositories
{
    public interface IPeopleRepository : IGenericRepository<Person>
    {
    }
}
