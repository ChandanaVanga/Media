using Media.Models;
using Dapper;
using Media.Utilities;
using Media.Repositories;


namespace Media.Repositories;

public interface IPostsRepository
{
    Task<Posts> Create(Posts Item);
 //  Task <bool> Update(Posts Item);
    Task<bool> Delete(long PostId);
    Task<Posts> GetById(long PostId);
    Task<List<Posts>> GetList();

    Task<List<Posts>> GetListByUserId(long UserId);
    Task<List<Posts>> GetListByHashTagsId(long HashId);
    

}
public class PostsRepository : BaseRepository, IPostsRepository
{
    public PostsRepository(IConfiguration config) : base(config)
    {

    }

    public async Task<Posts> Create(Posts Item)
    {
        var query = $@"INSERT INTO ""{TableNames.posts}"" 
        (post_id, post_type) 
        VALUES (@PostId, @PostType) 
        RETURNING *";

        using (var con = NewConnection)
        {
            var res = await con.QuerySingleOrDefaultAsync<Posts>(query, Item);
            return res;
        }
    }

    public async Task<bool> Delete(long PostId)
    {
       var query = $@"DELETE FROM ""{TableNames.posts}"" 
        WHERE post_id = @PostId";

        using (var con = NewConnection)
        {
            var res = await con.ExecuteAsync(query, new { PostId });
            return res > 0;
        }
    }


    public async Task<Posts> GetById(long PostId)
    {
       var query = $@"SELECT * FROM ""{TableNames.posts}"" 
        WHERE post_id = @PostId";
        // SQL-Injection

        using (var con = NewConnection)
            return await con.QuerySingleOrDefaultAsync<Posts>(query, new { PostId });
    }

    public async Task<List<Posts>> GetList()
    {
        var query = $@"SELECT * FROM ""{TableNames.posts}""";

        List<Posts> res;
        using (var con = NewConnection) // Open connection
            res = (await con.QueryAsync<Posts>(query)).AsList(); // Execute the query
        // Close the connection

        // Return the result
        return res;
    }

    public async Task<List<Posts>> GetListByHashTagsId(long HashId)
      {
        var query = $@"SELECT * FROM  ""{TableNames.post_hash}"" ph LEFT JOIN ""{TableNames.posts}"" p 
	ON ph.post_id = p.post_id
	WHERE hash_id = @HashId";

       using(var con = NewConnection){
           var res = (await con.QueryAsync<Posts>(query, new {HashId})).AsList();
           return res;
      }
    }

    public async Task<List<Posts>> GetListByUserId(long PostId)
    {
       
       var query = $@"SELECT * FROM ""{TableNames.posts}""
       
       WHERE user_id = @UserId";

       using(var con = NewConnection){
           var res = (await con.QueryAsync<Posts>(query, new {PostId})).AsList();
           return res;
       }
    }

}