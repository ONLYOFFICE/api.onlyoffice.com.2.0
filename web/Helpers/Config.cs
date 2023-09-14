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
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;

using JWT;
using JWT.Algorithms;

using System.Text.RegularExpressions;
using System.Web.Configuration;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.Helpers
{
    [DataContract(Name = "EditorConfiguration", Namespace = "")]
    public class Config
    {
        public static string GetSignatureSecret()
        {
            var result = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";

            var regex = new Regex(@"^\s+$");

            if (regex.IsMatch(result))
                result = "";

            return result;
        }

        public class JwtSerializer : IJsonSerializer
        {
            private class CamelCaseExceptDictionaryKeysResolver : CamelCasePropertyNamesContractResolver
            {
                protected override JsonDictionaryContract CreateDictionaryContract(Type objectType)
                {
                    var contract = base.CreateDictionaryContract(objectType);

                    contract.DictionaryKeyResolver = propertyName => propertyName;

                    return contract;
                }
            }

            public string Serialize(object obj)
            {
                var settings = new JsonSerializerSettings
                {
                    ContractResolver = new CamelCaseExceptDictionaryKeysResolver(),
                    NullValueHandling = NullValueHandling.Ignore,
                };

                return JsonConvert.SerializeObject(obj, Formatting.Indented, settings);
            }

            public T Deserialize<T>(string json)
            {
                var settings = new JsonSerializerSettings
                {
                    ContractResolver = new CamelCaseExceptDictionaryKeysResolver(),
                    NullValueHandling = NullValueHandling.Ignore,
                };

                return JsonConvert.DeserializeObject<T>(json, settings);
            }
        }

        public static string Serialize(Config config)
        {
            var signatureSecret = GetSignatureSecret();

            if (!string.IsNullOrEmpty(signatureSecret))
            {
                var serializer = new JwtSerializer();
                var urlEncoder = new JwtBase64UrlEncoder();
                var algorithm = new HMACSHA256Algorithm();
                var encoder = new JwtEncoder(algorithm, serializer, urlEncoder);

                config.Token = encoder.Encode(config, signatureSecret);
            }

            using (var ms = new MemoryStream())
            {
                var serializer = new DataContractJsonSerializer(typeof (Config));
                serializer.WriteObject(ms, config);
                ms.Seek(0, SeekOrigin.Begin);
                return Encoding.UTF8.GetString(ms.GetBuffer(), 0, (int)ms.Length);
            }
        }


        [DataMember(Name = "document", IsRequired = true, EmitDefaultValue = false)]
        public DocumentConfig Document;

        [DataMember(Name = "documentType", IsRequired = true, EmitDefaultValue = false)]
        public string DocumentType;

        [DataMember(Name = "editorConfig", EmitDefaultValue = false)]
        public EditorConfigConfiguration EditorConfig;

        [DataMember(Name = "height", EmitDefaultValue = false)]
        public string Height;

        [DataMember(Name = "token", EmitDefaultValue = false)]
        public string Token;

        [DataMember(Name = "type", EmitDefaultValue = false)]
        public string TypeString;

        [DataMember(Name = "width", EmitDefaultValue = false)]
        public string Width;


        [DataContract(Name = "document", Namespace = "")]
        public class DocumentConfig
        {
            [DataMember(Name = "fileType", IsRequired = true, EmitDefaultValue = false)]
            public string FileType;

            [DataMember(Name = "info", EmitDefaultValue = false)]
            public InfoConfig Info;

            [DataMember(Name = "key", IsRequired = true, EmitDefaultValue = false)]
            public string Key;

            [DataMember(Name = "permissions", EmitDefaultValue = false)]
            public PermissionsConfig Permissions;

            [DataMember(Name = "title", IsRequired = true, EmitDefaultValue = false)]
            public string Title;

            [DataMember(Name = "url", IsRequired = true, EmitDefaultValue = false)]
            public string Url;


            [DataContract(Name = "info", Namespace = "")]
            public class InfoConfig
            {
                [DataMember(Name = "author", EmitDefaultValue = false)]
                public string Aouthor;

                [DataMember(Name = "created", EmitDefaultValue = false)]
                public string Created;

                [DataMember(Name = "folder", EmitDefaultValue = false)]
                public string Folder;

                [DataMember(Name = "sharingSettings", EmitDefaultValue = false)]
                public List<SharingSettingsItem> SharingSettings;

                [DataContract(Name = "sharingSettingsItem", Namespace = "")]
                public class SharingSettingsItem
                {
                    [DataMember(Name = "permissions", IsRequired = true, EmitDefaultValue = false)]
                    public string Permissions;

                    [DataMember(Name = "user", IsRequired = true, EmitDefaultValue = false)]
                    public string User;
                }
            }

            [DataContract(Name = "permissions", Namespace = "")]
            public class PermissionsConfig
            {
                [DataMember(Name = "comment", EmitDefaultValue = false)]
                public bool? Comment;

                [DataMember(Name = "commentGroups", EmitDefaultValue = false)]
                public CommentGroupsConfig CommentGroups;

                [DataMember(Name = "download", EmitDefaultValue = false)]
                public bool? Download;

                [DataMember(Name = "edit", EmitDefaultValue = false)]
                public bool? Edit;

                [DataMember(Name = "fillForms", EmitDefaultValue = false)]
                public bool? FillForms;

                [DataMember(Name = "modifyContentControl", EmitDefaultValue = false)]
                public bool? ModifyContentControl;

                [DataMember(Name = "modifyFilter", EmitDefaultValue = false)]
                public bool? ModifyFilter;

                [DataMember(Name = "print", EmitDefaultValue = false)]
                public bool? Print;

                [DataMember(Name = "review", EmitDefaultValue = false)]
                public bool? Review;

                [DataMember(Name = "reviewGroups", EmitDefaultValue = false)]
                public string[] ReviewGroups;

                [DataContract(Name = "customization", Namespace = "")]
                public class CommentGroupsConfig
                {
                    [DataMember(Name = "edit", EmitDefaultValue = false)]
                    public string[] Edit;

                    [DataMember(Name = "remove", EmitDefaultValue = false)]
                    public string[] Remove;

                    [DataMember(Name = "view", EmitDefaultValue = false)]
                    public string[] View;
                }
            }
        }

        [DataContract(Name = "editorConfig", Namespace = "")]
        public class EditorConfigConfiguration
        {
            [DataMember(Name = "callbackUrl", EmitDefaultValue = false)]
            public string CallbackUrl;

            [DataMember(Name = "createUrl", EmitDefaultValue = false)]
            public string CreateUrl;

            [DataMember(Name = "customization", EmitDefaultValue = false)]
            public CustomizationConfig Customization;

            [DataMember(Name = "embedded", EmitDefaultValue = false)]
            public EmbeddedConfig Embedded;

            [DataMember(Name = "fileChoiceUrl", EmitDefaultValue = false)]
            public string FileChoiceUrl;

            [DataMember(Name = "lang", EmitDefaultValue = false)]
            public string Lang;

            [DataMember(Name = "mergeFolderUrl", EmitDefaultValue = false)]
            public string MergeFolderUrl;

            [DataMember(Name = "mode", EmitDefaultValue = false)]
            public string Mode;

            [DataMember(Name = "plugins", EmitDefaultValue = false)]
            public PluginsConfig Plugins;

            [DataMember(Name = "sharingSettingsUrl", EmitDefaultValue = false)]
            public string SharingSettingsUrl;

            [DataMember(Name = "recent", EmitDefaultValue = false)]
            public List<RecentItem> Recent;

            [DataMember(Name = "templates", EmitDefaultValue = false)]
            public List<TemplatesConfig> Templates;

            [DataMember(Name = "user", EmitDefaultValue = false)]
            public UserConfig User;


            [DataContract(Name = "customization", Namespace = "")]
            public class CustomizationConfig
            {
                [DataMember(Name = "anonymous", EmitDefaultValue = false)]
                public AnonymousConfig Anonymous;

                [DataMember(Name = "about", EmitDefaultValue = false)]
                public bool? About;

                [DataMember(Name = "autosave", EmitDefaultValue = false)]
                public bool? Autosave;

                [DataMember(Name = "chat", EmitDefaultValue = false)]
                public bool? Chat;

                [DataMember(Name = "compactHeader", EmitDefaultValue = false)]
                public bool? CompactHeader;

                [DataMember(Name = "compactToolbar", EmitDefaultValue = false)]
                public bool? CompactToolbar;

                [DataMember(Name = "customer", EmitDefaultValue = false)]
                public CustomerConfig Customer;

                [DataMember(Name = "feedback", EmitDefaultValue = false)]
                public FeedbackConfig Feedback;

                [DataMember(Name = "forcesave", EmitDefaultValue = false)]
                public bool? Forcesave;

                [DataMember(Name = "goback", EmitDefaultValue = false)]
                public GobackConfig Goback;

                [DataMember(Name = "hideRightMenu", EmitDefaultValue = false)]
                public bool? HideRightMenu;

                [DataMember(Name = "hideRulers", EmitDefaultValue = false)]
                public bool? HideRulers;

                [DataMember(Name = "integrationMode", EmitDefaultValue = false)]
                public string IntegrationMode;

                [DataMember(Name = "logo", EmitDefaultValue = false)]
                public LogoConfig Logo;

                [DataMember(Name = "showReviewChanges", EmitDefaultValue = false)]
                public bool? ShowReviewChanges;

                [DataMember(Name = "toolbarHideFileName", EmitDefaultValue = false)]
                public bool? ToolbarHideFileName;

                [DataMember(Name = "toolbarNoTabs", EmitDefaultValue = false)]
                public bool? ToolbarNoTabs;

                [DataMember(Name = "zoom", EmitDefaultValue = false)]
                public int Zoom;


                [DataContract(Name = "anonymous", Namespace = "")]
                public class AnonymousConfig
                {
                    [DataMember(Name = "request")]
                    public bool Request;
                }


                [DataContract(Name = "customer", Namespace = "")]
                public class CustomerConfig
                {
                    [DataMember(Name = "address", EmitDefaultValue = false)]
                    public string Address;

                    [DataMember(Name = "info", EmitDefaultValue = false)]
                    public string Info;

                    [DataMember(Name = "logo", EmitDefaultValue = false)]
                    public string Logo;

                    [DataMember(Name = "mail", EmitDefaultValue = false)]
                    public string Mail;

                    [DataMember(Name = "name", EmitDefaultValue = false)]
                    public string Name;

                    [DataMember(Name = "www", EmitDefaultValue = false)]
                    public string Www;
                }

                [DataContract(Name = "feedback", Namespace = "")]
                public class FeedbackConfig
                {
                    [DataMember(Name = "url", EmitDefaultValue = false)]
                    public string Url;

                    [DataMember(Name = "visible", EmitDefaultValue = false)]
                    public bool? Visible;
                }

                [DataContract(Name = "goback", Namespace = "")]
                public class GobackConfig
                {
                    [DataMember(Name = "text", EmitDefaultValue = false)]
                    public string Text;

                    [DataMember(Name = "url", EmitDefaultValue = false)]
                    public string Url;
                }

                [DataContract(Name = "logo", Namespace = "")]
                public class LogoConfig
                {
                    [DataMember(Name = "image", EmitDefaultValue = false)]
                    public string Image;

                    [DataMember(Name = "imageEmbedded", EmitDefaultValue = false)]
                    public string ImageEmbedded;

                    [DataMember(Name = "url", EmitDefaultValue = false)]
                    public string Url;
                }
            }

            [DataContract(Name = "embedded", Namespace = "")]
            public class EmbeddedConfig
            {
                [DataMember(Name = "embedUrl", EmitDefaultValue = false)]
                public string EmbedUrl;

                [DataMember(Name = "fullscreenUrl", EmitDefaultValue = false)]
                public string FullscreenUrl;

                [DataMember(Name = "saveUrl", EmitDefaultValue = false)]
                public string SaveUrl;

                [DataMember(Name = "shareUrl", EmitDefaultValue = false)]
                public string ShareUrl;

                [DataMember(Name = "toolbarDocked", EmitDefaultValue = false)]
                public string ToolbarDocked;
            }

            [DataContract(Name = "PluginsConfig", Namespace = "")]
            public class PluginsConfig
            {
                [DataMember(Name = "pluginsData", IsRequired = true, EmitDefaultValue = false)]
                public List<string> PluginsData;
            }

            [DataContract(Name = "RecentItem", Namespace = "")]
            public class RecentItem
            {
                [DataMember(Name = "folder", EmitDefaultValue = false)]
                public string Folder;

                [DataMember(Name = "title", IsRequired = true, EmitDefaultValue = false)]
                public string Title;

                [DataMember(Name = "url", IsRequired = true, EmitDefaultValue = false)]
                public string Url;
            }

            [DataContract(Name = "templates", Namespace = "")]
            public class TemplatesConfig
            {
                [DataMember(Name = "icon", EmitDefaultValue = false)]
                public string Icon;

                [DataMember(Name = "name", IsRequired = true, EmitDefaultValue = false)]
                public string Name;

                [DataMember(Name = "url", IsRequired = true, EmitDefaultValue = false)]
                public string Url;
            }

            [DataContract(Name = "user", Namespace = "")]
            public class UserConfig
            {
                [DataMember(Name = "id", EmitDefaultValue = false)]
                public string Id;

                [DataMember(Name = "name", EmitDefaultValue = false)]
                public string Name;
            }
        }
    }
}