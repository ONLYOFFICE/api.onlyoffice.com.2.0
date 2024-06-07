/*
 *
 * (c) Copyright Ascensio System SIA 2024
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
                "builderframeworksamples",
                "builderframeworksamples/csharpbuildersamples",
                "builderframeworksamples/cppbuildersamples",
                "classlist",
                "csharpbuildersamples",
                "csharpexample",
                "debugging",
                "framework",
                "getbuilder",
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
                "integrationapi/com",
                "integrationapi/com/cdocbuilder",
                "integrationapi/com/cdocbuilder/closefile",
                "integrationapi/com/cdocbuilder/createfile",
                "integrationapi/com/cdocbuilder/createinstance",
                "integrationapi/com/cdocbuilder/dispose",
                "integrationapi/com/cdocbuilder/execute",
                "integrationapi/com/cdocbuilder/executecommand",
                "integrationapi/com/cdocbuilder/getcontext",
                "integrationapi/com/cdocbuilder/initialize",
                "integrationapi/com/cdocbuilder/issavewithdoctrenderermode",
                "integrationapi/com/cdocbuilder/openfile",
                "integrationapi/com/cdocbuilder/run",
                "integrationapi/com/cdocbuilder/runtext",
                "integrationapi/com/cdocbuilder/savefile",
                "integrationapi/com/cdocbuilder/setproperty",
                "integrationapi/com/cdocbuilder/settmpfolder",
                "integrationapi/com/cdocbuilder/writedata",
                "integrationapi/com/cdocbuildervalue",
                "integrationapi/com/cdocbuildervalue/isempty",
                "integrationapi/com/cdocbuildervalue/clear",
                "integrationapi/com/cdocbuildervalue/createinstance",
                "integrationapi/com/cdocbuildervalue/isnull",
                "integrationapi/com/cdocbuildervalue/isundefined",
                "integrationapi/com/cdocbuildervalue/isbool",
                "integrationapi/com/cdocbuildervalue/isint",
                "integrationapi/com/cdocbuildervalue/isdouble",
                "integrationapi/com/cdocbuildervalue/isstring",
                "integrationapi/com/cdocbuildervalue/isfunction",
                "integrationapi/com/cdocbuildervalue/isobject",
                "integrationapi/com/cdocbuildervalue/isarray",
                "integrationapi/com/cdocbuildervalue/istypedarray",
                "integrationapi/com/cdocbuildervalue/getlength",
                "integrationapi/com/cdocbuildervalue/tobool",
                "integrationapi/com/cdocbuildervalue/toint",
                "integrationapi/com/cdocbuildervalue/todouble",
                "integrationapi/com/cdocbuildervalue/tostring",
                "integrationapi/com/cdocbuildervalue/getproperty",
                "integrationapi/com/cdocbuildervalue/get",
                "integrationapi/com/cdocbuildervalue/set",
                "integrationapi/com/cdocbuildervalue/setproperty",
                "integrationapi/com/cdocbuildervalue/call",
                "integrationapi/com/cdocbuildercontextscope",
                "integrationapi/com/cdocbuildercontextscope/close",
                "integrationapi/com/cdocbuildercontext",
                "integrationapi/com/cdocbuildercontext/createundefined",
                "integrationapi/com/cdocbuildercontext/createnull",
                "integrationapi/com/cdocbuildercontext/createobject",
                "integrationapi/com/cdocbuildercontext/createarray",
                "integrationapi/com/cdocbuildercontext/createtypedarray",
                "integrationapi/com/cdocbuildercontext/getglobal",
                "integrationapi/com/cdocbuildercontext/createscope",
                "integrationapi/com/cdocbuildercontext/iserror",
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
                "integrationapi/python",
                "integrationapi/python/cdocbuilder",
                "integrationapi/python/cdocbuilder/closefile",
                "integrationapi/python/cdocbuilder/createfile",
                "integrationapi/python/cdocbuilder/dispose",
                "integrationapi/python/cdocbuilder/executecommand",
                "integrationapi/python/cdocbuilder/getcontext",
                "integrationapi/python/cdocbuilder/getversion",
                "integrationapi/python/cdocbuilder/initialize",
                "integrationapi/python/cdocbuilder/issavewithdoctrenderermode",
                "integrationapi/python/cdocbuilder/openfile",
                "integrationapi/python/cdocbuilder/run",
                "integrationapi/python/cdocbuilder/runtext",
                "integrationapi/python/cdocbuilder/savefile",
                "integrationapi/python/cdocbuilder/setproperty",
                "integrationapi/python/cdocbuilder/settmpfolder",
                "integrationapi/python/cdocbuilder/writedata",
                "integrationapi/python/cdocbuildervalue",
                "integrationapi/python/cdocbuildervalue/isempty",
                "integrationapi/python/cdocbuildervalue/clear",
                "integrationapi/python/cdocbuildervalue/isnull",
                "integrationapi/python/cdocbuildervalue/isundefined",
                "integrationapi/python/cdocbuildervalue/isbool",
                "integrationapi/python/cdocbuildervalue/isint",
                "integrationapi/python/cdocbuildervalue/isdouble",
                "integrationapi/python/cdocbuildervalue/isstring",
                "integrationapi/python/cdocbuildervalue/isfunction",
                "integrationapi/python/cdocbuildervalue/isobject",
                "integrationapi/python/cdocbuildervalue/isarray",
                "integrationapi/python/cdocbuildervalue/getlength",
                "integrationapi/python/cdocbuildervalue/tobool",
                "integrationapi/python/cdocbuildervalue/toint",
                "integrationapi/python/cdocbuildervalue/todouble",
                "integrationapi/python/cdocbuildervalue/tostring",
                "integrationapi/python/cdocbuildervalue/getproperty",
                "integrationapi/python/cdocbuildervalue/get",
                "integrationapi/python/cdocbuildervalue/set",
                "integrationapi/python/cdocbuildervalue/setproperty",
                "integrationapi/python/cdocbuildervalue/createarray",
                "integrationapi/python/cdocbuildervalue/createundefined",
                "integrationapi/python/cdocbuildervalue/createnull",
                "integrationapi/python/cdocbuildervalue/call",
                "integrationapi/python/cdocbuildercontextscope",
                "integrationapi/python/cdocbuildercontextscope/close",
                "integrationapi/python/cdocbuildercontext",
                "integrationapi/python/cdocbuildercontext/createundefined",
                "integrationapi/python/cdocbuildercontext/createnull",
                "integrationapi/python/cdocbuildercontext/createobject",
                "integrationapi/python/cdocbuildercontext/createarray",
                "integrationapi/python/cdocbuildercontext/getglobal",
                "integrationapi/python/cdocbuildercontext/createscope",
                "integrationapi/python/cdocbuildercontext/iserror",
                "integrationapi/arguments",
                "integrationapi/usingdocbuilderfile",
                "phpexample",
                "rubyexample",
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

        public ActionResult Debugging()
        {
            return View();
        }

        public ActionResult Framework()
        {
            return View();
        }

        public ActionResult GetBuilder()
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
            return View();
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

        public ActionResult Builderframeworksamples(string catchall)
        {
            if (!_actionMap.Contains("builderframeworksamples/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Builderframeworksamples", (object)catchall);
        }

        [HttpPost]
        public string Try(string module, string section, string method)
        {
            var dbMethod = DocBuilderDocumentation.Instance.GetMethod(module, section, method);
            if (dbMethod != null && dbMethod.Example != null)
                return dbMethod.Example.Script;
            return "";
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

            if (string.IsNullOrEmpty(method))
            {
                var sec = DocBuilderDocumentation.Instance.GetSection(module, section);
                if (sec == null) return View("sectionnotfound");
                return View("sectionpartial", sec);
            }
            else
            {
                if (method.StartsWith("event-"))
                {
                    var ev = DocBuilderDocumentation.Instance.GetEvent(module, section, method.Substring("event-".Length));
                    if (ev == null) return View("eventnotfound");
                    return View("eventpartial", ev);
                }
                else
                {
                    var met = DocBuilderDocumentation.Instance.GetMethod(module, section, method);
                    if (met == null) return View("methodnotfound");
                    return View("methodpartial", met);
                }
            }
        }
    }
}