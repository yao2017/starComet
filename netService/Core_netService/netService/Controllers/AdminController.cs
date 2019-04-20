using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace netService.Controllers
{
    //[Produces("application/json")]
    [Route("api/Admin")]
    [Authorize(Policy = "Admin")]
    public class AdminController : Controller
    {
        [HttpGet]
        [Route("docs")]
        public JsonResult GetList()
        {
            var examples = @"[{Id:'doc_001',Name:'C#从入门到精通'},{Id:'doc_002',Name:'C++从入门到精通'},,{Id:'doc_003',Name:'C从入门到精通'}]";
            JArray jsonObj = JArray.Parse(examples);
            return Json(jsonObj);
        }
    }
}