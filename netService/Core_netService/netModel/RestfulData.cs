using System;
using System.Collections.Generic;

namespace netModel
{
    /// <summary>
    /// 基础数据，不包含用户data
    /// </summary>
    public class RestfulData
    {
        /// <summary>
        /// <![CDATA[错误码]]>
        /// </summary>
        public int code { get; set; }

        /// <summary>
        ///<![CDATA[消息]]>
        /// </summary>
        public string message { get; set; }

        /// <summary>
        /// <![CDATA[相关的链接帮助地址]]>
        /// </summary>
        public string url { get; set; }
    }
    /// <summary>
    /// 携带data
    /// </summary>
    /// <typeparam name="T">泛型</typeparam>
    public class ResultData<T> : RestfulData
    {
        /// <summary>
        /// <![CDATA[数据]]>
        /// </summary>
        public virtual T data { get; set; }
    }
    /// <summary>
    /// 返回data组
    /// </summary>
    /// <typeparam name="T">泛型</typeparam>
    public class RestfulArray<T> : ResultData<IEnumerable<T>>
    {

    }
}
