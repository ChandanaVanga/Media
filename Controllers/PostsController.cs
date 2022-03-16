using Media.DTOs;
using Media.Models;
using Media.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Media.Controllers;

[ApiController]
[Route("api/posts")]
public class PostsController : ControllerBase
{
    private readonly ILogger<PostsController> _logger;
    private readonly IPostsRepository _posts;
   // private readonly IOrdersRepository _orders;

    public PostsController(ILogger<PostsController> logger,
    IPostsRepository posts)
    {
        _logger = logger;
        _posts = posts;
      // _orders = orders;
    }

    [HttpGet]
    public async Task<ActionResult<List<PostsDTO>>> GetList()
    {
        var postsList = await _posts.GetList();

        // User -> UserDTO
        var dtoList = postsList.Select(x => x.asDto);

        return Ok(dtoList);
    }

    [HttpGet("{post_id}")]
    public async Task<ActionResult<PostsDTO>> GetById([FromRoute] long post_id)
    {
        var posts = await _posts.GetById(post_id);

        if (posts is null)
            return NotFound("No post found with given post id");

        // var dto = posts.asDto;

        // dto.MyOrders = (await _orders.GetListByCustomerId(customer_id)).Select(x => x.asDto).ToList();

        return Ok(posts);
    }

    [HttpPost]
    public async Task<ActionResult<PostsDTO>> CreatePosts([FromBody] PostsCreateDTO Data)
    {
        // var customer = await _customer.GetById(Data.CustomerId);
        // if (customer is null)
        //     return NotFound("No customer found with given customer id");

        var toCreatePosts = new Posts
        {
            PostType = Data.PostType.Trim(),

        };

        var createdPosts = await _posts.Create(toCreatePosts);

        return StatusCode(StatusCodes.Status201Created, createdPosts.asDto);
    }

    // [HttpPut("{customer_id}")]
    // public async Task<ActionResult> UpdateCustomer([FromRoute] long customer_id,
    // [FromBody] CustomerUpdateDTO Data)
    // {
    //     var existing = await _customer.GetById(customer_id);
    //     if (existing is null)
    //         return NotFound("No customer found with given customer id");

    //     var toUpdateCustomer = existing with
    //     {
    //         CustomerName = Data.CustomerName?.Trim()?.ToLower() ?? existing.CustomerName,
    //         Gender = existing.Gender,
    //         MobileNumber = existing.MobileNumber,
    //         Address = existing.Address,
    //     };

    //     var didUpdate = await _customer.Update(toUpdateCustomer);

    //     if (!didUpdate)
    //         return StatusCode(StatusCodes.Status500InternalServerError, "Could not update customer");

    //     return NoContent();
    // }

    [HttpDelete("{post_id}")]
    public async Task<ActionResult> DeletePosts([FromRoute] long post_id)
    {
        var existing = await _posts.GetById(post_id);
        if (existing is null)
            return NotFound("No post found with given post number");

        var didDelete = await _posts.Delete(post_id);

        return NoContent();
    }
}