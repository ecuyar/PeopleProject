using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using people_data;
using people_data.UnitOfWork;
using people_dto;
using people_dto.Person;
using System.Threading.Tasks;

namespace people_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeopleController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;

        public PeopleController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
        }

        [HttpGet("All")]
        public async Task<IActionResult> GetAllPeople()
        {
            var people = await unitOfWork.People.GetAll();
            return Ok(people);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetPerson(int id)
        {
            var person = await unitOfWork.People.GetById(id);

            if (person == null)
            {
                return NotFound();
            }

            var personDto = mapper.Map<UpdatePersonDto>(person);

            return Ok(personDto);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddPerson(AddPersonDto addPersonDto)
        {
            addPersonDto.first_name = addPersonDto.first_name.Trim();
            addPersonDto.last_name = addPersonDto.last_name.Trim();
            addPersonDto.email = addPersonDto.email.Trim();

            var person = mapper.Map<Person>(addPersonDto);

            var result = await unitOfWork.People.Add(person);

            if (result is null)
            {
                return BadRequest();
            }
            unitOfWork.Complete();

            return Ok(addPersonDto);
        }

        [HttpPost("Update")]
        public async Task<IActionResult> UpdatePerson(UpdatePersonDto updatePersonDto)
        {
            var existPerson = await unitOfWork.People.GetById(updatePersonDto.id);

            if (existPerson is null)
            {
                return BadRequest("Kullanıcı bulunamadı.");
            }

            existPerson.first_name = updatePersonDto.first_name.Trim();
            existPerson.last_name = updatePersonDto.last_name.Trim();
            existPerson.job = updatePersonDto.job;
            existPerson.email = updatePersonDto.email.Trim();
            existPerson.education_status = updatePersonDto.education_status;
            existPerson.birthdate = updatePersonDto.birthdate;

            var result = unitOfWork.People.Update(existPerson);

            if (!result)
            {
                return BadRequest();
            }
            unitOfWork.Complete();

            return Ok(updatePersonDto);
        }

        [HttpDelete]
        public async Task<IActionResult> DeletePerson(int id)
        {
            var person = await unitOfWork.People.GetById(id);

            if (person is null)
            {
                return BadRequest("Kullanıcı bulunamadı.");
            }

            unitOfWork.People.DeleteById(person.id);
            unitOfWork.Complete();

            return Ok("İşlem başarılı, kullanıcı silindi.");
        }
    }
}

