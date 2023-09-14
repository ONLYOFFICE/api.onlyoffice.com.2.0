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
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    public abstract class JsDocDocumentation
    {
        protected static readonly Dictionary<string, string> EditorsTypeMapping = new Dictionary<string, string>
        {
            { "CDE", "word" },
            { "CPE", "slide" },
            { "CSE", "cell" }
        };

        protected Dictionary<string, string> PathMapping { get; set; }

        protected Dictionary<string, SortedDictionary<string, DBEntry>> _entries;
        protected SortedDictionary<string, DBGlobal> _globals;
        protected ILog _logger;

        protected void Load(string pathPiece)
        {
            var tree = new Dictionary<string, SortedDictionary<string, DBEntry>>(StringComparer.OrdinalIgnoreCase);

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, $@"App_Data\{pathPiece}\references");
            if (!Directory.Exists(path))
            {
                _logger.Info("Couldn't find any docs: " + path);
                _entries = tree;
                return;
            }

            foreach (var dir in Directory.GetDirectories(path))
            {
                var moduleName = dir.Split(Path.DirectorySeparatorChar).Last();
                var moduleTree = ParseFiles(dir, moduleName);

                tree.Add(moduleName, moduleTree);

                var globalsPath = Path.Combine(dir, "Globals.json");
                ParseGlobals(globalsPath, moduleName);
            }

            _entries = tree;
            CheckSharedMethods();
            LoadExamples(pathPiece);
            FillPaths();
            ParseLinks();
        }

        public abstract List<SearchResult> Search(string query, UrlHelper url);
        protected abstract void CheckSharedMethods();
        protected abstract void FillPaths();

        private SortedDictionary<string, DBEntry> ParseFiles(string directory, string moduleName)
        {
            var moduleTree = new SortedDictionary<string, DBEntry>(StringComparer.OrdinalIgnoreCase);

            foreach (var file in Directory.GetFiles(directory))
            {
                try
                {
                    var clearname = Path.GetFileNameWithoutExtension(file);
                    if (clearname == "Globals") continue;

                    var entry = JsonConvert.DeserializeObject<DBEntry>(File.ReadAllText(file));
                    entry.Name = clearname;
                    entry.Path = PathMapping[moduleName];
                    entry.Module = moduleName;
                    if (entry.Methods == null || entry.Methods.Count == 0) continue;

                    entry.Methods.ToList().ForEach(m =>
                    {
                        m.Value.Module = moduleName;
                        if (m.Value.Params != null) m.Value.Params.ToList().ForEach(p => p.Module = moduleName);
                    });
                    if (entry.Events != null)
                    {
                        entry.Events.ToList().ForEach(e =>
                        {
                            e.Value.Module = moduleName;
                            if (e.Value.Params != null) e.Value.Params.ToList().ForEach(p => p.Module = moduleName);
                        });
                    }
                    if (entry.Params != null) entry.Params.ToList().ForEach(p => p.Module = moduleName);
                    if (entry.Properties != null) entry.Properties.ToList().ForEach(p => p.Module = moduleName);

                    moduleTree.Add(entry.Name, entry);
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse {0}. Got an error: {1}", file, e.Message);
                }
            }

            return moduleTree;
        }

        private void ParseGlobals(string path, string moduleName)
        {
            if (!File.Exists(path))
            {
                _logger.Info("Couldn't find globals: " + path);
            }
            else
            {
                try
                {
                    if (_globals == null) _globals = new SortedDictionary<string, DBGlobal>(StringComparer.OrdinalIgnoreCase);
                    var content = JsonConvert.DeserializeObject<SortedDictionary<string, DBGlobal>>(File.ReadAllText(path));
                    foreach (var kv in content)
                    {
                        kv.Value.Module = moduleName;
                        if (kv.Value.Properties != null) kv.Value.Properties.ToList().ForEach(p => p.Module = moduleName);
                        if (!_globals.ContainsKey(kv.Key)) _globals.Add(kv.Key, kv.Value);
                    }
                }
                catch (Exception e)
                {
                    _logger.WarnFormat("Couldn't parse globals. Got an error: {1}", e.Message);
                }
            }
        }

        public SortedDictionary<string, DBEntry> GetModule(string name)
        {
            return _entries.ContainsKey(name) ? _entries[name] : null;
        }

        public Dictionary<string, SortedDictionary<string, DBEntry>> GetModules()
        {
            return _entries;
        }

        public DBEntry GetSection(string module, string name)
        {
            var mod = GetModule(module);
            if (mod == null) return null;

            return mod.ContainsKey(name) ? mod[name] : null;
        }

        public DBMethod GetMethod(string module, string section, string name)
        {
            var sec = GetSection(module, section);
            if (sec == null) return null;

            return sec.Methods.ContainsKey(name) ? sec.Methods[name] : null;
        }

        public DBEvent GetEvent(string module, string section, string name)
        {
            var sec = GetSection(module, section);
            if (sec == null) return null;

            return sec.Events.ContainsKey(name) ? sec.Events[name] : null;
        }

        public SortedDictionary<string, DBGlobal> GetGlobals()
        {
            return _globals;
        }

        public HtmlString ReturnTypeToHtml(DBMethod method)
        {
            return TypesToHtml(method.Returns.First(), method.Module);
        }

        public HtmlString ParamTypeToHtml(DBParam param)
        {
            return new HtmlString(ParamTypeToLinkTag(param.Type, param.Module));
        }

        public HtmlString TypesToHtml(IEnumerable<string> types, string priority)
        {
            var returnsHtml = new List<string>();

            foreach (var type in types)
            {
                if (type.StartsWith("\""))
                {
                    returnsHtml.Add(type);
                    continue;
                }

                returnsHtml.Add(ParamTypeToLinkTag(type, priority));
            }

            return new HtmlString(string.Join(" | ", returnsHtml));
        }

        private string ParamTypeToLinkTag(string type, string module)
        {
            var found = FindType(type, module);
            var encoded = HttpUtility.HtmlEncode(type);
            return found == null || string.IsNullOrWhiteSpace(found.Path) ? encoded : string.Format("<a href=\"{0}\">{1}</a>", found.Path, encoded);
        }

        private void LoadExamples(string pathPiece)
        {
            var docbuilderExt = ".docbuilder";
            var examplesPath = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, $@"App_Data\{pathPiece}\examples");

            foreach (var moduleName in _entries.Keys)
            {
                var mod = GetModule(moduleName);
                if (mod == null) continue;

                var path = Path.Combine(examplesPath, moduleName);
                if (!Directory.Exists(path))
                {
                    _logger.Info("Couldn't find any examples: " + path);
                }
                else
                {
                    foreach (var examplePath in Directory.GetFiles(path))
                    {
                        if (Path.GetExtension(examplePath) != docbuilderExt) continue;

                        var exampleName = Path.GetFileNameWithoutExtension(examplePath);
                        if (exampleName.Contains("."))
                        {
                            var split = exampleName.Split('.');
                            if (mod.ContainsKey(split[0]))
                            {
                                var section = mod[split[0]];
                                var example = new DBExample
                                {
                                    Script = File.ReadAllText(examplePath)
                                };
                                if (section.Methods.ContainsKey(split[1]))
                                {
                                    section.Methods[split[1]].Example = example;
                                }
                                else if (section.Events.ContainsKey(split[1]))
                                {
                                    section.Events[split[1]].Example = example;
                                }
                                else
                                {
                                    _logger.InfoFormat("Found example for {0}.{1} but the method is missing", moduleName, exampleName);
                                }
                            }
                            else
                            {
                                _logger.InfoFormat("Found example for {0}.{1} but the class is missing", moduleName, exampleName);
                            }
                        }
                        else
                        {
                            if (mod.ContainsKey(exampleName))
                            {
                                var example = new DBExample
                                {
                                    Script = File.ReadAllText(examplePath)
                                };
                                mod[exampleName].Example = example;
                            }
                            else
                            {
                                _logger.InfoFormat("Found example for {0}.{1} but the class is missing", moduleName, exampleName);
                            }
                        }
                    }
                }
            }

            foreach (var globalsExamplePath in Directory.GetFiles(examplesPath))
            {
                if (Path.GetExtension(globalsExamplePath) != docbuilderExt) continue;

                var globalExampleName = Path.GetFileNameWithoutExtension(globalsExamplePath);

                if (_globals.ContainsKey(globalExampleName))
                {
                    _globals[globalExampleName].Script = File.ReadAllText(globalsExamplePath);
                }
                else
                {
                    _logger.InfoFormat("Found global example for {0} but the method is missing", globalExampleName);
                }
            }

            LogMissingExamples();
        }

        private void ParseLinks()
        {
            var regex = new Regex("{@link (.+?)}", RegexOptions.Multiline);

            var entities = new List<DBEntity>();
            foreach (var mod in _entries)
            {
                entities.AddRange(mod.Value.Values);

                foreach (var section in mod.Value)
                {
                    if (section.Value.Params != null) entities.AddRange(section.Value.Params);
                    if (section.Value.Properties != null) entities.AddRange(section.Value.Properties);

                    entities.AddRange(section.Value.Methods.Values);
                    foreach (var method in section.Value.Methods)
                    {
                        if (method.Value.Params != null) entities.AddRange(method.Value.Params);
                    }

                    if (section.Value.Events != null)
                    {
                        entities.AddRange(section.Value.Events.Values);

                        foreach (var evt in section.Value.Events)
                        {
                            if (evt.Value.Params != null) entities.AddRange(evt.Value.Params);
                        }
                    }
                }
            }

            foreach (var global in _globals.Values)
            {
                entities.Add(global);
                if (global.Properties != null) entities.AddRange(global.Properties);
            }

            foreach (var entity in entities)
            {
                if (string.IsNullOrEmpty(entity.Description)) continue;

                Func<string, MatchEvaluator> replacer = module =>
                {
                    return match =>
                    {
                        var text = match.Groups[1].Value;
                        var linkText = match.Groups[1].Value;
                        if (text.IndexOf(' ') > 0)
                        {
                            linkText = text.Substring(0, text.IndexOf(' '));
                            text = text.Substring(text.IndexOf(' ') + 1);
                        }

                        string resultLink = null;
                        if (linkText.StartsWith("/") || linkText.StartsWith("http://") || linkText.StartsWith("https://"))
                        {
                            resultLink = linkText;
                        }
                        else if (linkText.Contains('#'))
                        {
                            var split = linkText.Split('#');
                            if (split[0] == "global")
                            {
                                if (_globals.TryGetValue(split[1], out var global))
                                {
                                    resultLink = global.Path;
                                }
                            }
                            else
                            {
                                var type = GetSection(module, split[0]);
                                if (type != null)
                                {
                                    var methodOrEvent = type.Methods.Values.Cast<DBPagedEntity>().Concat(type.Events.Values).FirstOrDefault(e => e.Name.ToLower() == split[1].ToLower());
                                    if (methodOrEvent != null)
                                    {
                                        resultLink = methodOrEvent.Path;
                                    }
                                }
                            }
                        }
                        else
                        {
                            var type = FindType(linkText.ToLower(), module);
                            if (type != null)
                            {
                                resultLink = type.Path;
                            }
                        }

                        if (string.IsNullOrWhiteSpace(resultLink))
                        {
                            _logger.InfoFormat("unknown link {0}", match.Value);
                            return text;
                        }

                        return string.Format("<a href=\"{0}\">{1}</a>", resultLink, text);
                    };
                };

                entity.Description = regex.Replace(entity.Description, replacer(entity.Module));
                if (entity is DBMethod method)
                {
                    if (method.See != null) method.See = regex.Replace(method.See, replacer(method.Module));
                    if (method.Inherits != null) method.Inherits = regex.Replace(method.Inherits, replacer(method.Module));
                }
            }
        }

        private void LogMissingExamples()
        {
            foreach (var mod in _entries)
            {
                foreach (var section in mod.Value.Values)
                {
                    LogMissingExample(section.Example, string.Format("section {0}.{1}", mod.Key, section.Name));

                    foreach (var method in section.Methods.Values)
                    {
                        LogMissingExample(method.Example, string.Format("method {0}.{1}.{2}", mod.Key, section.Name, method.Name));
                    }

                    foreach (var evt in section.Events.Values)
                    {
                        LogMissingExample(evt.Example, string.Format("event {0}.{1}.{2}", mod.Key, section.Name, evt.Name));
                    }
                }
            }

            foreach (var global in _globals.Values)
            {
                LogMissingExample(global.Script, string.Format("global {0}.{1}", global.Module, global.Name));
            }
        }

        private void LogMissingExample(DBExample example, string path)
        {
            if (example == null)
            {
                _logger.InfoFormat("Missing example and demo for {0}", path);
            }
            else
            {
                LogMissingExample(example.Script, path);
            }
        }

        private void LogMissingExample(string script, string path)
        {
            if (string.IsNullOrEmpty(script))
            {
                _logger.InfoFormat("Missing example for {0}", path);
            }
        }

        private DBPagedEntity FindType(string name, string priorityModule)
        {
            if (name.StartsWith("\"")) return null;
            name = TrimArray(name.ToLowerInvariant());

            var module = GetModule(priorityModule);
            if (module == null) return null;
            if (module.ContainsKey(name)) return module[name];

            foreach (var nonPriorityModule in _entries.Where(kv => kv.Key != priorityModule).Select(kv => kv.Value))
            {
                if (nonPriorityModule.ContainsKey(name)) return nonPriorityModule[name];
            }

            if (_globals.ContainsKey(name)) return _globals[name];

            return null;
        }

        private string TrimArray(string type)
        {
            if (!type.StartsWith("array.<")) return type;
            type = type.Substring("array.<".Length, type.Length - "array.<>".Length);
            return TrimArray(type);
        }
    }

    public class DBEntry : DBPagedEntity
    {
        [JsonProperty("methods")]
        public SortedDictionary<string, DBMethod> Methods { get; set; }

        [JsonProperty("properties")]
        public List<DBProperty> Properties { get; set; }

        [JsonProperty("comment")]
        public string Comment { get; set; }

        [JsonProperty("scope")]
        public string Scope { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonProperty("events")]
        public SortedDictionary<string, DBEvent> Events { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }

        public DBEntry()
        {
            Methods = new SortedDictionary<string, DBMethod>(StringComparer.OrdinalIgnoreCase);
            Events = new SortedDictionary<string, DBEvent>(StringComparer.OrdinalIgnoreCase);
        }
    }

    public class DBMethod : DBPagedEntity
    {
        [JsonProperty("memberof")]
        public string MemberOf { get; set; }

        [JsonProperty("tags")]
        public DBTags Tags { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonProperty("returns")]
        public List<List<string>> Returns { get; set; }

        [JsonProperty("see")]
        public string See { get; set; }

        [JsonProperty("inherits")]
        public string Inherits { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }
    }

    public class DBEvent : DBPagedEntity
    {
        [JsonProperty("memberof")]
        public string MemberOf { get; set; }

        [JsonProperty("tags")]
        public DBTags Tags { get; set; }

        [JsonProperty("see")]
        public string See { get; set; }

        [JsonProperty("params")]
        public List<DBParam> Params { get; set; }

        [JsonIgnore]
        public DBExample Example { get; set; }
    }

    public class DBProperty : DBEntity
    {
        [JsonProperty("type")]
        public string Type { get; set; }
    }

    public class DBTags
    {
        [JsonProperty("typeofeditors")]
        public List<string> EditorTypes { get; set; }
    }

    public class DBParam : DBEntity
    {
        [JsonProperty("type")]
        public string Type { get; set; }

        [JsonProperty("optional")]
        public bool Optional { get; set; }

        [JsonProperty("defaultValue")]
        public string DefaultValue { get; set; }
    }

    public abstract class DBEntity
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonIgnore]
        public string Module { get; set; }
    }

    public abstract class DBPagedEntity : DBEntity
    {
        [JsonIgnore]
        public string Path { get; set; }
    }

    public class DBExample
    {
        [JsonProperty("script")]
        public string Script { get; set; }
    }

    public class DBGlobal : DBPagedEntity
    {
        [JsonProperty("type")]
        public List<string> Types { get; set; }

        [JsonProperty("properties")]
        public List<DBProperty> Properties { get; set; }

        [JsonProperty("script")]
        public string Script { get; set; }
    }
}