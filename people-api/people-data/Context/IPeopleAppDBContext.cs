using Microsoft.EntityFrameworkCore;
using people_data.DataModels;

namespace people_data.Context
{
    public interface IPeopleAppDBContext
    {
        DbSet<Person> People { get; set; }
        DbSet<Job> Jobs { get; set; }
        DbSet<EducationStatus> EducationStatuses { get; set; }
    }
}
