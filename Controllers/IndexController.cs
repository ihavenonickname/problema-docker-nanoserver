using Microsoft.AspNetCore.Mvc;

namespace TesteDocker.Controllers;

[ApiController]
[Route("[controller]")]
public class IndexController : ControllerBase
{
    private readonly ILogger<IndexController> _logger;

    public IndexController(ILogger<IndexController> logger)
    {
        _logger = logger;
    }

    [HttpGet()]
    public IActionResult Get()
    {
        _logger.LogInformation("Requisição chegou na controller");

        return Ok(new
        {
            Sucesso = true
        });
    }
}
