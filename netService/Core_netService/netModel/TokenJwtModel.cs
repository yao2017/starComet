using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;

namespace netModel
{
    public class TokenJwtModel
    {
        public TokenJwtModel()
        {
        }

        /// <summary>
        /// 获取JWT字符串并存入缓存
        /// </summary>
        /// <param name="expireSliding">滑动时长</param>
        /// <param name="expireAbsoulte">绝对时长</param>
        /// <returns></returns>
        public static string IssueJWT(TokenModel tokenModel, TimeSpan expiresSliding, TimeSpan expiresAbsoulte)
        {
            #region 生产变量
            DateTime UTC = DateTime.UtcNow;
            Claim[] claims = new Claim[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,tokenModel.Sub),//Subject,
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),//JWT ID,JWT的唯一标识
                new Claim(JwtRegisteredClaimNames.Iat, UTC.ToString(), ClaimValueTypes.Integer64),//Issued At，JWT颁发的时间，采用标准unix时间，用于验证过期
            };

            JwtSecurityToken jwt = new JwtSecurityToken(
            issuer: "RayPI",//jwt签发者,非必须
            audience: tokenModel.Uname,//jwt的接收该方，非必须
            claims: claims,//声明集合
            expires: UTC.AddHours(12),//指定token的生命周期，unix时间戳格式,非必须
            signingCredentials: new Microsoft.IdentityModel.Tokens
                .SigningCredentials(new SymmetricSecurityKey(Encoding.ASCII.GetBytes("RayPI's Secret Key")), SecurityAlgorithms.HmacSha256));//使用私钥进行签名加密

            var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);//生成最后的JWT字符串

            MemoryCacheModel.AddMemoryCache(encodedJwt, tokenModel, expiresSliding, expiresAbsoulte);//将JWT字符串和tokenModel作为key和value存入缓存
            return encodedJwt;
            #endregion

            #region 测试变量
            //DateTime UTC = DateTime.UtcNow;
            //Claim[] claims = new Claim[]
            //{
            //    new Claim(JwtRegisteredClaimNames.Sub,"Admin"),//Subject,
            //    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),//JWT ID,JWT的唯一标识
            //    new Claim(JwtRegisteredClaimNames.Iat, UTC.ToString(), ClaimValueTypes.Integer64),//Issued At，JWT颁发的时间，采用标准unix时间，用于验证过期
            //};

            //JwtSecurityToken jwt = new JwtSecurityToken(
            //issuer: "RayPI",//jwt签发者,非必须
            //audience: "",//jwt的接收该方，非必须
            //claims: claims,//声明集合
            //expires: UTC.AddHours(12),//指定token的生命周期，unix时间戳格式,非必须
            //signingCredentials: new Microsoft.IdentityModel.Tokens
            //    .SigningCredentials(new SymmetricSecurityKey(Encoding.ASCII.GetBytes("RayPI's Secret Key")), SecurityAlgorithms.HmacSha256));//使用私钥进行签名加密

            //var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);//生成最后的JWT字符串
            //TokenModel tm = new TokenModel();
            //tm.Uid = 0;
            //tm.Sub = "Admin";
            //MemoryCacheModel.AddMemoryCache(encodedJwt, tm, new TimeSpan(30), new TimeSpan(30));//将JWT字符串和tokenModel作为key和value存入缓存
            //return encodedJwt;
            #endregion
        }
    }
}
