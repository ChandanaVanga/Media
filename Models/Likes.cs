 using Media.DTOs;

namespace Media.Models;


public record Likes
{
    /// <summary>
    /// Primary Key - NOT NULL, Unique, Index is Available
    /// </summary>
    public long LikeId { get; set; }
    public string PostId { get; set; }


    public LikesDTO asDto => new LikesDTO
    {
        LikeId = LikeId,
        PostId = PostId,
         
    };
}