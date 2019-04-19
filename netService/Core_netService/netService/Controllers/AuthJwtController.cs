using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace netService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthJwtController : ControllerBase
    {
        //[HttpPost]
        //public async Task<RestfulData<AccessTokenObj>> Token(string user, string password)
        //{
        //    var result = new RestfulData<AccessTokenObj>();
        //    try
        //    {
        //        if (string.IsNullOrEmpty(user)) throw new ArgumentNullException("user", "用户名不能为空！");
        //        if (string.IsNullOrEmpty(password)) throw new ArgumentNullException("password", "密码不能为空！");

        //        //验证用户名和密码
        //        var userInfo = await _UserService.CheckUserAndPassword(mobile: user, password: password);
        //        var claims = new Claim[]
        //        {
        //    new Claim(ClaimTypes.Name,user),
        //    new Claim(ClaimTypes.NameIdentifier,userInfo.Id.ToString()),
        //        };

        //        var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(Configuration["JwtSecurityKey"]));
        //        var expires = DateTime.Now.AddDays(28);//
        //        var token = new JwtSecurityToken(
        //                    issuer: Configuration["issuer"],
        //                    audience: Configuration["audience"],
        //                    claims: claims,
        //                    notBefore: DateTime.Now,
        //                    expires: expires,
        //                    signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256));

        //        //生成Token
        //        string jwtToken = new JwtSecurityTokenHandler().WriteToken(token);
        //        result.code = 1;
        //        result.data = new AccessTokenObj() { AccessToken = jwtToken, Expires =ToUnixTime(expires) };
        //        result.message = "授权成功！";
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.message = ex.Message;
        //        result.code = 0;
        //        logger.Error("获取访问令牌时发生错误！", ex);
        //        return result;
        //    }
        //}
    }
}