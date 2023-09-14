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
using log4net;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.Helpers
{
    [DataContract(Name = "product", Namespace = "")]
    public class Product
    {
        [DataMember(Name = "id", IsRequired = true, EmitDefaultValue = false)]
        public string Id;

        [DataMember(Name = "title", IsRequired = true, EmitDefaultValue = false)]
        public string Title;

        [DataMember(Name = "description")]
        public string Description;

        [DataMember(Name = "version")]
        public string Version;

        [DataMember(Name = "links")]
        public Dictionary<string, List<Tuple<string, string>>> Links;
    }

    public static class Products
    {
        private static List<Product> _allProducts;

        public static List<Product> EnabledProducts()
        {
            if (_allProducts == null)
            {
                var productsFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "products.json");

                if (!File.Exists(productsFile))
                {
                    throw new Exception("Products list is not found");
                }
                var productsJson = File.ReadAllText(productsFile);

                try
                {
                    _allProducts = JsonConvert.DeserializeObject<List<Product>>(productsJson);
                }
                catch (Exception error)
                {
                    LogManager.GetLogger("ASC.Api").Error(error);
                    _allProducts = new List<Product>();
                }
            }

            return _allProducts;
        }

        public static Product Get(string id)
        {
            return EnabledProducts().FirstOrDefault(product => product.Id == id);
        }
    }
}