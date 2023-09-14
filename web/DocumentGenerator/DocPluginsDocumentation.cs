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


using ASC.Api.Web.Help.Helpers;
using log4net;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public class DocPluginsDocumentation : JsDocDocumentation
    {
        private static DocPluginsDocumentation _instance;
        public static DocPluginsDocumentation Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new DocPluginsDocumentation();
                }
                return _instance;
            }
        }

        private DocPluginsDocumentation() { }

        private Dictionary<string, string> reversePathMapping;

        public void Load()
        {
            PathMapping = new Dictionary<string, string>
            {
                { "pluginBase", "pluginBase" },
                { "sharedPluginMethods", "common" },
                { "wordPluginMethods", "text" },
                { "cellPluginMethods", "cell" },
                { "slidePluginMethods", "slide" },
                { "formPluginMethods", "form" },
            };

            reversePathMapping = PathMapping.ToDictionary(kv => kv.Value, kv => kv.Key);

            _logger = LogManager.GetLogger("ASC.Plugins");
            _logger.Debug("Generate plugins documentations");
            Load("plugins");
        }

        protected override void CheckSharedMethods()
        {

        }

        public override List<SearchResult> Search(string query, UrlHelper url)
        {
            return new List<SearchResult>();
        }

        public string GetModuleFromPath(string path)
        {
            return reversePathMapping.ContainsKey(path) ? reversePathMapping[path] : null;
        }

        protected override void FillPaths()
        {
            var basePath = "/plugin";

            foreach (var kv in _entries)
            {
                if (kv.Key == "pluginBase")
                {
                    var inputHelper = kv.Value["inputHelper"];
                    inputHelper.Path = $"{basePath}/inputhelper";

                    foreach (var method in inputHelper.Methods.Values)
                    {
                        method.Path = $"{inputHelper.Path}/{method.Name.ToLower()}";
                    }

                    var plugin = kv.Value["Plugin"];
                    plugin.Path = basePath;

                    foreach (var method in plugin.Methods.Values)
                    {
                        method.Path = $"{plugin.Path}/{method.Name.ToLower()}";
                    }

                    foreach (var evt in plugin.Events.Values)
                    {
                        evt.Path = $"{plugin.Path}/events/{evt.Name.ToLower()}";
                    }
                }
                else
                {
                    var api = kv.Value["api"];
                    api.Path = $"/executemethod/{PathMapping[kv.Key]}";
                    foreach (var method in api.Methods.Values)
                    {
                        method.Path = $"{api.Path}/{method.Name.ToLower()}";
                    }
                }
            }

            foreach (var global in _globals.Values)
            {
                global.Path = $"{basePath}/global#{global.Name}";
            }
        }
    }
}