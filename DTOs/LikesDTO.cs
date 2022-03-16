using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Media.Models;

namespace Media.DTOs;

public record LikesDTO
{
    [JsonPropertyName("like_id")]
    public long LikeId { get; set; }

    [JsonPropertyName("post_id")]
    public string PostId { get; set; }


}

public record LikesCreateDTO
{
    [JsonPropertyName("like_id")]
    public long LikeId { get; set; }

    [JsonPropertyName("post_id")]
    public string PostId { get; set; }



}

// public record PostsUpdateDTO
// {
//     [JsonPropertyName("post_id")]
//     public long PostId { get; set; }

//     [JsonPropertyName("post_type")]
//     public string PostType { get; set; }

// }