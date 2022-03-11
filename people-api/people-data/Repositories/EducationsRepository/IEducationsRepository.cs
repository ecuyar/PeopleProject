using people_data.DataModels;
using people_data.Repositories.GenericRepository;

namespace people_data.Repositories.EducationsRepository
{
    public interface IEducationsRepository : IGenericRepository<EducationStatus>
    {
    }
}
