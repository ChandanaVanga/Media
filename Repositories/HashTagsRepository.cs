using Media.Models;
using Dapper;
using Media.Utilities;
using Media.Repositories;


namespace Media.Repositories;

public interface IHashTagsRepository
{
    Task<HashTags> Create(HashTags Item);
 //  Task <bool> Update(Posts Item);
    Task<bool> Delete(long HashId);
    Task<HashTags> GetById(long HashId);
    //Task<List<Posts>> GetList();

}
public class HashTagsRepository : BaseRepository, IHashTagsRepository
{
    public HashTagsRepository(IConfiguration config) : base(config)
    {

    }

    public async Task<HashTags> Create(HashTags Item)
    {
       var query = $@"INSERT INTO ""{TableNames.hash_tags}"" 
        (hash_id, hash_name) 
        VALUES (@HashId, @HashName) 
        RETURNING *";

        using (var con = NewConnection)
        {
            var res = await con.QuerySingleOrDefaultAsync<HashTags>(query, Item);
            return res;
        }
    }

    public async Task<bool> Delete(long HashId)
    {
       var query = $@"DELETE FROM ""{TableNames.hash_tags}"" 
        WHERE hash_id = @HashId";

        using (var con = NewConnection)
        {
            var res = await con.ExecuteAsync(query, new { HashId });
            return res > 0;
        }
    }


    public async Task<HashTags> GetById(long HashId)
    {
        var query = $@"SELECT * FROM ""{TableNames.hash_tags}"" 
        WHERE hash_id = @HashId";
        // SQL-Injection

        using (var con = NewConnection)
            return await con.QuerySingleOrDefaultAsync<HashTags>(query, new { HashId });
    }
}