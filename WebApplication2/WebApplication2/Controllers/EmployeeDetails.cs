using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeDetails : ControllerBase
    {
        private IConfiguration _configuration;
        private readonly ILogger<EmployeeDetails> _logger;
        public EmployeeDetails(IConfiguration iConfig, ILogger<EmployeeDetails> logger)
        {
            _configuration = iConfig;
            _logger = logger;
        }

        [HttpGet(Name = "GetAllEmployee")]
        public IEnumerable<Employee> Get() 
        {
            List<Employee> employeeList = new List<Employee>();

            string connectionString = _configuration.GetConnectionString("Default");
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create the command and set its properties.
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "Select * from employees";


                // Add the parameter to the Parameters collection.
                //command.Parameters.Add(parameter);

                // Open the connection and execute the reader.
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Employee emp = new Employee();
                            emp.Id = Convert.ToInt32(reader[0]);
                            emp.FirstName = reader[1].ToString();
                            emp.LastName = reader[2].ToString();
                            emp.Email = reader[3].ToString();
                            emp.HireDate = reader[4].ToString();
                            emp.Salary = Convert.ToInt32(reader[5]);

                            employeeList.Add(emp);
                        }                    
                    }
                    else
                    {
                        Console.WriteLine("No rows found.");
                    }
                    reader.Close();
                }
            }

            return employeeList;

        }
    }
}
