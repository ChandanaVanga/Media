 using Media.DTOs;

namespace Media.Models;


public record HashTags
{
    /// <summary>
    /// Primary Key - NOT NULL, Unique, Index is Available
    /// </summary>
    public long HashId { get; set; }
    public string HashName { get; set; }


    public HashTagsDTO asDto => new HashTagsDTO
    {
        HashId = HashId,
        HashName = HashName,
         
    };
}