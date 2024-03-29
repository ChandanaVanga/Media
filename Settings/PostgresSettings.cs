namespace Media.Settings;

public class PostgresSettings
{
    //  "Host": "localhost",
    //   "Port": 5432,
    //   "Username": "dotsql_admin",
    //   "Password": "password",
    //   "Database": "dotsql"

    public string Host { get; set; }
    public int Port { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public string Database { get; set; }
    public string ConnectionString { get => $"Host={Host};Port={Port};Username={Username};Password={Password};Database={Database};Include Error Detail=true"; }
}