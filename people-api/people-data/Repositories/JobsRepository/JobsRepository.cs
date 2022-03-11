using people_data.Context;
using people_data.DataModels;
using people_data.Repositories.GenericRepository;

namespace people_data.Repositories.JobsRepository
{
    public class JobsRepository : GenericRepository<Job>, IJobsRepository
    {
        public JobsRepository(PeopleAppDBContext context) : base(context)
        {
        }
    }
}
