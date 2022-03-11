using people_data.Context;
using people_data.Repositories.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace people_data.Repositories.PeopleRepository
{
    public class PeopleRepository : GenericRepository<Person>, IPeopleRepository
    {
        public PeopleRepository(PeopleAppDBContext context) : base(context)
        {
        }
    }
}
