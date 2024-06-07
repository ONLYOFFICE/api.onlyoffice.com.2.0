builder.CreateFile("xlsx");
/**
* Calculates the sum of the specified numbers.
* @customfunction
* @nameLocale {fr:Ajouter | es:Añadir}
* @param {number} first The first number (required).
* @param {number} [second] The second number (optional).
* @returns {number} The sum of the numbers.
*/
Api.AddCustomFunction (function add (first, second) {
    if (second === null) {
        second = 0;
    }
    return first + second;
})
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("=ADD(1, 2)");
builder.SaveFile("xlsx", "AddCustomFunction.xlsx");
builder.CloseFile();