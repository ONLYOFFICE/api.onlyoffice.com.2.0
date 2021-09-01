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
using ASC.Api.Web.Help.Helpers;

namespace ASC.Api.Web.Help.Controllers
{
    [Redirect]
    public class EditorsController : AsyncController
    {
        private readonly string[] _actionMap = new[]
            {
                "ActionLink",
                "Advanced",
                "Alfresco",
                "AnonymousUsers",
                "Basic",
                "Callback",
                "Chamilo",
                "Changelog",
                "Coedit",
                "Command",
                "Command/drop",
                "Command/forcesave",
                "Command/info",
                "Command/license",
                "Command/meta",
                "Command/version",
                "Commenting",
                "Comparing",
                "Config",
                "Config/Document",
                "Config/Document/Info",
                "Config/Document/Permissions",
                "Config/Editor",
                "Config/Editor/Customization",
                "Config/Editor/Embedded",
                "Config/Editor/Plugins",
                "Config/Events",
                "Confluence",
                "Conversion",
                "ConversionApi",
                "DemoPreview",
                "Discovery",
                "DocumentBuilderApi",
                "Example/Java",
                "Example/Nodejs",
                "Example/Php",
                "Example/Ruby",
                "Example/Python",
                "Example/Csharp",
                "FAQ",
                "FAQ/Coediting",
                "FAQ/Customizing",
                "FAQ/Editing",
                "FAQ/Embedding",
                "FAQ/General",
                "FAQ/Integrating",
                "FAQ/ManagingVersions",
                "FAQ/Renaming",
                "FAQ/Saving",
                "FAQ/Security",
                "FAQ/Sharing",
                "GetDocs",
                "History",
                "HowItWorks",
                "HumHub",
                "InlineEditors",
                "Integrating",
                "Liferay",
                "Mentions",
                "Methods",
                "Nextcloud",
                "Nuxeo",
                "Open",
                "OwnCloud",
                "Plone",
                "Plugins",
                "PostMessage",
                "Rename",
                "RestApi",
                "Review",
                "Save",
                "Security",
                "SharePoint",
                "Signature",
                "Signature/Browser",
                "Signature/Body",
                "Signature/Request",
                "Troubleshooting",
                "Try",
                "WOPI",
                "WOPI/Discovery",
                "WOPI/HostPage",
                "WOPI/PostMessage",
                "WOPI/RestApi"
            };

        [ValidateInput(false)]
        public ActionResult Search(string query)
        {
            return View(GCustomSearch.Search(query, "editors"));
        }


        public ActionResult Navigation()
        {
            return View();
        }


        public ActionResult Index()
        {
            return View("Basic");
        }


        public ActionResult ActionLink()
        {
            return View();
        }

        public ActionResult Advanced()
        {
            return View();
        }

        public ActionResult Alfresco()
        {
            return View();
        }

        public ActionResult AnonymousUsers()
        {
            return View();
        }

        public ActionResult Basic()
        {
            return View();
        }

        public ActionResult Callback()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Callback(string data)
        {
            return Json(new { error = 0 });
        }

        public ActionResult Chamilo()
        {
            return View();
        }

        public ActionResult Changelog()
        {
            return View();
        }

        public ActionResult Coedit()
        {
            return View();
        }

        public ActionResult Command(string catchall)
        {
            if (!_actionMap.Contains("command/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Command", (object)catchall);
        }

        public ActionResult Commenting()
        {
            return View();
        }

        public ActionResult Comparing()
        {
            return View();
        }

        public ActionResult Config(string catchall)
        {
            if (!_actionMap.Contains("config/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Config", (object) catchall);
        }

        public ActionResult Confluence()
        {
            return View();
        }

        public ActionResult Conversion()
        {
            return View();
        }

        public ActionResult ConversionApi()
        {
            return View();
        }

        public ActionResult Example(string catchall)
        {
            if (!_actionMap.Contains("example/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Example", (object)catchall);
        }

        public ActionResult FAQ(string catchall)
        {
            if (!_actionMap.Contains("faq/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("FAQ", (object)catchall);
        }

        public ActionResult GetDocs()
        {
            return View();
        }

        public ActionResult DemoPreview()
        {
            var directoryInfo = new DirectoryInfo(Request.MapPath("~/app_data/editor"));

            var examples = directoryInfo.GetFiles("*.zip", SearchOption.TopDirectoryOnly).Select(fileInfo => fileInfo.Name).ToList();

            return View(examples);
        }

        public ActionResult Discovery()
        {
            return View();
        }

        public ActionResult DocumentBuilderApi()
        {
            return View();
        }

        public ActionResult Editor()
        {
            return View();
        }

        public ActionResult History()
        {
            return View();
        }

        public ActionResult HowItWorks()
        {
            return View();
        }

        public ActionResult HumHub()
        {
            return View();
        }

        public ActionResult InlineEditors()
        {
            return View();
        }

        public ActionResult Integrating()
        {
            return View();
        }
        
        public ActionResult Liferay()
        {
            return View();
        }

        public ActionResult Mentions()
        {
            return View();
        }

        public ActionResult Methods()
        {
            return View();
        }

        public ActionResult Nextcloud()
        {
            return View();
        }

        public ActionResult Nuxeo()
        {
            return View();
        }

        public ActionResult Open()
        {
            return View();
        }

        public ActionResult OwnCloud()
        {
            return View();
        }

        public ActionResult Plone()
        {
            return View();
        }

        public ActionResult Plugins()
        {
            return View();
        }

        public ActionResult PostMessage()
        {
            return View();
        }

        public ActionResult Rename()
        {
            return View();
        }

        public ActionResult RestApi()
        {
            return View();
        }

        public ActionResult Review()
        {
            return View();
        }

        public ActionResult Save()
        {
            return View();
        }

        public ActionResult Security()
        {
            return View();
        }

        public ActionResult SharePoint()
        {
            return View();
        }

        public ActionResult Signature(string catchall)
        {
            if (!_actionMap.Contains("signature/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("Signature", (object)catchall);
        }

        public ActionResult Troubleshooting()
        {
            return View();
        }

        public ActionResult Try()
        {
            return View();
        }

        public ActionResult WOPI(string catchall)
        {
            if (!_actionMap.Contains("wopi/" + catchall, StringComparer.OrdinalIgnoreCase))
            {
                catchall = null;
            }
            return View("WOPI", (object)catchall);
        }
    }
}