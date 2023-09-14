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
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Serialization;

using ASC.Api.Web.Help.Extensions;
using ASC.Api.Web.Help.Helpers;
using log4net;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    [DataContract(Name = "response", Namespace = "")]
    public class MsDocFunctionResponse
    {
        [DataMember(Name = "output")]
        public Dictionary<string, string> Outputs { get; set; }
    }

    public class result : IXmlSerializable
    {
        public int status = 0;
        public object response;

        private Dictionary<string, object> dic = new Dictionary<string, object>();
        private List<object> list = new List<object>();

        public result()
        {

        }

        public XmlSchema GetSchema()
        {
            return null;
        }

        public void ReadXml(XmlReader reader)
        {
            throw new NotImplementedException();
        }

        public void WriteXml(XmlWriter writer)
        {
            writer.WriteElementString("status", "0");

            if (response.GetType().Name == dic.GetType().Name)
            {
                writer.WriteStartElement("response");
                foreach (KeyValuePair<string, object> keyValue in (Dictionary<string, object>)response)
                {
                    SaveDictionary(writer, keyValue);
                }
                writer.WriteEndElement();
            }
            else if (response.GetType().Name == list.GetType().Name)
            {
                var w1 = response.GetType();
                foreach (var elem in (List<object>)response)
                {
                    SaveList(writer, elem, "response");
                }
            }

        }

        private void SaveDictionary(XmlWriter writer, KeyValuePair<string, object> keyValue)
        {
            if (keyValue.Value != null)
            {
                if (keyValue.Value.GetType().Name == dic.GetType().Name)
                {
                    writer.WriteStartElement(keyValue.Key);
                    foreach (KeyValuePair<string, object> keyValue1 in (Dictionary<string, object>)keyValue.Value)
                    {
                        SaveDictionary(writer, keyValue1);
                    }
                    writer.WriteEndElement();
                }
                else if (keyValue.Value.GetType().Name == list.GetType().Name)
                {
                    foreach (var elem in (List<object>)keyValue.Value)
                    {
                        SaveList(writer, elem, keyValue.Key);
                    }
                }
                else
                {
                    writer.WriteElementString(keyValue.Key, keyValue.Value.ToString());
                }
            }
            else
            {
                writer.WriteElementString(keyValue.Key, null);
            }
        }

        private void SaveList(XmlWriter writer, object elem, string nameList)
        {
            if (elem != null)
            {
                if (elem.GetType().Name == dic.GetType().Name)
                {
                    writer.WriteStartElement(nameList);
                    foreach (KeyValuePair<string, object> keyValue1 in (Dictionary<string, object>)elem)
                    {
                        SaveDictionary(writer, keyValue1);
                    }
                    writer.WriteEndElement();
                }
                else if (elem.GetType().Name == list.GetType().Name)
                {
                    writer.WriteStartElement(nameList);
                    foreach (var elem1 in (List<object>)elem)
                    {
                        SaveList(writer, elem1, nameList);
                    }
                    writer.WriteEndElement();
                }
                else
                {
                    writer.WriteElementString(nameList, elem.ToString());
                }
            }
            else
            {
                writer.WriteElementString(nameList, null);
            }
        }
    }

    [DataContract(Name = "entrypoint", Namespace = "")]
    public class MsDocEntryPoint
    {
        [DataMember(Name = "summary")]
        public string Summary { get; set; }

        [DataMember(Name = "remarks")]
        public string Remarks { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }

        [DataMember(Name = "example")]
        public string Example { get; set; }

        [DataMember(Name = "functions")]
        public List<MsDocEntryPointMethod> Methods { get; set; }
    }

    [DataContract(Name = "function", Namespace = "")]
    public class MsDocEntryPointMethod : IEquatable<MsDocEntryPointMethod>
    {
        [DataMember(Name = "summary")]
        public string Summary { get; set; }

        [DataMember(Name = "authentification", EmitDefaultValue = true)]
        public bool Authentification { get; set; }

        [DataMember(Name = "remarks")]
        public string Remarks { get; set; }

        [DataMember(Name = "httpmethod")]
        public string HttpMethod { get; set; }

        [DataMember(Name = "url")]
        public string Path { get; set; }

        [DataMember(Name = "example")]
        public string Example { get; set; }

        [DataMember(Name = "params")]
        public List<MsDocEntryPointMethodParams> Params { get; set; }

        [DataMember(Name = "returns")]
        public string Returns { get; set; }

        [DataMember(Name = "responses")]
        public List<MsDocFunctionResponse> Response { get; set; }

        [DataMember(Name = "category")]
        public string Category { get; set; }

        [DataMember(Name = "notes")]
        public string Notes { get; set; }

        [DataMember(Name = "short")]
        public string ShortName { get; set; }

        [IgnoreDataMember]
        private string _functionName;

        [DataMember(Name = "function")]
        public string FunctionName
        {
            get { return !string.IsNullOrEmpty(ShortName) ? ShortName.Trim() : _functionName; }
            set { _functionName = value.Trim(); }
        }

        public MsDocEntryPoint Parent { get; set; }

        [DataMember(Name = "visible")]
        public bool Visible { get; set; }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != typeof(MsDocEntryPointMethod)) return false;
            return Equals((MsDocEntryPointMethod)obj);
        }

        public bool Equals(MsDocEntryPointMethod other)
        {
            if (ReferenceEquals(null, other)) return false;
            if (ReferenceEquals(this, other)) return true;
            return Equals(other.Path, Path) && Equals(other.HttpMethod, HttpMethod);
        }

        public override string ToString()
        {
            return string.Format("{0} {1}", HttpMethod, Path).ToLowerInvariant();
        }

        public override int GetHashCode()
        {
            unchecked
            {
                return ((Path != null ? Path.GetHashCode() : 0) * 397) ^ (HttpMethod != null ? HttpMethod.GetHashCode() : 0);
            }
        }

        public static bool operator ==(MsDocEntryPointMethod left, MsDocEntryPointMethod right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(MsDocEntryPointMethod left, MsDocEntryPointMethod right)
        {
            return !Equals(left, right);
        }
    }

    [DataContract(Name = "param", Namespace = "")]
    public class MsDocEntryPointMethodParams
    {

        [DataMember(Name = "name")]
        public string Name { get; set; }

        [DataMember(Name = "type")]
        public string Type { get; set; }

        [DataMember(Name = "sendmethod")]
        public string Method { get; set; }

        [DataMember(Name = "description")]
        public string Description { get; set; }

        [DataMember(Name = "remarks")]
        public string Remarks { get; set; }

        [DataMember(Name = "optional")]
        public bool IsOptional { get; set; }

        [DataMember(Name = "visible")]
        public bool Visible { get; set; }

        [DataMember(Name = "file")]
        public string File { get; set; }

        [DataMember(Name = "assembly")]
        public string Assembly { get; set; }

        public List<MsDocEntryPointMethodParams> Dto { get; set; }
    }

    public class MsDocDocumentGenerator
    {
        internal const string SystemNullable = "System.Nullable{";
        internal const string SystemIEnumerable = "System.Collections.Generic.IEnumerable{";
        internal const string SystemList = "System.Collections.Generic.List{";

        private readonly string _basePath;
        private readonly List<MsDocEntryPoint> _points = new List<MsDocEntryPoint>();

        private readonly ClassNamePluralizer _classPluralizer;

        private static ILog _logger;

        public MsDocDocumentGenerator(string basePath, ClassNamePluralizer classPluralizer, ILog logger)
        {
            _basePath = basePath;
            _logger = logger;

            _classPluralizer = classPluralizer;
        }

        #region IApiDocumentGenerator Members

        public List<MsDocEntryPoint> Points
        {
            get { return _points; }
        }

        private void SaveMembers(XElement entryPointDoc, List<XElement> memberdesc)
        {
            var root = new MsDocEntryPoint
            {
                Summary = entryPointDoc.Element("summary").ValueOrNull(),
                Remarks = entryPointDoc.Element("remarks").ValueOrNull(),
                Name = entryPointDoc.Element("name").ValueOrNull(),
                Example = entryPointDoc.Element("example").ValueOrNull(),
                Methods = new List<MsDocEntryPointMethod>()
            };
            for (int i = 0; i < memberdesc.Count; i++)
            {
                try
                {
                    var methodParams = memberdesc[i].Elements("param").ToList();
                    var pointMethod = new MsDocEntryPointMethod
                    {
                        Path = memberdesc[i].Element("path").ValueOrNull(),
                        HttpMethod = memberdesc[i].Element("httpMethod").ValueOrNull(),
                        Authentification = string.IsNullOrWhiteSpace(memberdesc[i].Element("requiresAuthorization").ValueOrNull()) || memberdesc[i].Element("requiresAuthorization").ValueOrNull().Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase),
                        FunctionName = GetFunctionName(memberdesc[i].Attribute("name").ValueOrNull()),
                        Summary = memberdesc[i].Element("summary").ValueOrNull(),
                        Visible = !string.Equals(memberdesc[i].Element("visible").ValueOrNull(), bool.FalseString, StringComparison.OrdinalIgnoreCase),
                        Remarks = memberdesc[i].Element("remarks").ValueOrNull().Replace(Environment.NewLine, @"<br />"),
                        Returns = memberdesc[i].Element("returns").ValueOrNull(),
                        Example = memberdesc[i].Element("example").ValueOrNull().Replace(Environment.NewLine, @"<br />"),
                        Response = GetResponse(memberdesc[i].Element("returns"), memberdesc[i].Element("collection").ValueOrNull()),
                        Category = memberdesc[i].Element("category").ValueOrNull(),
                        Notes = memberdesc[i].Element("notes").ValueOrNull(),
                        ShortName = memberdesc[i].Element("short").ValueOrNull(),
                        Params = new List<MsDocEntryPointMethodParams>()
                    };
                    for (int j = 0; j < methodParams.Count; j++)
                    {
                        try
                        {
                            var param = new MsDocEntryPointMethodParams
                            {
                                Description = methodParams[j].ValueOrNull(),
                                Name = methodParams[j].Attribute("name").ValueOrNull(),
                                Remarks = methodParams[j].Attribute("remark").ValueOrNull(),
                                IsOptional = string.Equals(methodParams[j].Attribute("optional").ValueOrNull(), bool.TrueString, StringComparison.OrdinalIgnoreCase),
                                Visible = !string.Equals(methodParams[j].Attribute("visible").ValueOrNull(), bool.FalseString, StringComparison.OrdinalIgnoreCase),
                                Type = GetType(pointMethod.Params.Count, memberdesc[i].Attribute("name").ValueOrNull()),
                                Method = methodParams[j].Attribute("method") != null ? methodParams[j].Attribute("method").ValueOrNull() : "body",
                                File = methodParams[j].Attribute("file").ValueOrNull(),
                                Assembly = GetAssembly(methodParams[j].Attribute("type").ValueOrNull())
                            };

                            if (param.Type.StartsWith("`"))
                            {
                                var xmlType = GetTypeFromXml(methodParams[j].Attribute("type").ValueOrNull());
                                if (xmlType != null)
                                {
                                    param.Type = xmlType;
                                }
                            }
                            pointMethod.Params.Add(param);
                        }
                        catch (Exception ex)
                        {
                            _logger.Error($"Couldn't parse parameters for method: {pointMethod.Path}\n{memberdesc[i].Attribute("name").Value}", ex);
                        }
                    }
                    if (pointMethod.Visible)
                    {
                        root.Methods.Add(pointMethod);
                    }
                }
                catch (Exception ex)
                {
                    _logger.Error($"Couldn't parse method: {memberdesc[i].Attribute("name").Value}", ex);
                }
            }
            if (!root.Methods.Any()) return;
            foreach (var point in Points)
            {
                if (point.Name == root.Name)
                {
                    point.Methods = point.Methods.Union(root.Methods).ToList();
                    return;
                }
            }
            Points.Add(root);
        }

        public void GenerateDocForEntryPoint(string file)
        {
            var members = XDocument.Load(file).Root.ThrowIfNull(new ArgumentException("Bad documentation file " + file)).Element("members").Elements("member");
            XElement entryPointDoc = null;
            List<XElement> memberdesc = new List<XElement>();
            foreach (var member in members)
            {
                if (member.Element("name") != null)
                {
                    if (entryPointDoc == null)
                    {
                        entryPointDoc = member;
                    }
                    else
                    {
                        if (member.Element("path") == null)
                        {
                            SaveMembers(entryPointDoc, memberdesc);
                            memberdesc.Clear();
                            entryPointDoc = member;
                        }
                    }
                }
                else if (member.Element("path") != null)
                {
                    memberdesc.Add(member);
                }
            }
            if (entryPointDoc != null)
            {
                SaveMembers(entryPointDoc, memberdesc);
            }
        }

        private List<MsDocEntryPointMethodParams> ExpandDto(string type, string file)
        {
            var xml = Path.Combine(_basePath, file + ".xml");
            if (!File.Exists(xml)) return null;
            var members = XDocument.Load(xml).Root.ThrowIfNull(new ArgumentException("Bad documentation file " + xml)).Element("members").Elements("member");

            var needMembers = members.Where(mem => IsMember(mem, type)).ToList();
            var inherited = members.Where(mem => IsInherited(mem, type)).SingleOrDefault();
            var result = new List<MsDocEntryPointMethodParams>();
            if (inherited != null && inherited.Element("inherited") != null)
            {
                var split = inherited.Element("inherited").ValueOrNull().Split(',');
                needMembers = GetInherited(split[0].Trim(), split[1].Trim(), needMembers);
            }

            foreach(var member in needMembers)
            {
                var name = member.Attribute("name").ValueOrNull();
                if (!string.IsNullOrWhiteSpace(name)) {
                    var param = new MsDocEntryPointMethodParams()
                    {
                        Name = name.Split('.').Last(),
                        Description = member.Element("summary").ValueOrNull(),
                        Type = member.Element("type").ValueOrNull(),
                        Visible = true
                    };
                    if (!string.IsNullOrWhiteSpace(param.Type))
                    {
                        param.Type = param.Type.Split(',').First();
                    }
                    result.Add(param);
                }
            }

            return result;
        }

        private List<MsDocFunctionResponse> GetResponse(XElement element, string collection)
        {
            List<MsDocFunctionResponse> response = new List<MsDocFunctionResponse>();
            var msdoc = new MsDocFunctionResponse();
            if (element != null && element.Attribute("type").ValueOrNull() != "")
            {
                var split = element.Attribute("type").ValueOrNull().Split(',');
                var resp = GetResponse(split[0].Trim(), split[1].Trim());
                if (resp != null)
                {
                    var result = new result();
                    if (collection == "list")
                    {
                        var list = new List<object>();
                        list.Add(resp);
                        result.response = list;
                    }
                    else
                    {
                        result.response = resp;
                    }

                    var responsejson = JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

                    msdoc.Outputs = new Dictionary<string, string>();
                    msdoc.Outputs.Add("application/json", responsejson);
                    XmlSerializer xmlSerializer = new XmlSerializer(result.GetType());

                    using (StringWriter textWriter = new StringWriter())
                    {
                        xmlSerializer.Serialize(textWriter, result);
                        var text = textWriter.ToString();
                        text = text.Remove(0, text.IndexOf('\n') + 1);
                        msdoc.Outputs.Add("text/xml", text);
                    }
                }
                else
                {
                    return response;
                }
                response.Add(msdoc);
            }
            return response;
        }

        private Dictionary<string, object> Sorted(Dictionary<string, object> response, Dictionary<string, int> orders)
        {
            Dictionary<string, object> SortedResponse = new Dictionary<string, object>();
            foreach (var pair in orders.OrderBy(pair => pair.Value))
            {
                SortedResponse.Add(pair.Key, response[pair.Key]);
            }
            return SortedResponse;
        }

        private Dictionary<string, object> GetResponse(string type, string file)
        {
            var xml = Path.Combine(_basePath, file + ".xml");
            if (!File.Exists(xml)) return null;
            var members = XDocument.Load(xml).Root.ThrowIfNull(new ArgumentException("Bad documentation file " + xml)).Element("members").Elements("member");
            var needMembers = members.Where(mem => IsMember(mem, type)).ToList();
            var inherited = members.Where(mem => IsInherited(mem, type)).SingleOrDefault();
            Dictionary<string, object> responseParam = null;
            if (inherited != null && inherited.Element("inherited") != null)
            {
                var split = inherited.Element("inherited").ValueOrNull().Split(',');
                needMembers = GetInherited(split[0].Trim(), split[1].Trim(), needMembers);
            }
            if (needMembers.Count != 0)
            {
                responseParam = new Dictionary<string, object>();
                var orders = new Dictionary<string, int>();
                Parse(needMembers, responseParam, orders);

                responseParam = Sorted(responseParam, orders);
            }
            return responseParam;
        }

        private void Parse(List<XElement> needMembers, Dictionary<string, object> responseParam, Dictionary<string, int> orders)
        {
            needMembers.ForEach(member =>
            {
                object result;
                var defaultName = "";
                if (member.Attribute("name").ValueOrNull() != "")
                {
                    defaultName = member.Attribute("name").ValueOrNull().Split('.').Last();
                }
                if (member.Element("example") != null)
                {

                    var name = member.Element("example").Attribute("name").ValueOrNull() == "" ? defaultName : member.Element("example").Attribute("name").ValueOrNull();
                    if (Boolean.TryParse(member.Element("example").ValueOrNull(), out bool resultBool))
                    {
                        result = resultBool;
                    }
                    else if (member.Element("example").Attribute("type").ValueOrNull() == "int" && Int32.TryParse(member.Element("example").ValueOrNull(), out int resultInt))
                    {
                        result = resultInt;
                    }
                    else if (member.Element("example").Attribute("type").ValueOrNull() == "double" && Double.TryParse(member.Element("example").ValueOrNull().Replace('.', ','), out double resultdouble))
                    {
                        result = resultdouble;
                    }
                    else
                    {
                        result = member.Element("example").ValueOrNull().Replace("            ", "");

                        if (result.Equals("null"))
                        {
                            result = null;
                        }
                    }
                    if (member.Element("collection").ValueOrNull() == "list")
                    {
                        var list = new List<object>();

                        if (member.Element("collection").Attribute("split").ValueOrNull() != "")
                        {
                            var split = member.Element("collection").Attribute("split").ValueOrNull()[0];
                            list = result.ToString().Split(split).ToList<object>();
                        }
                        else
                        {
                            list.Add(result);
                        }
                        responseParam.Add(name, list);
                    }
                    else
                    {
                        responseParam.Add(name, result);
                    }
                    var order = member.Element("order").ValueOrNull() == "" ? 1000 : Int32.Parse(member.Element("order").ValueOrNull());
                    orders.Add(name, order);
                }
                else if (member.Element("type") != null)
                {
                    var name = member.Element("type").Attribute("name").ValueOrNull() == "" ? defaultName : member.Element("type").Attribute("name").ValueOrNull();
                    var split = member.Element("type").ValueOrNull().Split(',');
                    var newMembers = GetResponse(split[0], split[1].Trim());

                    if (newMembers != null)
                    {
                        if (member.Element("collection").ValueOrNull() == "list")
                        {
                            var list = new List<object>
                            {
                                newMembers
                            };
                            responseParam.Add(name, list);
                        }
                        else
                        {
                            responseParam.Add(name, newMembers);
                        }

                        var order = member.Element("order").ValueOrNull() == "" ? 1000 : Int32.Parse(member.Element("order").ValueOrNull());
                        orders.Add(name, order);
                    }
                    else
                    {
                        var type = _classPluralizer.ToHumanName(split[0]);
                        if (type.JsonParam != null)
                        {
                            responseParam.Add(name, type.JsonParam);

                            var order = member.Element("order").ValueOrNull() == "" ? 1000 : Int32.Parse(member.Element("order").ValueOrNull());
                            orders.Add(name, order);
                        }
                    }
                }
                else if (member.Element("object") != null)
                {
                    var name = member.Element("object").Attribute("name").ValueOrNull() == "" ? defaultName : member.Element("object").Attribute("name").ValueOrNull();
                    var elements = member.Element("object").Elements().ToList();
                    var responseParam1 = new Dictionary<string, object>();
                    var orders1 = new Dictionary<string, int>();
                    Parse(elements, responseParam1, orders1);
                    if (member.Element("collection").ValueOrNull() == "list")
                    {
                        var list = new List<object>();
                        list.Add(responseParam1);
                        responseParam.Add(name, list);
                    }
                    else
                    {
                        responseParam.Add(name, responseParam1);
                    }
                    var order = member.Element("order").ValueOrNull() == "" ? 1000 : Int32.Parse(member.Element("order").ValueOrNull());
                    orders.Add(name, order);
                }
            });
        }

        private bool IsMember(XElement mem, string type)
        {
            var member = mem.Attribute("name").ValueOrNull();
            if (member.Contains('`'))
            {
                var split = member.Split('`');
                member = member.Split('`')[0];
                var dotPos = split[1].IndexOf('.');
                if (dotPos > 0)
                {
                    member += split[1].Substring(dotPos);
                }
            }
            if (member.Contains("P:" + type + ".") || member.Contains("F:" + type + "."))
            {
                return member.Split('.').Length == type.Split('.').Length + 1;
            }
            else
            {
                return false;
            }
        }

        private bool IsInherited(XElement mem, string type)
        {
            return mem.Attribute("name").ValueOrNull().Equals("T:" + type);
        }

        private List<XElement> GetInherited(string type, string file, List<XElement> needMembers)
        {
            var xml = Path.Combine(_basePath, file + ".xml");
            var members = XDocument.Load(xml).Root.ThrowIfNull(new ArgumentException("Bad documentation file " + xml)).Element("members").Elements("member");
            var needMembers1 = members.Where(mem => IsMember(mem, type)).ToList();
            var inherited = members.Where(mem => IsInherited(mem, type)).SingleOrDefault();

            if (inherited != null && inherited.Element("inherited") != null)
            {
                var split = inherited.Element("inherited").ValueOrNull().Split(',');
                needMembers = GetInherited(split[0].Trim(), split[1].Trim(), needMembers);
            }
            return needMembers.Union(needMembers1).ToList();
        }

        private string GetType(int number, string name)
        {
            var types = name.Split('(')[1].Split(')')[0].Split(',').ToList();
            for (int i = 0; i < types.Count; i++)
            {
                if (types[i].Contains("{") && !types[i].Contains("}"))
                {
                    types[i] = types[i] + "," + types[i + 1];
                    types.RemoveAt(i + 1);
                }
            }
            return types[number];
        }

        private string GetTypeFromXml(string type)
        {
            if (type == null) return null;
            if (string.IsNullOrWhiteSpace(type)) return null;

            var split = type.Split(',');
            var assembly = split[0].Trim();

            return assembly;
        }

        private string GetAssembly(string type)
        {
            if (type == null) return null;
            if (string.IsNullOrWhiteSpace(type)) return null;

            var split = type.Split(',');
            if (split.Length > 1)
            {
                var assembly = split[1].Trim();
                if (assembly != "System") return assembly;
            }

            return null;
        }

        public void GenerateRequestExample(MsDocEntryPointMethod method)
        {
            var sb = new StringBuilder();
            var visible = method.Params.Where(p => p.Visible).ToDictionary(p => p, p =>
            {
                var humanName = _classPluralizer.ToHumanName(p.Type);
                if (humanName.JsonParam == null)
                {
                    var jsonParam = GetJsonParam(p.Type);
                    if (jsonParam != null)
                    {
                        humanName.JsonParam = jsonParam;
                    }
                }

                if (!string.IsNullOrWhiteSpace(p.File) || !string.IsNullOrWhiteSpace(p.Assembly))
                {
                    var assembly = string.IsNullOrWhiteSpace(p.File) ? p.Assembly : p.File;

                    var responseParam = new Dictionary<string, object>();
                    var orders = new Dictionary<string, int>();
                    var humanNameAssembly = new TypeDescription(p.Type, "");
                    humanNameAssembly.JsonParam = GetResponse(GetOnlyName(p.Type), assembly);
                    if (p.Type.StartsWith(SystemIEnumerable) || p.Type.StartsWith(SystemList))
                    {
                        var list = new List<object>();
                        list.Add(humanNameAssembly.JsonParam);
                        humanNameAssembly.JsonParam = list;
                    }

                    if ((string.IsNullOrWhiteSpace(humanName.ExampleJson) && !string.IsNullOrWhiteSpace(humanNameAssembly.ExampleJson))
                        || humanName.JsonParam == null && humanNameAssembly.JsonParam != null)
                    {
                        humanName = humanNameAssembly;
                    }

                    if (p.Name == "inDto" && p.Dto == null)
                    {
                        p.Dto = ExpandDto(GetOnlyName(p.Type), assembly);
                    }
                }

                return humanName;
            });
            var urlParams = visible.Where(p => p.Key.Method == "url").ToList();
            var bodyParams = visible.Except(urlParams).ToList();
            var path = method.Path.ToLowerInvariant();
            var query = false;
            urlParams.ForEach(p =>
            {
                if (p.Value.JsonParam == null)
                {
                    return;
                }
                if (path.IndexOf('{' + p.Key.Name.ToLowerInvariant() + '}') > 0)
                {
                    path = path.Replace('{' + p.Key.Name.ToLowerInvariant() + '}', HttpUtility.UrlEncode(JsonConvert.SerializeObject(p.Value.JsonParam, Newtonsoft.Json.Formatting.Indented)));
                }
                else
                {
                    path += string.Format("{0}{1}={2}", query ? "&" : "?", p.Key.Name, HttpUtility.UrlEncode(JsonConvert.SerializeObject(p.Value.JsonParam, Newtonsoft.Json.Formatting.Indented)));
                    query = true;
                }
            });

            var args = new Dictionary<string, object>();
            bodyParams.ForEach(p => args.Add(p.Key.Name, p.Value.JsonParam));

            sb.AppendFormat("{0} {1}", method.HttpMethod, path).AppendLine()
                .AppendLine("Host: yourportal.onlyoffice.com")
                .AppendLine("Content-Type: application/json")
                .Append("Accept: application/json");

            if (args.ContainsKey("inDto"))
            {
                var dto = args["inDto"] as Dictionary<string, object>;
                args.Remove("inDto");
                if (dto == null)
                {
                    args.Add("inDto", null);
                }
                else
                {
                    foreach (var kv in dto)
                    {
                        args.Add(kv.Key, kv.Value);
                    }
                }
            }

            if (args.Any())
            {
                sb.AppendLine().AppendLine()
                   .Append(JsonConvert.SerializeObject(args, Newtonsoft.Json.Formatting.Indented));
            }

            method.Example = sb.ToString();
        }

        private string GetOnlyName(string typeName)
        {
            if (typeName.StartsWith(SystemNullable))
            {
                return typeName.Substring(SystemNullable.Length, typeName.Length - 1 - SystemNullable.Length);
            }
            if (typeName.StartsWith(SystemIEnumerable))
            {
                return typeName.Substring(SystemIEnumerable.Length, typeName.Length - 1 - SystemIEnumerable.Length);
            }
            if (typeName.StartsWith(SystemList))
            {
                return typeName.Substring(SystemList.Length, typeName.Length - 1 - SystemList.Length);
            }
            if (typeName.EndsWith("[]"))
            {
                return typeName.Substring(0, typeName.Length - 2);
            }
            if (typeName.EndsWith("{`0}"))
            {
                return typeName.Substring(0, typeName.Length - 4);
            }
            if (typeName.EndsWith("{System.Text.Json.JsonElement}"))
            {
                return typeName.Substring(0, typeName.Length - "{System.Text.Json.JsonElement}".Length);
            }
            return typeName;
        }

        private object GetJsonParam(string typeName)
        {
            TypeDescription typeDescription = null;
            var name = GetOnlyName(typeName);

            typeDescription = _classPluralizer.ToHumanName(name);
            if (typeDescription != null && typeDescription.JsonParam != null && !typeName.StartsWith(SystemNullable))
            {
                var list = new List<object>();
                list.Add(typeDescription.JsonParam);
                return list;
            }
            return typeDescription.JsonParam;
        }

        private static string GetFunctionName(string functionName)
        {
            var tmp = functionName.Split('(')[0].Split('.');
            return Regex.Replace(Regex.Replace(tmp[tmp.Length - 1], "[a-z][A-Z]+", match => (match.Value[0] + " " + match.Value.Substring(1, match.Value.Length - 2) + (" " + match.Value[match.Value.Length - 1]).ToLowerInvariant())), @"\s+", " ");
        }

        #endregion

        private static string MakeParamName(Type parameterType)
        {
            var name = parameterType.FullName.Replace('+', '.');
            name = Regex.Replace(name, @"\[.+\]", "");
            if (parameterType.IsGenericType)
            {
                name = Regex.Replace(name, @"`\d+", "");
                var genericTypes = parameterType.GetGenericArguments();
                name += "{" + string.Join(",", genericTypes.Select(MakeParamName).ToArray()) + "}";
            }
            return name;
        }
    }


    internal static class XmlExt
    {
        internal static string ValueOrNull(this XElement element)
        {
            return element == null ? "" : element.Value;
        }

        internal static string ValueOrNull(this XAttribute element)
        {
            return element == null ? "" : element.Value;
        }
    }
}