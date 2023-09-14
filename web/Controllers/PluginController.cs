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
using System.Linq;
using System.Web.Mvc;
using ASC.Api.Web.Help.DocumentGenerator;
using ASC.Api.Web.Help.Helpers;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class PluginController : AsyncController
    {
        private readonly string[] _actionMap = new[]
            {
                "Basic",
                "Code",
                "Config",
                "changelog",
                "events",
                "example",
                "example/addcommentincell",
                "example/addcustomfields",
                "example/autocomplete",
                "example/chess",
                "example/clippy",
                "example/countwordsandcharacters",
                "example/default",
                "example/extendedcomments",
                "example/getandpastehtml",
                "example/helloworld",
                "example/highlightcode",
                "example/invoices",
                "example/languagetool",
                "example/loadcustomfields",
                "example/customfields",
                "example/movecursor",
                "example/ocr",
                "example/photoeditor",
                "example/searchandchangetextbackgroundcolor",
                "example/searchandreplace",
                "example/searchandreplaceonstart",
                "example/settings",
                "example/speech",
                "example/symboltable",
                "example/telegram",
                "example/templates",
                "example/thesaurus",
                "example/translator",
                "example/typograf",
                "example/workwithcontentcontrolscontent",
                "example/workwithcontentcontrolsnavigation",
                "example/workwithcontentcontrolstags",
                "example/youtube",
                "example/zotero",
                "FAQ",
                "GettingStarted",
                "Icons",
                "IndexHtml",
                "Info",
                "installation",
                "installation/cloud",
                "installation/desktop",
                "installation/onpremises",
                "Localization",
                "macros/Macros",
                "macros/Writing",
                "macros/Debugging",
                "macros/ConvertingVBA",
                "macros/macrosamples",
                "macros/macrosamples/addchart",
                "macros/macrosamples/changecellbackgroundcolor",
                "macros/macrosamples/changecellfontcolor",
                "macros/macrosamples/completeaddressinformation",
                "macros/macrosamples/currencyexchangerates",
                "macros/macrosamples/formatrangeasatable",
                "macros/macrosamples/highlightduplicates",
                "macros/macrosamples/importcsv",
                "macros/macrosamples/insertid",
                "macros/macrosamples/inserttext",
                "macros/macrosamples/makecellfontbold",
                "macros/macrosamples/mergecellrange",
                "macros/macrosamples/nextblankrow",
                "macros/macrosamples/recalculatevalues",
                "macros/macrosamples/removeshapes",
                "macros/macrosamples/setcolumnwidth",
                "macros/macrosamples/unhideallrows",
                "macros/macrosamples/unmergecellrange",
                "macros/macrosamples/writedatatoworksheetcell",
                "scope",
                "Structure",
                "Styles",
                "Types",
                "Variations",
            };

        public ActionResult Index()
        {
            return View("basic");
        }

        public ActionResult Navigation()
        {
            return View();
        }

        [ValidateInput(false)]
        public ActionResult Search(string query)
        {
            return View(GCustomSearch.Search(query, "plugin"));
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Code()
        {
            return View();
        }

        public ActionResult Config()
        {
            return View();
        }

        public ActionResult callCommand()
        {
            return RenderBaseMethod("callCommand");
        }

        public ActionResult callModule()
        {
            return RenderBaseMethod("callModule");
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult createInputHelper()
        {
            return RenderBaseMethod("createInputHelper");
        }

        public ActionResult Events(string catchall)
        {
            if (string.IsNullOrEmpty(catchall))
            {
                return View(DocPluginsDocumentation.Instance.GetSection("pluginBase", "plugin"));
            }
            else
            {
                var evt = DocPluginsDocumentation.Instance.GetEvent("pluginBase", "plugin", catchall);
                if (evt == null) return View("methodnotfound");
                return View("eventpartial", evt);
            }
        }

        public ActionResult example(string catchall)
        {
            if (!_actionMap.Contains("example/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("example", (object)catchall);
        }

        public ActionResult ExecuteCommand()
        {
            return RenderBaseMethod("ExecuteCommand");
        }

        public ActionResult Executemethod(string catchall)
        {
            if (string.IsNullOrEmpty(catchall))
            {
                return RenderBaseMethod("Executemethod");
            }
            else
            {
                return FindMethod(catchall);
            }
        }

        public ActionResult CommonMethods(string catchall)
        {
            return RenderSectionOrMethod("sharedPluginMethods", "api", catchall);
        }

        public ActionResult TextMethods(string catchall)
        {
            return RenderSectionOrMethod("wordPluginMethods", "api", catchall);
        }
        
        public ActionResult CellMethods(string catchall)
        {
            return RenderSectionOrMethod("cellPluginMethods", "api", catchall);
        }
        
        public ActionResult SlideMethods(string catchall)
        {
            return RenderSectionOrMethod("slidePluginMethods", "api", catchall);
        }

        public ActionResult FormMethods(string catchall)
        {
            return RenderSectionOrMethod("formPluginMethods", "api", catchall);
        }

        public ActionResult getInputHelper()
        {
            return RenderBaseMethod("getInputHelper");
        }

        public ActionResult Global()
        {
            return View(DocPluginsDocumentation.Instance.GetGlobals());
        }

        public ActionResult loadModule()
        {
            return RenderBaseMethod("loadModule");
        }

        public ActionResult resizeWindow()
        {
            return RenderBaseMethod("resizeWindow");
        }

        public ActionResult sendToPlugin()
        {
            return RenderBaseMethod("sendToPlugin");
        }

        public ActionResult GettingStarted()
        {
            return View();
        }

        public ActionResult FAQ()
        {
            return View();
        }

        public ActionResult Icons()
        {
            return View();
        }

        public ActionResult IndexHtml()
        {
            return View();
        }

        public ActionResult Info()
        {
            return View();
        }

        public ActionResult inputHelper(string catchall)
        {
            return RenderSectionOrMethod("pluginBase", "inputHelper", catchall);
        }

        public ActionResult Installation(string catchall)
        {
            if (!_actionMap.Contains("installation/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Installation", (object)catchall);
        }

        public ActionResult Localization()
        {
            return View();
        }

        public ActionResult Plugin(string catchall)
        {
            return RenderBaseMethod(catchall);
        }

        public ActionResult scope()
        {
            return View();
        }

        public ActionResult Structure()
        {
            return View();
        }

        public ActionResult Styles()
        {
            return View();
        }

        public ActionResult Types()
        {
            return View();
        }

        public ActionResult Variations()
        {
            return View();
        }

        public ActionResult Macros()
        {
            return View("Macros/Macros");
        }

        public ActionResult ConvertingVBAMacros()
        {
            return View("Macros/ConvertingVBAMacros");
        }

        public ActionResult Macrosamples(string catchall)
        {
            if (!_actionMap.Contains("Macros/Macrosamples/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Macros/Macrosamples", (object)catchall);
        }

        public ActionResult WritingMacros()
        {
            return View("Macros/WritingMacros");
        }

        public ActionResult Debugging()
        {
            return View("Macros/Debugging");
        }

        private ActionResult RenderBaseMethod(string methodName)
        {
            return RenderSectionOrMethod("pluginBase", "plugin", methodName);
        }

        private ActionResult RenderSectionOrMethod(string module, string sectionName, string methodName = null)
        {
            if (string.IsNullOrEmpty(methodName))
            {
                var section = DocPluginsDocumentation.Instance.GetSection(module, sectionName);
                if (section == null) return View("sectionnotfound");
                return View("sectionpartial", section);
            }
            else
            {
                var method = DocPluginsDocumentation.Instance.GetMethod(module, sectionName, methodName);
                if (method == null) return View("methodnotfound");
                return View("methodpartial", method);
            }
        }

        private ActionResult FindMethod(string path)
        {
            var split = path.Split('/');
            var module = DocPluginsDocumentation.Instance.GetModuleFromPath(split[0]);
            var method = split.Length > 1 ? split[1] : null;

            if (string.IsNullOrEmpty(module))
            {
                return View("sectionnotfound");
            }

            if (string.IsNullOrEmpty(method))
            {
                var sec = DocPluginsDocumentation.Instance.GetSection(module, "api");
                if (sec == null) return View("sectionnotfound");
                return View("sectionpartial", sec);
            }
            else
            {
                var met = DocPluginsDocumentation.Instance.GetMethod(module, "api", method);
                if (met == null) return View("methodnotfound");
                return View("methodpartial", met);
            }
        }
    }
}