<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}"/>
    <title>Promed Incident Viewer</title>

    <script>
        var customerDetailMap = new Object();

        function toggleShowAll() {
            parent.location = 'incident/toggleShowAll'
        }

        function referenceFormatter(cellvalue, options, rowObject) {
            var ref = rowObject[0]
            var email = rowObject[11]
            return "<a href='mailto:" + email + "?subject=" + ref + "'>" + ref + "</a>"
        }

        function customerFormatter(cellvalue, options, rowObject) {
            customerDetailMap[options.rowId] = [rowObject[9],rowObject[13],rowObject[14],rowObject[15],rowObject[16],rowObject[17]]
            return "<a href='' onclick='showCustomerDialog(this," + options.rowId + ");return false;'>" + cellvalue + "</a>"
        }

        function showCustomerDialog(linkElement, id) {
            detail = customerDetailMap[id]
            //set values in dialog
            $('#customerName').text(detail[0]);
            $('#customerContactPerson').text(detail[1]);
            $('#customerTel1').text(detail[2]);
            $('#customerTel2').text(detail[3]);
            $('#customerCel').text(detail[4]);
            $('#customerEmail').text(detail[5]);
            //get link position
            var linkPosition = $(linkElement).offset();
            //set dialog position
//            $('#jqdlgCustomer').dialog('option', 'position', [linkPosition.left, linkPosition.top]);
            //open dialog
            $('#jqdlgCustomer').dialog('open');
        }

    </script>


</head>



<body>

    <style>

        #jqdlgCustomer {
            /*font-family: Lucida Grande, Lucida Sans, Arial, sans-serif;*/
            font-size: 0.8em;
        }

        #jqdlgCustomer td{
            padding-top: 2px;
        }

        .ui-dialog-title {
            font-size: 0.7em;
        }

        .ui-dialog-titlebar{
            padding: 0px;
        }

    </style>

<div class="nav" role="navigation">
    <div class="navContent">
        <g:checkBox name="showAll" checked="${session.showAll}" onclick="toggleShowAll()" value="Show All"/> Show All
    </div>
</div>
     <div class="content">
        <table id="list2" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
        <div id="pager2" class="scroll" style="text-align:center;"></div>

        <script type="text/javascript">// <![CDATA[
            $("#list2").jqGrid({
                url:'incident/jq_incident_list',
                datatype: "json",
                colNames:['Ref#','Created On', 'Due By', 'Closed On', 'Type', 'Type Group','Branch','Outline','Status','Priority','Customer','Agent'],
                colModel:[
                    {name:'reference',index:'reference', width:65,formatter: referenceFormatter},
                    {name:'createdOn',index:'createdOn', width:80},
                    {name:'dueBy',index:'dueBy', width:80},
                    {name:'ClosedOn',index:'closedOn', width:80},
                    {name:'incidentType',index:'incidentType', width:150},
                    {name:'incidentTypeGroup',index:'incidentTypeGroup', width:150},
                    {name:'branch',index:'branch', width:70},
                    {name:'outline',index:'outline', width:300},
                    {name:'statusDescription',index:'statusDescription', width:80},
                    {name:'priority',index:'priority', width:80},
                    {name:'customer',index:'customer', width:150,formatter: customerFormatter},
                    {name:'agent',index:'agent', width:100}
                ],
                rowNum:10,
                rowList:[10,20,50],
                pager: '#pager2',
                sortname: 'id',
                viewrecords: true,
                sortorder: "desc",
                multiselect: false,
    //            shrinkToFit:false,
    //            width: 1024,
                height: "100%",
                caption:"Incidents",
                subGrid : true,
                subGridUrl: 'incident/jq_incidentlog_list',
                subGridModel: [
                    { name  : ['Date','Resolution','Type','Agent'], width : [55,200,80,80] }
                ]
            });
            $("#list2").filterToolbar({autosearch:true });
            $("#list2").jqGrid('navGrid', '#pager2', {edit:false,add:false,del:false,search:false});

            // ]]>
        </script>


         <div id="jqdlgCustomer">
             <table>
                 <tbody>
                     <tr class="odd">
                         <td>Customer:</td>
                         <td><span id="customerName"/></td>
                     </tr>
                     <tr class="even">
                         <td>Contact Person:</td>
                         <td><span id="customerContactPerson"/></td>
                     </tr>
                     <tr class="odd">
                         <td>Tel1:</td>
                         <td><span id="customerTel1"/></td>
                     </tr>
                     <tr class="even">
                         <td>Tel2:</td>
                         <td><span id="customerTel2"/></td>
                     </tr>
                     <tr class="odd">
                         <td>Cell:</td>
                         <td><span id="customerCell"/></td>
                     </tr>
                     <tr class="even">
                         <td>Email:</td>
                         <td><span id="customerEmail"/></td>
                     </tr>
                 </tbody>
             </table>
         </div>

         <script type="text/javascript">
        $('#jqdlgCustomer').dialog({ autoOpen: false, bgiframe: true, resizable: true, title: 'Customer Details', width: 400});
    </script>


  </div>

</body>
</html>
