using people_data.Context;
using people_data.Repositories;
using people_data.Repositories.EducationsRepository;
using people_data.Repositories.JobsRepository;
using people_data.Repositories.PeopleRepository;

namespace people_data.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly PeopleAppDBContext context;

        public IPeopleRepository People { get; private set; }
        public IJobsRepository Jobs { get; private set; } 
        public IEducationsRepository EducationStatuses { get; private set; }

        public UnitOfWork(PeopleAppDBContext context)
        {
            this.context = context;

            People = new PeopleRepository(context);
            Jobs = new JobsRepository(context);
            EducationStatuses = new EducationsRepository(context);
        }

        public int Complete()
        {
           return context.SaveChanges();
        }
    }
}
