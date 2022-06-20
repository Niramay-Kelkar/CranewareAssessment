using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using WebApplication2.Controllers;
using System.Data;
using System.Data.SqlClient;
using WebApplication2;

namespace EmployeeInfo.Tests;

public class EmployeeControllerTests
{
    private readonly ILogger<EmployeeDetails> logger;
    private readonly IConfiguration iConfig;
    SqlConnection connection = new SqlConnection();
    string connectionString = "Server=localhost;Database=Craneware;User Id=sa;Password=P@ss2022!;";


    [SetUp]
    public void Setup()
    {
    }

    [Test]
    public void CheckDBConnection()
    {
        connection.ConnectionString = connectionString;
        connection.Open();
        NUnit.Framework.Assert.That(connection.State == ConnectionState.Open);
        connection.Close();
    }

    [Test]
    public void GetEmployeeInformation()
    {
        SqlConnection connection = new SqlConnection();
        
        
        //var employee = new List<Employee>();
        connection.ConnectionString = connectionString;
        connection.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        var controller = new EmployeeDetails(iConfig, logger);
        command.CommandText = "Select * from employees " +
                    "inner join employeecontact on employeecontact.employee_id = " + 3 +
                    "where employees.employee_id = " + 3;
        SqlDataReader reader = command.ExecuteReader();


        Assert.That(reader, Is.Not.Empty);
        connection.Close();
    }
}
