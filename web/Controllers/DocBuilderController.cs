/*
 *
 * (c) Copyright Ascensio System Limited 2021
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
using System.IO;
using System.Linq;
using System.Web.Mvc;
using ASC.Api.Web.Help.DocumentGenerator;
using ASC.Api.Web.Help.Helpers;
using log4net;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class DocBuilderController : AsyncController
    {
        #region actions

        private readonly string[] _actionMap = new[]
            {
                "Basic",
                "changelog",
                "classlist",
                "csharpexample",
                "formapi",
                "gettingstarted",
                "global",
                "nodejsexample",
                "howitworks",
                "howitworks/comparedocuments",
                "howitworks/globalvariable",
                "integratingdocumentbuilder",
                "integrationapi",
                "integrationapi/c",
                "integrationapi/c/cdocbuilder",
                "integrationapi/c/cdocbuilder/closefile",
                "integrationapi/c/cdocbuilder/createfile",
                "integrationapi/c/cdocbuilder/dispose",
                "integrationapi/c/cdocbuilder/executecommand",
                "integrationapi/c/cdocbuilder/getcontext",
                "integrationapi/c/cdocbuilder/getversion",
                "integrationapi/c/cdocbuilder/initialize",
                "integrationapi/c/cdocbuilder/issavewithdoctrenderermode",
                "integrationapi/c/cdocbuilder/openfile",
                "integrationapi/c/cdocbuilder/run",
                "integrationapi/c/cdocbuilder/runtexta",
                "integrationapi/c/cdocbuilder/runtextw",
                "integrationapi/c/cdocbuilder/savefile",
                "integrationapi/c/cdocbuilder/setproperty",
                "integrationapi/c/cdocbuilder/setpropertyw",
                "integrationapi/c/cdocbuilder/settmpfolder",
                "integrationapi/c/cdocbuilder/writedata",
                "integrationapi/c/cdocbuildervalue",
                "integrationapi/c/cdocbuildervalue/isempty",
                "integrationapi/c/cdocbuildervalue/clear",
                "integrationapi/c/cdocbuildervalue/isnull",
                "integrationapi/c/cdocbuildervalue/isundefined",
                "integrationapi/c/cdocbuildervalue/isbool",
                "integrationapi/c/cdocbuildervalue/isint",
                "integrationapi/c/cdocbuildervalue/isdouble",
                "integrationapi/c/cdocbuildervalue/isstring",
                "integrationapi/c/cdocbuildervalue/isfunction",
                "integrationapi/c/cdocbuildervalue/isobject",
                "integrationapi/c/cdocbuildervalue/isarray",
                "integrationapi/c/cdocbuildervalue/istypedarray",
                "integrationapi/c/cdocbuildervalue/getlength",
                "integrationapi/c/cdocbuildervalue/tobool",
                "integrationapi/c/cdocbuildervalue/toint",
                "integrationapi/c/cdocbuildervalue/todouble",
                "integrationapi/c/cdocbuildervalue/tostring",
                "integrationapi/c/cdocbuildervalue/getproperty",
                "integrationapi/c/cdocbuildervalue/get",
                "integrationapi/c/cdocbuildervalue/set",
                "integrationapi/c/cdocbuildervalue/setproperty",
                "integrationapi/c/cdocbuildervalue/createundefined",
                "integrationapi/c/cdocbuildervalue/createnull",
                "integrationapi/c/cdocbuildervalue/call",
                "integrationapi/c/cdocbuildercontextscope",
                "integrationapi/c/cdocbuildercontextscope/close",
                "integrationapi/c/cdocbuildercontext",
                "integrationapi/c/cdocbuildercontext/createundefined",
                "integrationapi/c/cdocbuildercontext/createnull",
                "integrationapi/c/cdocbuildercontext/createobject",
                "integrationapi/c/cdocbuildercontext/createarray",
                "integrationapi/c/cdocbuildercontext/createtypedarray",
                "integrationapi/c/cdocbuildercontext/allocmemorytypedarray",
                "integrationapi/c/cdocbuildercontext/freememorytypedarray",
                "integrationapi/c/cdocbuildercontext/getglobal",
                "integrationapi/c/cdocbuildercontext/createscope",
                "integrationapi/c/cdocbuildercontext/iserror",
                "integrationapi/net",
                "integrationapi/net/cdocbuilder",
                "integrationapi/net/cdocbuilder/closefile",
                "integrationapi/net/cdocbuilder/createfile",
                "integrationapi/net/cdocbuilder/destroy",
                "integrationapi/net/cdocbuilder/executecommand",
                "integrationapi/net/cdocbuilder/getcontext",
                "integrationapi/net/cdocbuilder/getversion",
                "integrationapi/net/cdocbuilder/initialize",
                "integrationapi/net/cdocbuilder/issavewithdoctrenderermode",
                "integrationapi/net/cdocbuilder/openfile",
                "integrationapi/net/cdocbuilder/run",
                "integrationapi/net/cdocbuilder/runtext",
                "integrationapi/net/cdocbuilder/savefile",
                "integrationapi/net/cdocbuilder/setproperty",
                "integrationapi/net/cdocbuilder/settmpfolder",
                "integrationapi/net/cdocbuilder/writedata",
                "integrationapi/net/cdocbuildervalue",
                "integrationapi/net/cdocbuildervalue/isempty",
                "integrationapi/net/cdocbuildervalue/clear",
                "integrationapi/net/cdocbuildervalue/isnull",
                "integrationapi/net/cdocbuildervalue/isundefined",
                "integrationapi/net/cdocbuildervalue/isbool",
                "integrationapi/net/cdocbuildervalue/isint",
                "integrationapi/net/cdocbuildervalue/isdouble",
                "integrationapi/net/cdocbuildervalue/isstring",
                "integrationapi/net/cdocbuildervalue/isfunction",
                "integrationapi/net/cdocbuildervalue/isobject",
                "integrationapi/net/cdocbuildervalue/isarray",
                "integrationapi/net/cdocbuildervalue/istypedarray",
                "integrationapi/net/cdocbuildervalue/getlength",
                "integrationapi/net/cdocbuildervalue/tobool",
                "integrationapi/net/cdocbuildervalue/toint",
                "integrationapi/net/cdocbuildervalue/todouble",
                "integrationapi/net/cdocbuildervalue/tostring",
                "integrationapi/net/cdocbuildervalue/getproperty",
                "integrationapi/net/cdocbuildervalue/get",
                "integrationapi/net/cdocbuildervalue/set",
                "integrationapi/net/cdocbuildervalue/setproperty",
                "integrationapi/net/cdocbuildervalue/createundefined",
                "integrationapi/net/cdocbuildervalue/createnull",
                "integrationapi/net/cdocbuildervalue/call",
                "integrationapi/net/cdocbuildercontextscope",
                "integrationapi/net/cdocbuildercontextscope/close",
                "integrationapi/net/cdocbuildercontext",
                "integrationapi/net/cdocbuildercontext/createundefined",
                "integrationapi/net/cdocbuildercontext/createnull",
                "integrationapi/net/cdocbuildercontext/createobject",
                "integrationapi/net/cdocbuildercontext/createarray",
                "integrationapi/net/cdocbuildercontext/createtypedarray",
                "integrationapi/net/cdocbuildercontext/getglobal",
                "integrationapi/net/cdocbuildercontext/createscope",
                "integrationapi/net/cdocbuildercontext/iserror",
                "integrationapi/arguments",
                "integrationapi/usingdocbuilderfile",
                "phpexample",
                "presentationapi",
                "rubyexample",
                "spreadsheetapi",
                "spreadsheetapi/events",
                "spreadsheetapi/events/onworksheetchange",
                "textdocumentapi",
                "try",
            };

        #endregion

        public ActionResult Navigation()
        {
            return View();
        }

        public ActionResult Search(string query)
        {
            return View(GCustomSearch.Search(query, "docbuilder"));
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult Gettingstarted()
        {
            return View();
        }

        public ActionResult Nodejsexample()
        {
            return View();
        }

        public ActionResult Rubyexample()
        {
            return View();
        }

        public ActionResult Phpexample()
        {
            return View();
        }

        public ActionResult Csharpexample()
        {
            return View();
        }

        public ActionResult Integratingdocumentbuilder()
        {
            var directoryInfo = new DirectoryInfo(Request.MapPath("~/app_data/docbuilder"));

            var examples = directoryInfo.GetFiles("*.zip", SearchOption.TopDirectoryOnly).Select(fileInfo => fileInfo.Name).ToList();

            return View(examples);
        }

        public ActionResult Integrationapi(string catchall)
        {
            if (!_actionMap.Contains("integrationapi/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Integrationapi", (object)catchall);
        }

        public ActionResult Howitworks(string catchall)
        {
            if (!_actionMap.Contains("howitworks/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Howitworks", (object)catchall);
        }

        public ActionResult Try()
        {
            return View();
        }

        [HttpPost]
        public string Try(string module, string section, string method)
        {
            var dbMethod = DocBuilderDocumentation.GetMethod(module, section, method);
            if (dbMethod != null && dbMethod.Example != null)
                return dbMethod.Example.Script;
            return "";
        }

        public ActionResult Textdocumentapi(string catchall)
        {
            if (string.IsNullOrEmpty(catchall)) return View("Textdocumentapi");
            return FindDoc("word", catchall);
        }

        public ActionResult Spreadsheetapi(string catchall)
        {
            if (string.IsNullOrEmpty(catchall)) return View("Spreadsheetapi");
            return FindDoc("cell", catchall);
        }

        public ActionResult Presentationapi(string catchall)
        {
            if (string.IsNullOrEmpty(catchall)) return View("Presentationapi");
            return FindDoc("slide", catchall);
        }

        public ActionResult Formapi(string catchall)
        {
            if (string.IsNullOrEmpty(catchall)) return View("Formapi");
            return FindDoc("form", catchall);
        }

        public ActionResult Global()
        {
            return View(DocBuilderDocumentation.GetGlobals());
        }

        public ActionResult Classlist()
        {
            return View();
        }

        public FileResult DownloadScript(string fileId)
        {
            var hash = new Guid(fileId);
            var fileName = string.Format("{0}.docbuilder", hash);
            var builderPath = Path.Combine(Path.GetTempPath(), fileName);

            var bytes = System.IO.File.ReadAllBytes(builderPath);
            return File(bytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult DocBuilderGenerate(string actionName, string builderScript)
        {
            try
            {
                builderScript = (builderScript ?? "").Trim();
                if (string.IsNullOrEmpty(builderScript))
                    throw new Exception("Empty Script");

                var fileUrl = new DocBuilderHelper(Url, Request).GenerateDocument(builderScript);
                return Redirect(fileUrl);
            }
            catch (Exception ex)
            {
                LogManager.GetLogger("ASC.DocumentBuilder").Error(ex);
                return RedirectToAction(actionName, new { error = ex.Message });
            }
        }

        [HttpPost]
        public ActionResult DocBuilderCreate(string actionName, string name, string company, string title, string format)
        {
            try
            {
                name = (name ?? "").Trim();
                if (string.IsNullOrEmpty(name))
                    name = "John Smith";

                company = (company ?? "").Trim();
                if (string.IsNullOrEmpty(company))
                    company = "ONLYOFFICE";

                title = (title ?? "").Trim();
                if (string.IsNullOrEmpty(title))
                    title = "Commercial director";

                var fileUrl = new DocBuilderHelper(Url, Request).CreateDocument(name, company, title, format);
                return Redirect(fileUrl);
            }
            catch (Exception ex)
            {
                LogManager.GetLogger("ASC.DocumentBuilder").Error(ex);
                return RedirectToAction(actionName, new { error = ex.Message });
            }
        }

        private ActionResult FindDoc(string module, string path)
        {
            var split = path.Split('/');
            var section = split[0];
            var method = split.Length > 1 ? split[1] : null;

            if (section == "events")
            {
                if (method == null) return View("Spreadsheetapi/Events");
                return View("Spreadsheetapi/Events", (object)method);
            }
            if (string.IsNullOrEmpty(method))
            {
                var sec = DocBuilderDocumentation.GetSection(module, section);
                if (sec == null) return View("sectionnotfound");
                return View("sectionpartial", sec);
            }
            else
            {
                var met = DocBuilderDocumentation.GetMethod(module, section, method);
                if (met == null) return View("methodnotfound");
                return View("methodpartial", met);
            }
        }
    }
}