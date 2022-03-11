using AutoMapper;
using people_data;
using people_dto;
using people_dto.Person;
using System;

namespace people_business
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<Person, AddPersonDto>();
            CreateMap<AddPersonDto, Person>();

            CreateMap<Person, UpdatePersonDto>();
            CreateMap<UpdatePersonDto, Person>();
        }
    }
}
