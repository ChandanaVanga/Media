using Media.DTOs;
using Media.Models;
using Media.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Media.Controllers;

[ApiController]
[Route("api/likes")]
public class LikesController : ControllerBase
{
    private readonly ILogger<LikesController> _logger;
    private readonly ILikesRepository _likes;
   // private readonly IOrdersRepository _orders;

    public LikesController(ILogger<LikesController> logger,
    ILikesRepository likes)
    {
        _logger = logger;
        _likes = likes;
      // _orders = orders;
    }

   

    [HttpPost]
    public async Task<ActionResult<LikesDTO>> CreateLikes([FromBody] LikesCreateDTO Data)
    {
        // var customer = await _customer.GetById(Data.CustomerId);
        // if (customer is null)
        //     return NotFound("No customer found with given customer id");

        var toCreateLikes = new Likes
        {
            LikeId = Data.LikeId,

        };

        var createdLikes = await _likes.Create(toCreateLikes);

        return StatusCode(StatusCodes.Status201Created, createdLikes.asDto);
    }

   

    [HttpDelete("{like_id}")]
    public async Task<ActionResult> DeleteLikes([FromRoute] long like_id)
    {
        var existing = await _likes.GetById(like_id);
        if (existing is null)
            return NotFound("No like found with given like id");

        var didDelete = await _likes.Delete(like_id);

        return NoContent();
    }
}