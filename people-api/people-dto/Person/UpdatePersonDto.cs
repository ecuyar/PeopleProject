using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace people_dto.Person
{
    public class UpdatePersonDto
    {
        public int id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string email { get; set; }
        public DateTime birthdate { get; set; }
        public int job { get; set; }
        public int education_status { get; set; }
    }
    public class UpdatePersonDtoValidation : AbstractValidator<UpdatePersonDto>
    {
        public UpdatePersonDtoValidation()
        {
            RuleFor(x => x.id).NotEmpty();
            RuleFor(x => x.first_name).NotEmpty();
            RuleFor(x => x.last_name).NotEmpty();
            RuleFor(x => x.job).NotEmpty();
            RuleFor(x => x.education_status).NotEmpty();
            RuleFor(x => x.email).EmailAddress();
            RuleFor(x => x.birthdate).NotEmpty();
        }
    }
}
