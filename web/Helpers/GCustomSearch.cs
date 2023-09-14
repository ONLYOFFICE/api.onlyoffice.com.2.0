/*
 *
 * (c) Copyright Ascensio System SIA 2023
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Configuration;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ASC.Api.Web.Help.Helpers
{
    public class GCustomSearch
    {
        public static List<SearchResult> Search(string query, string subPath = null)
        {
            var result = new List<SearchResult>();

            var searchUrl = string.Format("{0}?key={1}&cx={2}&q={3}",
                                          WebConfigurationManager.AppSettings["google.search.url"],
                                          WebConfigurationManager.AppSettings["google.search.key"],
                                          WebConfigurationManager.AppSettings["google.search.cx"],
                                          HttpUtility.UrlEncode(query));

            if (!string.IsNullOrWhiteSpace(subPath))
            {
                searchUrl += " site:*/" + HttpUtility.UrlEncode(subPath);
            }

            try
            {
                var request = WebRequest.Create(searchUrl);

                var responce = (HttpWebResponse)request.GetResponse();
                var responseString = string.Empty;

                using (var dataStream = responce.GetResponseStream())
                {
                    if (dataStream != null)
                    {
                        using (var reader = new StreamReader(dataStream))
                        {
                            responseString = reader.ReadToEnd();
                        }
                    }
                }

                var jsonData = JsonConvert.DeserializeObject<JObject>(responseString);

                if (jsonData.ContainsKey("items"))
                {
                    foreach (var item in jsonData["items"])
                    {
                        result.Add(new SearchResult
                            {
                                Name = item["title"].ToString(),
                                Url = item["link"].ToString(),
                                Description = item["snippet"].ToString()
                            });
                    }
                }
            }
            catch (Exception error)
            {
                LogManager.GetLogger("ASC.Api").Error(error);
            }

            return result;
        }
    }
}