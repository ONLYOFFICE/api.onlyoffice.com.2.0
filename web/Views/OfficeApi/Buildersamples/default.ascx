<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Builder samples</span>
</h1>

<ul class="sample-block">
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createformaldocument") %>">
            <div class="example-sample-img create-formal-document"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createformaldocument") %>">Creating formal document</a></p>
            <p>Creates multi-page document with formal styles.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createformaldocument") %>">More</a></p>
        </div>
    </li>

    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/addwatermark") %>">
            <div class="example-sample-img add-watermark"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/addwatermark") %>">Adding watermark</a></p>
            <p>Adds a watermark to the document.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/addwatermark") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createtabledocument") %>">
            <div class="example-sample-img create-table-document"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createtabledocument") %>">Creating table document</a></p>
            <p>Creates a document with a styled table.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createtabledocument") %>">More</a></p>
        </div>
    </li>

    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createreports") %>">
            <div class="example-sample-img create-reports"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createreports") %>">Creating report document</a></p>
            <p>Creates report tables in the document.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createreports") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/mailmergereceptions") %>">
            <div class="example-sample-img mail-merge-reception"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/mailmergereceptions") %>">Creating mail merge receptions</a></p>
            <p>Creates custom mail merge receptions.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/mailmergereceptions") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/fillspreadsheet") %>">
            <div class="example-sample-img fill-spreadsheet"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/fillspreadsheet") %>">Filling spreadsheet</a></p>
            <p>Fills spreadsheet with array-based values.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/fillspreadsheet") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createspreadsheetchart") %>">
            <div class="example-sample-img create-spreadsheet-chart"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createspreadsheetchart") %>">Creating spreadsheet chart</a></p>
            <p>Creates a chart filled with array-based values in the spreadsheet.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createspreadsheetchart") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/commenterrors") %>">
            <div class="example-sample-img comment-errors"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/commenterrors") %>">Commenting spreadsheet errors</a></p>
            <p>Comments spreadsheet cells with formula errors.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/commenterrors") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createpresentation") %>">
            <div class="example-sample-img create-presentation"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createpresentation") %>">Creating presentation</a></p>
            <p>Creates presentation with multiple slides, images and text.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createpresentation") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createchartpresentation") %>">
            <div class="example-sample-img create-chart-presentation"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createchartpresentation") %>">Creating chart presentation</a></p>
            <p>Creates single-slide chart presentation.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createchartpresentation") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createbasicform") %>">
            <div class="example-sample-img create-basic-form"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createbasicform") %>">Creating basic form</a></p>
            <p>Creates basic form with text and image inputs.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createbasicform") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/createadvancedform") %>">
            <div class="example-sample-img create-advanced-form"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/createadvancedform") %>">Creating advanced form</a></p>
            <p>Creates advanced form with table structure.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/createadvancedform") %>">More</a></p>
        </div>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("buildersamples/fillform") %>">
            <div class="example-sample-img fill-form"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("buildersamples/fillform") %>">Filling form</a></p>
            <p>Fills form with text values and image.</p>
            <p class="block_more-sample"><a href="<%= Url.Action("buildersamples/fillform") %>">More</a></p>
        </div>
    </li>
</ul>
