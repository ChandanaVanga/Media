using System.Data;
using Media.Settings;
using Npgsql;
//using Dapper;

namespace Media.Repositories;

public class BaseRepository
{
    private readonly IConfiguration _configuration;
    public BaseRepository(IConfiguration configuration)
    {
        Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
        _configuration = configuration;
    }

    // new NpgsqlConnection("Host={Host};Port={Port};Username={Username};Password={Password};Database={Database};Include Error Detail=true");
    public NpgsqlConnection NewConnection => new NpgsqlConnection(_configuration
        .GetSection(nameof(PostgresSettings)).Get<PostgresSettings>().ConnectionString);
}