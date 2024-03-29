using Media.Models;
using Dapper;
using Media.Utilities;
using Media.Repositories;


namespace Media.Repositories;

public interface IUsersRepository
{
    Task<Users> Create(Users Item);
    Task<bool> Update(Users Item);
    // Task<bool> Delete(long EmployeeNumber);
    Task<Users> GetById(long UserId);
    Task<List<Users>> GetList();

}
public class UsersRepository : BaseRepository, IUsersRepository
{
    public UsersRepository(IConfiguration config) : base(config)
    {

    }

    public async Task<Users> Create(Users Item)
    {
        var query = $@"INSERT INTO ""{TableNames.users}"" 
        (user_id, user_name, mobile) 
        VALUES (@UserId, @UserName, @Mobile) 
        RETURNING *";

        using (var con = NewConnection)
        {
            var res = await con.QuerySingleOrDefaultAsync<Users>(query, Item);
            return res;
        }
    }
    
    public async Task<bool> Update(Users Item)
    {
       var query = $@"UPDATE ""{TableNames.users}"" SET  
        user_name = @UserName, mobile = @Mobile WHERE user_id = @UserId";

        using (var con = NewConnection)
        {
            var rowCount = await con.ExecuteAsync(query, Item);
            return rowCount == 1;
        }
    }

    public async Task<Users> GetById(long UserId)
    {
        var query = $@"SELECT * FROM ""{TableNames.users}"" 
        WHERE user_id = @userId";
        // SQL-Injection

        using (var con = NewConnection)
            return await con.QuerySingleOrDefaultAsync<Users>(query, new { UserId });
    }

    public async Task<List<Users>> GetList()
    {
        // Query
        var query = $@"SELECT * FROM ""{TableNames.users}""";

        List<Users> res;
        using (var con = NewConnection) // Open connection
            res = (await con.QueryAsync<Users>(query)).AsList(); // Execute the query
        // Close the connection

        // Return the result
        return res;
    }
}