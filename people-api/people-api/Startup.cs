using AutoMapper;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using people_business;
using people_data.Context;
using people_data.UnitOfWork;
using people_dto;
using people_dto.Person;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace people_api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //cors
            services.AddCors(opt => opt.AddPolicy("Cors", builder =>
            {
                builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
            }));

            //connection to database
            var connectionString = Configuration.GetConnectionString("PeopleAppDb");
            services.AddDbContext<PeopleAppDBContext>(options => options.UseSqlServer(connectionString));

            //unitofwork
            services.AddScoped<IUnitOfWork, UnitOfWork>();

            //automapper
            var config = new MapperConfiguration(cfg => cfg.AddProfile(new MappingProfiles()));
            services.AddSingleton(config.CreateMapper());

            services.AddControllers();

            //fluentvalidator
            services.AddMvc().AddFluentValidation();

            //validations
            //person
            services.AddTransient<IValidator<AddPersonDto>, AddPersonDtoValidation>();
            services.AddTransient<IValidator<UpdatePersonDto>, UpdatePersonDtoValidation>();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "people_api", Version = "v1" });
            });


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //cors enable
            app.UseCors("Cors");

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "people_api v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
