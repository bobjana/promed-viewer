<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'incident.label', default: 'Incident')}"/>
    <title>Promed Incidents Viewer</title>

    <script>
        function toggleShowAll() {
            parent.location = 'incident/toggleShowAll'
        }

        function referenceFormatter(cellvalue, options, rowObject) {
            var ref = rowObject[0]
            var email = rowObject[9]
            return "<a href='mailto:" + email + "?subject=" + ref + "'>" + ref +"</a>"
        }

    </script>
</head>

<body>

<div class="nav" role="navigation">
    <div class="navContent">
        <g:checkBox name="showAll" checked="${session.showAll}" onclick="toggleShowAll()" value="Show All"/> Show All
    </div>
</div>
     <div class="content">
        <table id="list2" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
        <div id="pager2" class="scroll" style="text-align:center;"></div>

        <script type="text/javascript">// <![CDATA[
        jQuery("#list2").jqGrid({
            url:'incident/jq_incident_list',
            datatype: "json",
            colNames:['Ref#','Created On', 'Due By', 'Type', 'Outline','Status','Priority','Customer','Agent'],
            colModel:[
                {name:'reference',index:'reference', width:65,formatter: referenceFormatter},
                {name:'createdOn',index:'createdOn', width:90},
                {name:'dueBy',index:'dueBy', width:100},
                {name:'incidentType',index:'incidentType', width:150},
                {name:'outline',index:'outline', width:300},
                {name:'statusDescription',index:'statusDescription', width:100},
                {name:'priority',index:'priority', width:100},
                {name:'customer',index:'customer', width:100},
                {name:'agent',index:'agent', width:80}
            ],
            rowNum:10,
            rowList:[10,20,50],
            pager: '#pager2',
            sortname: 'id',
            viewrecords: true,
            sortorder: "desc",
            multiselect: false,
            height: "100%",
            caption:"Incidents",
            subGrid : true,
            subGridUrl: 'incident/jq_incidentlog_list',
            subGridModel: [
                { name  : ['Date','Resolution','Type','Agent'], width : [55,200,80,80] }
            ]
        });
        $("#list2").filterToolbar({autosearch:true });
        jQuery("#list2").jqGrid('navGrid', '#pager2', {edit:false,add:false,del:false,search:false});

        // ]]></script>
  </div>
</body>
</html>
