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
 * Pursuant to Section 7 ยง 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 ยง 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using JWT;
using JWT.Algorithms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using static ASC.Api.Web.Help.Helpers.Config;

namespace ASC.Api.Web.Help.Helpers
{
    public class DocBuilderHelper
    {
        public UrlHelper Url;
        public HttpRequestBase Request;

        public DocBuilderHelper(UrlHelper url, HttpRequestBase request)
        {
            Url = url;
            Request = request;
        }

        public static string BuilderPath
        {
            get { return WebConfigurationManager.AppSettings["builder-path"] ?? string.Empty; }
        }

        private const int ScriptMaxLength = 10000;

        public string GenerateDocument(string builderScript)
        {
            builderScript = CutBuilderScript(builderScript);

            if (builderScript.Length > ScriptMaxLength)
            {
                throw new Exception("The script is too long");
            }

            var link = BuildFile(builderScript);
            return link;
        }

        private static string CutBuilderScript(string builderScript)
        {
            const string openFunction = "builder.OpenFile";
            const string createFunction = "builder.CreateFile";
            const string saveFunction = "builder.SaveFile";

            if (builderScript.IndexOf(openFunction, StringComparison.InvariantCulture) != -1)
            {
                throw new Exception("OpenFile not available there");
            }
            if (builderScript.IndexOf(createFunction, StringComparison.InvariantCulture) == -1)
            {
                throw new Exception("CreateFile not found");
            }
            var saveStartIndex = builderScript.IndexOf(saveFunction, StringComparison.InvariantCulture);
            if (saveStartIndex == -1)
            {
                throw new Exception("SaveFile not found");
            }

            var saveEndIndex = builderScript.IndexOf('\r', saveStartIndex);
            if (saveEndIndex != -1)
            {
                builderScript = builderScript.Substring(0, saveEndIndex);
            }
            builderScript += "\r\nbuilder.CloseFile();";

            return builderScript;
        }

        private static string GetFileName(string builderScript)
        {
            const string formatPattern = "builder.SaveFile\\s*\\(\\s*\"(.*)\"\\s*,\\s*\"(.*)\"\\s*\\)";

            var format = string.Empty;
            var fileName = string.Empty;

            foreach (Match match in Regex.Matches(builderScript, formatPattern))
            {
                format = match.Groups[1].Value.ToLowerInvariant();
                fileName = match.Groups[2].Value;
                break;
            }

            if (string.IsNullOrEmpty(format))
            {
                throw new Exception("SaveFile without format");
            }

            if (!string.IsNullOrEmpty(fileName) && fileName.ToLowerInvariant().EndsWith("." + format.ToLowerInvariant()))
            {
                fileName = fileName.Substring(0, fileName.Length - format.Length - 1);
            }

            fileName = Path.GetFileName(fileName);

            return fileName + "." + format;
        }

        public string CreateDocument(string name, string company, string title, string format)
        {
            const string replacePattern = "['\"\\(\\)\\r\\n]";

            format = (Path.GetFileName(format) ?? "").Split('.')[0];
            if (string.IsNullOrEmpty(format))
            {
                throw new Exception("SaveFile without format");
            }

            var templatePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "docbuilder", "Templates", string.Format("{0}.docbuilder", format));

            if (!File.Exists(templatePath))
            {
                throw new Exception("Template not found");
            }
            var templateText = File.ReadAllText(templatePath);

            var customerData = new Dictionary<string, string>
                {
                    { "${Name}", Regex.Replace(name, replacePattern, string.Empty) },
                    { "${Company}", Regex.Replace(company, replacePattern, string.Empty) },
                    { "${Title}", Regex.Replace(title, replacePattern, string.Empty) },
                    { "${DateTime}", DateTime.Now.ToString(CultureInfo.InvariantCulture) }
                };

            var builderScript = customerData.Aggregate(templateText,
                                                       (current, substitution) =>
                                                       current.Replace(substitution.Key, substitution.Value));

            if (builderScript.Length > ScriptMaxLength)
            {
                throw new Exception("The script is too long");
            }

            var link = BuildFile(builderScript);
            return link;
        }

