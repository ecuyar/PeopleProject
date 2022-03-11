using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using people_data.UnitOfWork;
using System.Threading.Tasks;

namespace people_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobsController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        public JobsController(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        [HttpGet]
        public async Task<IActionResult> GetJobs()
        {
            var jobs = await unitOfWork.Jobs.GetAll();

            return Ok(jobs);
        }
    }
}
