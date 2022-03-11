using people_data.Context;
using people_data.DataModels;
using people_data.Repositories.GenericRepository;

namespace people_data.Repositories.EducationsRepository
{
    public class EducationsRepository : GenericRepository<EducationStatus>, IEducationsRepository
    {
        public EducationsRepository(PeopleAppDBContext context) : base(context)
        {
        }
    }
}