        private string GetScriptUrl(string builderScript)
        {
            var hash = Guid.NewGuid();
            var fileName = string.Format("{0}.docbuilder", hash);
            var builderPath = Path.Combine(Path.GetTempPath(), fileName);

            File.WriteAllText(builderPath, builderScript);
            return Url.Action("DownloadScript", null, new { fileId = hash }, (Request.Url ?? new Uri("")).Scheme);
        }

        private string BuildFile(string builderScript)
        {
            var fileName = GetFileName(builderScript);

            var scriptUrl = GetScriptUrl(builderScript);

            Dictionary<string, string> urls;
            DocbuilderRequest(
                ConfigurationManager.AppSettings["editor_url"] + "/docbuilder",
                null,
                scriptUrl,
                false,
                Config.GetSignatureSecret(),
                out urls
                );

            var fileUrl = string.Empty;
            if (urls != null && urls.ContainsKey(fileName))
            {
                fileUrl = urls[fileName];
            }
            if (string.IsNullOrEmpty(fileUrl))
            {
                throw new Exception("Result without file");
            }
            return fileUrl;
        }

        private string DocbuilderRequest(
            string docbuilderUrl,
            string requestKey,
            string scriptUrl,
            bool isAsync,
            string signatureSecret,
            out Dictionary<string, string> urls)
        {
            if (string.IsNullOrEmpty(docbuilderUrl))
                throw new ArgumentNullException("docbuilderUrl");

            if (string.IsNullOrEmpty(requestKey) && string.IsNullOrEmpty(scriptUrl))
                throw new ArgumentException("requestKey or inputScript is empty");

            var request = (HttpWebRequest)WebRequest.Create(docbuilderUrl);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Timeout = (int)TimeSpan.FromMinutes(1).TotalMilliseconds;

            var body = new BuilderBody
            {
                Async = isAsync,
                Key = requestKey,
                Url = scriptUrl
            };

            if (!string.IsNullOrEmpty(signatureSecret))
            {
                var payload = new Dictionary<string, object>
                    {
                        { "payload", body }
                    };

                var serializer = new JwtSerializer();
                var urlEncoder = new JwtBase64UrlEncoder();
                var algorithm = new HMACSHA256Algorithm();
                var encoder = new JwtEncoder(algorithm, serializer, urlEncoder);

                var token = encoder.Encode(payload, signatureSecret);

                //todo: remove old scheme
                request.Headers.Add("Authorization", "Bearer " + token);

                token = encoder.Encode(body, signatureSecret);
                body.Token = token;
            }

            var bodyString = JsonConvert.SerializeObject(body);

            var bytes = Encoding.UTF8.GetBytes(bodyString ?? "");
            request.ContentLength = bytes.Length;
            using (var stream = request.GetRequestStream())
            {
                stream.Write(bytes, 0, bytes.Length);
            }

            string dataResponse = null;
            using (var response = (HttpWebResponse)request.GetResponse())
            using (var responseStream = response.GetResponseStream())
            {
                if (responseStream != null)
                {
                    using (var reader = new StreamReader(responseStream))
                    {
                        dataResponse = reader.ReadToEnd();
                    }
                }
            }

            if (string.IsNullOrEmpty(dataResponse)) throw new Exception("Invalid response");

            var responseFromService = JObject.Parse(dataResponse);
            if (responseFromService == null) throw new Exception("Invalid answer format");

            var errorElement = responseFromService.Value<string>("error");
            if (!string.IsNullOrEmpty(errorElement))
            {
                throw new Exception($"Got error {errorElement}");
            };

            var isEnd = responseFromService.Value<bool>("end");

            urls = null;
            if (isEnd)
            {
                IDictionary<string, JToken> rates = (JObject)responseFromService["urls"];

                urls = rates.ToDictionary(pair => pair.Key, pair => pair.Value.ToString());
            }

            return responseFromService.Value<string>("key");
        }

        [Serializable]
        [DataContract(Name = "Builder", Namespace = "")]
        [DebuggerDisplay("{Key}")]
        private class BuilderBody
        {
            [DataMember(Name = "async")]
            public bool Async { get; set; }

            [DataMember(Name = "key", IsRequired = true)]
            public string Key { get; set; }

            [DataMember(Name = "url", IsRequired = true)]
            public string Url { get; set; }

            [DataMember(Name = "token", EmitDefaultValue = false)]
            public string Token { get; set; }
        }
    }
}