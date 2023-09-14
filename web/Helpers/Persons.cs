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
    [DataContract(Name = "person", Namespace = "")]
    public class Person
    {
        [DataMember(Name = "title")]
        public string Title;

        [DataMember(Name = "lastName")]
        public string LastName;

        [DataMember(Name = "firstName")]
        public string FirstName;

        [DataMember(Name = "middleName")]
        public string MiddleName;

        [DataMember(Name = "dateOfBirth")]
        public string DateOfBirth;

        [DataMember(Name = "sex")]
        public string Sex;

        [DataMember(Name = "phone")]
        public string Phone;

        [DataMember(Name = "email")]
        public string Email;

        [DataMember(Name = "numberStreet")]
        public string NumberStreet;

        [DataMember(Name = "city")]
        public string City;

        [DataMember(Name = "postalCode")]
        public string PostalCode;

        [DataMember(Name = "country")]
        public string Country;
    }

    public static class Persons
    {
        private static List<Person> _allPersons;

        public static List<Person> GetPersons()
        {
            if (_allPersons == null)
            {
                var personsFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "editor", "wildcardData", "persons.json");

                if (!File.Exists(personsFile))
                {
                    throw new Exception("Persons list is not found");
                }
                var personsJson = File.ReadAllText(personsFile);

                try
                {
                    _allPersons = JsonConvert.DeserializeObject<List<Person>>(personsJson);
                }
                catch (Exception error)
                {
                    LogManager.GetLogger("ASC.Api").Error(error);
                    _allPersons = new List<Person>();
                }
            }

            return _allPersons;
        }

        public static Person Get(string postCode)
        {
            return GetPersons().FirstOrDefault(person => person.PostalCode == postCode);
        }
    }
}