---
order: -3
---

ONLYOFFICE provides a style sheet for different interface elements. To adjust your plugin interface to the ONLYOFFICE style, connect the [plugin.css](https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css) to the [index.html](../../Usage%20API/index.html/index.md) file with the following link:

``` html
<link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css">
```

All the available controls are displayed within the **Controls example** plugin:

![Controls example](/assets/images/plugins/controls.png)

## Buttons

1. Use the *btn-text-default* class to add **Button 1** to your plugin:

   ``` html
   <button class="btn-text-default" style="width:75px;">Button 1</button>
   ```

   This class has the following parameters:

   ``` css
   .btn-text-default {
       background: #fff;
       border: 1px solid #cfcfcf;
       border-radius: 2px;
       color: #444444;
       font-size: 11px;
       font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
       height: 22px;
       cursor: pointer;
   }
   ```

   ![Button 1](/assets/images/plugins/button-1.png)

2. Use the *btn-text-default.submit.primary* class to add **Button 2** to your plugin:

   ``` html
   <button class="btn-text-default submit primary" style="width:75px;">Button 2</button>
   ```

   This class has the following parameters:

   ``` css
   .btn-text-default.submit.primary {
       color: #fff;
       background-color: #7d858c;
   }
   ```

   ![Button 2](/assets/images/plugins/button-2.png)

3. Use the *btn-text-default.submit* class to add **Button 3** to your plugin:

   ``` html
   <button class="btn-text-default submit" style="width:75px;">Button 3</button>
   ```

   This class has the following parameters:

   ``` css
   .btn-text-default.submit {
       font-weight: bold;
       background-color: #d8dadc;
       border: 1px solid transparent;
   }               
   ```

   ![Button 3](/assets/images/plugins/button-3.png)

   > The button color is chosen by the developer. The darker the button, the more important it is. As a rule, the button of the *btn-text-default.submit.primary* class is used to confirm the action and send the result (for example, the **Ok** button).

4. Use the *btn-edit* class to add ![Edit button](/assets/images/plugins/edit_button.png) **Edit button** to your plugin:

   ``` html
   <label class="for-combo">Edit button</label><div class="btn-edit" style="display: inline-block; margin-left: 10px;"></div>
   ```

   This class has the following parameters:

   ``` css
   .btn-edit {
       width: 13px;
       height: 13px;
       cursor: pointer;
       background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAANCAYAAABy6+R8AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAGZSURBVHgBfZI/y4FRGMavx7+SRQaTTQab74CVlBKL/FukDGQhEgsDNh/Apiw+gcXm70DJoEikKMUk7vec8/Yi75O7Tj2d+/4913Wuc6Tz+UyQqev1itvtBr1e/6+nkgP2+z0qlYr4DgaDsNls36HtdotisYhoNAqLxYJyuSz230HFO7DZbISC0+lEp9OBRqNBLpdDq9XCeDx+DfIz8TWZTIhZodFoRMvlknw+H8XjcdrtdrRarYgpU6/XE7MC4oMc4OB8Pie/30/ZbJba7TYlk0k6HA4CDIVCxNyQYrFYoNFoIJ1OQ5Ik5PN5WK1WpFIprNdr8H61WhVn5X2VisXg8XhoNpvRYDAgt9tNbICOxyOVSiVyuVzU7/epXq9TIBAQtrkzxeVygclkQrfbhd1uRzgcRq1Ww3A4FKparRbspyJRo9H4G4TD4RD06XQS3pkt8nq9NJ1OiSVGsVjsqfC3nvekVCrxeDxgMBgQiUTEa2g2m8hkMi8FuXtSq9VIJBK43+8iHB7GJ8BL4vY+N3U6HQqFAsxmM+TqB5Je/SVNoN18AAAAAElFTkSuQmCC');
   }                              
   ```

## Input controls

1. Use the *textarea* form element to add a **text area** to your plugin:

   ``` html
   <textarea style="height:45px;width: 100%;" class="form-control" placeholder="textarea control"></textarea>
   ```

   This class has the following parameters:

   ``` css
   textarea.form-control {
       resize: none;
   }               
   ```

   ![Textarea](/assets/images/plugins/text_area.png)

2. Use the *input* form element with the *text* type to add a **text field** to your plugin:

   ``` html
   <input type="text" class="form-control" placeholder="text field" style="width: 100%;margin-bottom: 2px;">
   ```

   This class has the following parameters:

   ``` css
   .form-control {
       border: 1px solid #cfcfcf;
       border-radius: 2px;
       box-sizing: border-box;
       color: #444444;
       font-size: 11px;
       height: 22px;
       padding: 1px 3px;
       -webkit-box-shadow: none;
       box-shadow: none;
       -webkit-user-select: text;
       -moz-user-select: text;
       -ms-user-select: text;
       user-select: text;
   }        
   ```

   ![Text field](/assets/images/plugins/text_field.png)

3. Use the *input* form element with the *checkbox* type to add a ![Checkbox](/assets/images/plugins/checkbox_example.png) **checkbox** to your plugin:

   ``` html
   <input type="checkbox" class="form-control" style="vertical-align: middle;"><label style="margin-left: 5px;vertical-align: middle;">Checkbox</label>
   ```

   This class has the following parameters:

   ``` css
   input[type='checkbox '].form-control {
       height: auto;
       margin: 0;
   }                          
   ```

## Label controls

1. Use the *label.header* class to add a **bold header** to your plugin:

   ``` html
   <label class="header">Header label</label>
   ```

   This class has the following parameters:

   ``` css
   label.header {
       font-weight: bold;
   }                            
   ```

2. Use the *label.link* class to add a link to your plugin:

   ``` html
   <label class="link">Link label</label>
   ```

   This class has the following parameters:

   ``` css
   label.link {
       border-bottom: 1px dotted #aaa;
       cursor: pointer;
   }                            
   ```

## ComboBox

Use the [select2](https://select2.org/) function to add a **combo box** to your plugin:

``` html
<select id="select_example" class="" ></select>
$('#select_example').select2({
    data : [{id:0, text:'Item 1'}, {id:1, text:'Item 2'}, {id:2, text:'Item 3'}],
    minimumResultsForSearch: Infinity,
    width : '120px'
});
```

![Combobox](/assets/images/plugins/combobox_example.png)

## Loader

Use the *asc-loader-container* class to add a **loader container** to your plugin:

``` html
<div id="loader-container" class="asc-loader-container" style="margin: 10px; height: 40px; border: 1px solid #cfcfcf;"></div>
```

This class has the following parameters:

``` css
.asc-loader-container {
    position: relative;
}        
```

![Loader](/assets/images/plugins/loader_example.png)

## Example

Let’s have a look at how to add interface elements in the ONLYOFFICE style to the YouTube plugin.

![YouTube plugin](/assets/images/plugins/youtube_interface.png)

1. To add the simple white **OK** button, use the *btn-text-default* class (button width - 30 pixels):

   ``` html
   <button class="btn-text-default" style="width:30px;">OK</button>
   ```

2. To add a field, use the *form-control* class (form width - 100%, i.e. it is adjusted to the width of the parent element):

   ``` html
   <input type="text" class="form-control" style="width:100%;">
   ```

3. To add the dark grey **Ok** button, use the *btn-text-default.submit.primary* class (button width - 90 pixels):

   ``` html
   <button class="btn-text-default submit primary" style="width:90px;">Ok</button>
   ```

4. To add the light grey **Cancel** button, use the *btn-text-default.submit* class (button width - 90 pixels):

   ``` html
   <button class="btn-text-default submit" style="margin-left:5px; width:90px;">Cancel</button>
   ```
