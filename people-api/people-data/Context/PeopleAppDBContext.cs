using Microsoft.EntityFrameworkCore;
using people_data.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace people_data.Context
{
    public class PeopleAppDBContext : DbContext, IPeopleAppDBContext
    {
        public PeopleAppDBContext(DbContextOptions<PeopleAppDBContext> options) : base(options)
        {
        }

        public DbSet<Person> People { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<EducationStatus> EducationStatuses { get; set; }
    }
}
