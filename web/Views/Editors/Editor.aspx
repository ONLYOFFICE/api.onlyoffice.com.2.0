<%@ Page
    Title=""
    Language="C#"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <title>ONLYOFFICE Api Documentation</title>
</head>
<body style="height: 100%; margin: 0;">

    <div id="placeholder" style="height: 100%"></div>
    <script type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <script type="text/javascript">
        <% switch (Request["method"])
           { %>

        <% case "docxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxfEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docxf",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Form Template Title.docxf",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docxf"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        DocumentType = "cell",
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        DocumentType = "slide",
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "doc",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.doc",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.doc"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xls",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xls",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xls"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ppt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.ppt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ppt"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.odt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odt"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odsEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "ods",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.ods",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.ods"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "odpEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "odp",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.odp",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.odp"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "txtEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "txt",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.txt",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.txt"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "csvEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "csv",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.csv",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.csv"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pdfViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pdf",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.pdf",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pdf"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxViewer": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxStrictCoediting": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Request["key"],
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Autosave = false
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingDocxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingXlsxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "rebrandingPptxEditor": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        Customer = new Config.EditorConfigConfiguration.CustomizationConfig.CustomerConfig
                                            {
                                                Address = "My City, 123a-45",
                                                Info = "Some additional information",
                                                Logo = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo-big.png"), Query = ""}.ToString(),
                                                Mail = "john@example.com",
                                                Name = "John Smith and Co.",
                                                Www = "example.com"
                                            },
                                        Logo = new Config.EditorConfigConfiguration.CustomizationConfig.LogoConfig
                                            {
                                                Image = new UriBuilder(Request.Url.AbsoluteUri) {Path = Url.Content("~/content/img/editor/rebranding/logo.png"), Query = ""}.ToString(),
                                                Url = "https://example.com"
                                            }
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxReview": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = false,
                                        Review = true
                                    }
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    })%>
            );
        <% break; %>

        <% case "docxReviewGroups": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "review.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = true,
                                        Review = true,
                                        ReviewGroups = new[] { "group-3", "" }
                                    }
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    })%>
            );
        <% break; %>

        <% case "fillForms": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "oform",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Form Title.oform",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.oform",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = false,
                                        FillForms = true
                                    }
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "pptxComment": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Comment = true,
                                        Edit = false
                                    }
                            },
                        DocumentType = "slide",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxCommentGroups": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                {
                    Document = new Config.DocumentConfig
                    {
                        FileType = "docx",
                        Key = "apiwh" + Guid.NewGuid(),
                        Title = "Example Document Title.docx",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "comment.docx",
                        Permissions = new Config.DocumentConfig.PermissionsConfig
                        {
                            Comment = true,
                            CommentGroups = new Config.DocumentConfig.PermissionsConfig.CommentGroupsConfig
                            {
                                Edit = new[] { "group-2", "" },
                                Remove = new [] { "group-2"}
                            },
                            Edit = false
                        }
                    },
                    DocumentType = "word",
                    EditorConfig = new Config.EditorConfigConfiguration
                    {
                        CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                        {
                            Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = false
                            }
                        },
                        Mode = "edit"
                    },
                    Height = "100%",
                    Width = "100%"
                }) %>
            );
        <% break; %>

        <% case "modifyFilter": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Request["key"],
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo-filter.xlsx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        ModifyFilter = false
                                    }
                            },
                        DocumentType = "cell",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                User = new Config.EditorConfigConfiguration.UserConfig
                                    {
                                        Id = Guid.NewGuid().ToString(),
                                        Name = Request["name"]
                                    }
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "modifyContentControl": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo-form.docx",
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Edit = true,
                                        ModifyContentControl = false
                                    }
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "edit"
                            },
                        Height = "100%",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxEditorMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxEditorMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        DocumentType = "cell",
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
        );
        <% break; %>

        <% case "pptxEditorMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    }
                            },
                        DocumentType = "slide",
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxViewerMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxViewerMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        DocumentType = "cell",
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
        );
        <% break; %>

        <% case "pptxViewerMobile": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            }
                                    },
                                Mode = "view"
                            },
                        DocumentType = "slide",
                        Height = "100%",
                        TypeString = "mobile",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "docxEmbed": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "docx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Document Title.docx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.docx"
                            },
                        DocumentType = "word",
                        Height = "100%",
                        TypeString = "embedded",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% case "xlsxEmbed": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "xlsx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Spreadsheet Title.xlsx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.xlsx"
                            },
                        DocumentType = "cell",
                        Height = "100%",
                        TypeString = "embedded",
                        Width = "100%"
                    }) %>
        );
        <% break; %>

        <% case "pptxEmbed": %>
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = "pptx",
                                Key = "apiwh" + Guid.NewGuid(),
                                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                                Title = "Example Presentation Title.pptx",
                                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo.pptx"
                            },
                        DocumentType = "slide",
                        Height = "100%",
                        TypeString = "embedded",
                        Width = "100%"
                    }) %>
            );
        <% break; %>

        <% } %>
    </script>
</body>
</html>
