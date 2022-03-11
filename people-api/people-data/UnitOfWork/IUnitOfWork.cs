using people_data.Repositories;
using people_data.Repositories.EducationsRepository;
using people_data.Repositories.JobsRepository;

namespace people_data.UnitOfWork
{
    public interface IUnitOfWork
    {
        IPeopleRepository People { get; }
        IJobsRepository Jobs { get; }
        IEducationsRepository EducationStatuses { get; } 

        int Complete();
    }
}
