using System;
using FluentValidation;

namespace people_dto
{
    public class AddPersonDto
    {
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string email { get; set; }
        public DateTime birthdate { get; set; }
        public int job { get; set; }
        public int education_status { get; set; }
    }

    public class AddPersonDtoValidation : AbstractValidator<AddPersonDto>
    {
        public AddPersonDtoValidation()
        {
            RuleFor(x => x.first_name).NotEmpty();
            RuleFor(x => x.last_name).NotEmpty();
            RuleFor(x => x.job).NotEmpty();
            RuleFor(x => x.education_status).NotEmpty();
            RuleFor(x => x.email).EmailAddress();
            RuleFor(x => x.birthdate).NotEmpty();
        }
    }
}
