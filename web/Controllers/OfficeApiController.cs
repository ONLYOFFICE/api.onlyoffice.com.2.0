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
using ASC.Api.Web.Help.Helpers;
using ASC.Api.Web.Help.DocumentGenerator;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class OfficeApiController : AsyncController
    {
        private readonly string[] _actionMap = new[]
            {
                "buildersamples",
                "buildersamples/addwatermark",
                "buildersamples/commenterrors",
                "buildersamples/createadvancedform",
                "buildersamples/createbasicform",
                "buildersamples/createchartpresentation",
                "buildersamples/createformaldocument",
                "buildersamples/createpresentation",
                "buildersamples/createreports",
                "buildersamples/createspreadsheetchart",
                "buildersamples/createtabledocument",
                "buildersamples/fillform",
                "buildersamples/fillspreadsheet",
                "buildersamples/mailmergereceptions",
                "changelog",
                "formapi",
                "basic",
                "global",
                "presentationapi",
                "spreadsheetapi",
                "textdocumentapi",
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
            return View(GCustomSearch.Search(query, "officeapi"));
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Buildersamples(string catchall)
        {
            if (!_actionMap.Contains("buildersamples/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Buildersamples", (object)catchall);
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
            return View(DocBuilderDocumentation.Instance.GetGlobals());
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