using System;

namespace people_data
{
    public class Person
    {
        public int id { get; set; }
        public string first_name{ get; set; }
        public string last_name { get; set; }
        public string email { get; set; }
        public DateTime birthdate { get; set; }
        public int job { get; set; }
        public int education_status { get; set; }
    }
}
