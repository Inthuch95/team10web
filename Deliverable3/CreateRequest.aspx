<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        var roomData;
        var buildingData;
        //selectable 1
        var selectedWhiteboard = false;
        var selectedComputer = false;
        var selectedCap = false;
        var selectedPa = false;
        var selectedProjector = false;
        var selectedMic = false;
        var selectedVideo = false;
        var selectedVisualiser = false;
        var selectedWheelchair = false;
        //selectable 2
        var selectedWhiteboard2 = false;
        var selectedComputer2 = false;
        var selectedCap2 = false;
        var selectedPa2 = false;
        var selectedProjector2 = false;
        var selectedMic2 = false;
        var selectedVideo2 = false;
        var selectedVisualiser2 = false;
        var selectedWheelchair2 = false;
        //selectable 3
        var selectedWhiteboard3 = false;
        var selectedComputer3 = false;
        var selectedCap3 = false;
        var selectedPa3 = false;
        var selectedProjector3 = false;
        var selectedMic3 = false;
        var selectedVideo3 = false;
        var selectedVisualiser3 = false;
        var selectedWheelchair3 = false;
        //selectable 4
        var selectedWhiteboard4 = false;
        var selectedComputer4 = false;
        var selectedCap4 = false;
        var selectedPa4 = false;
        var selectedProjector4 = false;
        var selectedMic4 = false;
        var selectedVideo4 = false;
        var selectedVisualiser4 = false;
        var selectedWheelchair4 = false;
        //selectable 5
        var selectedWhiteboard5 = false;
        var selectedComputer5 = false;
        var selectedCap5 = false;
        var selectedPa5 = false;
        var selectedProjector5 = false;
        var selectedMic5 = false;
        var selectedVideo5 = false;
        var selectedVisualiser5 = false;
        var selectedWheelchair5 = false;
        $(document).ready(function () {
            //implement jquery ui selectable to facility options
            //room list also change everytime facility option change
            //start selectable
            //room preference 1
           $("#selectable-session").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-session li").index(this);
                       switch(index) {
                           case 0:
                               $("#session").val("Lecture");
                               break;
                           case 1:
                               $("#session").val("Practical");
                               break;
                           case 2:
                               $("#session").val("Seminar");
                               break;
                           case 3:
                               $("#session").val("Tutorial");
                               break;
                       } 
                   });
               }
           });
           $("#selectable-arrangement").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement").val("Any");
                               break;
                           case 1:
                               $("#arrangement").val("Tired");
                               break;
                           case 2:
                               $("#arrangement").val("Flat");
                               break;
                       }
                       changeRoom();
                   });
               }
           });
           $("#selectable-wheelchair").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWheelchair == false)
                   selectedWheelchair = true;
               else
                   selectedWheelchair = false;
               if (selectedWheelchair)
                   $("#wheelchair").val("1");
               else
                   $("#wheelchair").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-whiteboard").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWhiteboard == false)
                   selectedWhiteboard = true;
               else
                   selectedWhiteboard = false;
               if (selectedWhiteboard)
                   $("#whiteboard").val("1");
               else
                   $("#whiteboard").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-projector").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedProjector == false)
                   selectedProjector = true;
               else
                   selectedProjector = false;
               if (selectedProjector)
                   $("#projector").val("1");
               else
                   $("#projector").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-visualiser").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVisualiser == false)
                   selectedVisualiser = true;
               else
                   selectedVisualiser = false;
               if (selectedVisualiser)
                   $("#visualiser").val("1");
               else
                   $("#visualiser").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-computer").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedComputer == false)
                   selectedComputer = true;
               else
                   selectedComputer = false;
               if (selectedComputer)
                   $("#computer").val("1");
               else
                   $("#computer").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-video").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVideo == false)
                   selectedVideo = true;
               else
                   selectedVideo = false;
               if (selectedVideo)
                   $("#video").val("1");
               else
                   $("#video").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-pa").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedPa == false)
                   selectedPa = true;
               else
                   selectedPa = false;
               if (selectedPa)
                   $("#pa").val("1");
               else
                   $("#pa").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-mic").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedMic == false)
                   selectedMic = true;
               else
                   selectedMic = false;
               if (selectedMic)
                   $("#mic").val("1");
               else
                   $("#mic").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-capture").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedCap == false)
                   selectedCap = true;
               else
                   selectedCap = false;
               if (selectedCap)
                   $("#capture").val("1");
               else
                   $("#capture").val("0");
               changeRoom();
           }).selectable();
            //room preference 2
           $("#selectable-arrangement2").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement2 li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement2").val("Any");
                               break;
                           case 1:
                               $("#arrangement2").val("Tired");
                               break;
                           case 2:
                               $("#arrangement2").val("Flat");
                               break;
                       }
                       changeRoom();
                   });
               }
           });
           $("#selectable-wheelchair2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWheelchair2 == false)
                   selectedWheelchair2 = true;
               else
                   selectedWheelchair2 = false;
               if (selectedWheelchair2)
                   $("#wheelchair2").val("1");
               else
                   $("#wheelchair2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-whiteboard2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWhiteboard2 == false)
                   selectedWhiteboard2 = true;
               else
                   selectedWhiteboard2 = false;
               if (selectedWhiteboard2)
                   $("#whiteboard2").val("1");
               else
                   $("#whiteboard2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-projector2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedProjector2 == false)
                   selectedProjector2 = true;
               else
                   selectedProjector2 = false;
               if (selectedProjector2)
                   $("#projector2").val("1");
               else
                   $("#projector2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-visualiser2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVisualiser2 == false)
                   selectedVisualiser2 = true;
               else
                   selectedVisualiser2 = false;
               if (selectedVisualiser2)
                   $("#visualiser2").val("1");
               else
                   $("#visualiser2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-computer2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedComputer2 == false)
                   selectedComputer2 = true;
               else
                   selectedComputer2 = false;
               if (selectedComputer2)
                   $("#computer2").val("1");
               else
                   $("#computer2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-video2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVideo2 == false)
                   selectedVideo2 = true;
               else
                   selectedVideo2 = false;
               if (selectedVideo2)
                   $("#video2").val("1");
               else
                   $("#video2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-pa2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedPa2 == false)
                   selectedPa2 = true;
               else
                   selectedPa2 = false;
               if (selectedPa2)
                   $("#pa2").val("1");
               else
                   $("#pa2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-mic2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedMic2 == false)
                   selectedMic2 = true;
               else
                   selectedMic2 = false;
               if (selectedMic2)
                   $("#mic2").val("1");
               else
                   $("#mic2").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-capture2").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedCap2 == false)
                   selectedCap2 = true;
               else
                   selectedCap2 = false;
               if (selectedCap2)
                   $("#capture2").val("1");
               else
                   $("#capture2").val("0");
               changeRoom();
           }).selectable();
            //room preference 3
           $("#selectable-arrangement3").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement3 li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement3").val("Any");
                               break;
                           case 1:
                               $("#arrangement3").val("Tired");
                               break;
                           case 2:
                               $("#arrangement3").val("Flat");
                               break;
                       }
                       changeRoom();
                   });
               }
           });
           $("#selectable-wheelchair3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWheelchair3 == false)
                   selectedWheelchair3 = true;
               else
                   selectedWheelchair3 = false;
               if (selectedWheelchair3)
                   $("#wheelchair3").val("1");
               else
                   $("#wheelchair3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-whiteboard3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWhiteboard3 == false)
                   selectedWhiteboard3 = true;
               else
                   selectedWhiteboard3 = false;
               if (selectedWhiteboard3)
                   $("#whiteboard3").val("1");
               else
                   $("#whiteboard3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-projector3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedProjector3 == false)
                   selectedProjector3 = true;
               else
                   selectedProjector3 = false;
               if (selectedProjector3)
                   $("#projector3").val("1");
               else
                   $("#projector3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-visualiser3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVisualiser3 == false)
                   selectedVisualiser3 = true;
               else
                   selectedVisualiser3 = false;
               if (selectedVisualiser3)
                   $("#visualiser3").val("1");
               else
                   $("#visualiser3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-computer3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedComputer3 == false)
                   selectedComputer3 = true;
               else
                   selectedComputer3 = false;
               if (selectedComputer3)
                   $("#computer3").val("1");
               else
                   $("#computer3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-video3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVideo3 == false)
                   selectedVideo3 = true;
               else
                   selectedVideo3 = false;
               if (selectedVideo3)
                   $("#video3").val("1");
               else
                   $("#video3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-pa3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedPa3 == false)
                   selectedPa3 = true;
               else
                   selectedPa3 = false;
               if (selectedPa3)
                   $("#pa3").val("1");
               else
                   $("#pa3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-mic3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedMic3 == false)
                   selectedMic3 = true;
               else
                   selectedMic3 = false;
               if (selectedMic3)
                   $("#mic3").val("1");
               else
                   $("#mic3").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-capture3").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedCap3 == false)
                   selectedCap3 = true;
               else
                   selectedCap3 = false;
               if (selectedCap3)
                   $("#capture3").val("1");
               else
                   $("#capture3").val("0");
               changeRoom();
           }).selectable();
            //room preference 4
           $("#selectable-arrangement4").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement4 li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement4").val("Any");
                               break;
                           case 1:
                               $("#arrangement4").val("Tired");
                               break;
                           case 2:
                               $("#arrangement4").val("Flat");
                               break;
                       }
                       changeRoom();
                   });
               }
           });
           $("#selectable-wheelchair4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWheelchair4 == false)
                   selectedWheelchair4 = true;
               else
                   selectedWheelchair4 = false;
               if (selectedWheelchair4)
                   $("#wheelchair4").val("1");
               else
                   $("#wheelchair4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-whiteboard4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWhiteboard4 == false)
                   selectedWhiteboard4 = true;
               else
                   selectedWhiteboard4 = false;
               if (selectedWhiteboard4)
                   $("#whiteboard4").val("1");
               else
                   $("#whiteboard4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-projector4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedProjector4 == false)
                   selectedProjector4 = true;
               else
                   selectedProjector4 = false;
               if (selectedProjector4)
                   $("#projector4").val("1");
               else
                   $("#projector4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-visualiser4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVisualiser4 == false)
                   selectedVisualiser4 = true;
               else
                   selectedVisualiser4 = false;
               if (selectedVisualiser4)
                   $("#visualiser4").val("1");
               else
                   $("#visualiser4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-computer4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedComputer4 == false)
                   selectedComputer4 = true;
               else
                   selectedComputer4 = false;
               if (selectedComputer4)
                   $("#computer4").val("1");
               else
                   $("#computer4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-video4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVideo4 == false)
                   selectedVideo4 = true;
               else
                   selectedVideo4 = false;
               if (selectedVideo4)
                   $("#video4").val("1");
               else
                   $("#video4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-pa4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedPa4 == false)
                   selectedPa4 = true;
               else
                   selectedPa4 = false;
               if (selectedPa4)
                   $("#pa4").val("1");
               else
                   $("#pa4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-mic4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedMic4 == false)
                   selectedMic4 = true;
               else
                   selectedMic4 = false;
               if (selectedMic4)
                   $("#mic4").val("1");
               else
                   $("#mic4").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-capture4").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedCap4 == false)
                   selectedCap4 = true;
               else
                   selectedCap4 = false;
               if (selectedCap4)
                   $("#capture4").val("1");
               else
                   $("#capture4").val("0");
               changeRoom();
           }).selectable();
            //room preference 5
           $("#selectable-arrangement5").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement5 li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement5").val("Any");
                               break;
                           case 1:
                               $("#arrangement5").val("Tired");
                               break;
                           case 2:
                               $("#arrangement5").val("Flat");
                               break;
                       }
                       changeRoom();
                   });
               }
           });
           $("#selectable-wheelchair5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWheelchair5 == false)
                   selectedWheelchair5 = true;
               else
                   selectedWheelchair5 = false;
               if (selectedWheelchair5)
                   $("#wheelchair5").val("1");
               else
                   $("#wheelchair5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-whiteboard5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedWhiteboard5 == false)
                   selectedWhiteboard5 = true;
               else
                   selectedWhiteboard5 = false;
               if (selectedWhiteboard5)
                   $("#whiteboard5").val("1");
               else
                   $("#whiteboard5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-projector5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedProjector5 == false)
                   selectedProjector5 = true;
               else
                   selectedProjector5 = false;
               if (selectedProjector5)
                   $("#projector5").val("1");
               else
                   $("#projector5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-visualiser5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVisualiser5 == false)
                   selectedVisualiser5 = true;
               else
                   selectedVisualiser5 = false;
               if (selectedVisualiser5)
                   $("#visualiser5").val("1");
               else
                   $("#visualiser5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-computer5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedComputer5 == false)
                   selectedComputer5 = true;
               else
                   selectedComputer5 = false;
               if (selectedComputer5)
                   $("#computer5").val("1");
               else
                   $("#computer5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-video5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedVideo5 == false)
                   selectedVideo5 = true;
               else
                   selectedVideo5 = false;
               if (selectedVideo5)
                   $("#video5").val("1");
               else
                   $("#video5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-pa5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedPa5 == false)
                   selectedPa5 = true;
               else
                   selectedPa5 = false;
               if (selectedPa5)
                   $("#pa5").val("1");
               else
                   $("#pa5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-mic5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedMic5 == false)
                   selectedMic5 = true;
               else
                   selectedMic5 = false;
               if (selectedMic5)
                   $("#mic5").val("1");
               else
                   $("#mic5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-capture5").bind("mousedown", function (e) {
               e.metaKey = true;
               if (selectedCap5 == false)
                   selectedCap5 = true;
               else
                   selectedCap5 = false;
               if (selectedCap5)
                   $("#capture5").val("1");
               else
                   $("#capture5").val("0");
               changeRoom();
           }).selectable();
           $("#selectable-day").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-day li").index(this);
                       switch (index) {
                           case 0:
                               $("#day").val("Monday");
                               break;
                           case 1:
                               $("#day").val("Tuesday");
                               break;
                           case 2:
                               $("#day").val("Wednesday");
                               break;
                           case 3:
                               $("#day").val("Thursday");
                               break;
                           case 4:
                               $("#day").val("Friday");
                               break;
                       }
                   });
               }
           });
            //end selectable
            getDeptCode();
            getModuleAjax();
            getRoomAjax();
            getBuildingAjax();
            loadDuration();
            loadPeriod();
            init_module_dialog();
            //implement jquery ui slider to 'number of rooms' and 'capacity'
            //start slider
            $("#slider-rooms").slider({
                range: "max",
                min: 1,
                max: 5,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#noRooms").val(ui.value);
                    //show room preference based on number of rooms
                    showPref();
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'noRooms'
            $("#noRooms").val($("#slider-rooms").slider("value"));
            //capacity 1
            $("#slider-capacity1").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity1").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacity1").val($("#slider-capacity1").slider("value"));
            //capacity 2
            $("#slider-capacity2").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity2").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity2'
            $("#capacity2").val($("#slider-capacity2").slider("value"));
            //capacity 3
            $("#slider-capacity3").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity3").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity3'
            $("#capacity3").val($("#slider-capacity3").slider("value"));
            //capacity 4
            $("#slider-capacity4").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity4").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity4'
            $("#capacity4").val($("#slider-capacity4").slider("value"));
            //capacity 5
            $("#slider-capacity5").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity5").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacity5").val($("#slider-capacity5").slider("value"));
            //end slider
            
        });
        //end document.ready
        
        //start AJAX
        //get current username
        function getModuleAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getModule",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d;
                    $("#module").empty();
                    for (var i = 0; i < result.length; i++) {
                        //populate module drop down list
                        $("#module").append("<option>" + result[i].module_code + " : " + result[i].module_title + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get modules that belongs to current department
        function getDeptCode() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getDept",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d;
                    for (var i = 0; i < result.length; i++) {
                        $("#dept").val(result[0]);
                        $("#mod_dept").val(result[1]);
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get room data and their location
        function getRoomAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getRooms",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    roomData = data.d;
                    changeRoom();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get building data
        function getBuildingAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getBuilding",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    buildingData = data.d;
                    for (var i = 0; i < buildingData.length; i++) {
                        $("#building1").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //let the user manually add new module into the database
        function addNewModuleAjax() {
            var module = {};
            module.mod_code = $("#mod_dept").val() + $("#mod_part").val() + $("#mod_num").val();
            module.mod_title = $("#mod_title").val();
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/insertModule",
                data: "{module: " + JSON.stringify(module) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                    getModuleAjax();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //end AJAX
        //display room preference options based on number of rooms
        function showPref() {
            var park = document.getElementById("park").value;
            for (var i = 1; i < 5; i++) {
                document.getElementById("room_pref" + (i + 1)).style.display = "none";
            }
            var noOfRooms = parseInt(document.getElementById('noRooms').value);
            if (noOfRooms > 1) {
                for (var j = 1; j < noOfRooms; j++) {
                    document.getElementById("room_pref" + (j + 1)).style.display = "block";
                }
            }
            for (var i = 0; i < buildingData.length; i++) {
                //if building is in selected park then add to building list
                if (park == "Any" || park == buildingData[i].park) {
                    $("#building1").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 1)
                        $("#building2").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 2)
                        $("#building3").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 3)
                        $("#building4").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 4)
                        $("#building5").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                }
            }
        }
        function changePark() {
            var noOfRooms = parseInt(document.getElementById('noRooms').value);
            var park = document.getElementById("park").value;
            //empty building list
            $("#building1").empty();
            $("#building2").empty();
            $("#building3").empty();
            $("#building4").empty();
            $("#building5").empty();
            //add "Any" option to building list
            $("#building1").append("<option>Any</option>");
            $("#building2").append("<option>Any</option>");
            $("#building3").append("<option>Any</option>");
            $("#building4").append("<option>Any</option>");
            $("#building5").append("<option>Any</option>");
            for (var i = 0; i < buildingData.length; i++) {
                //if building is in selected park then add to building list
                if (park == "Any" || park == buildingData[i].park) {
                    $("#building1").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 1)
                        $("#building2").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 2)
                        $("#building3").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 3)
                        $("#building4").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    if (noOfRooms > 4)
                        $("#building5").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                }
            }
            changeRoom();
        }
        //fill duration drop down list
        function loadDuration() {
            for (var i = 1; i <= 9;i++){
                $("#duration").append("<option>" + i + "</option>");
            }
        }
        //fill period drop down list
        function loadPeriod() {
            for (var i = 1; i <= 9; i++) {
                var time = i + 8;
                $("#period").append("<option value='" + i + "'>" + i + " - " + time + ":00</option>");
            }
        }
        //change uration based on period
        function refillDuration() {
            $("#duration").empty();
            var period = $("#period").val();
            for (var i = 1; i <= 10 - period; i++) {
                $("#duration").append("<option value='" + i + "'>" + i + "</option>");
            }
        }
        //change room preference Based on capacity, park and additional options
        function changeRoom(){
            //get values of user's selection
            var noOfRooms = parseInt(document.getElementById('noRooms').value);
            var park = document.getElementById("park").value;
            var building;
            if (document.getElementById("building1").value == "Any")
                building = "any";
            else
                building = document.getElementById("building1").value.substr(0, document.getElementById("building1").value.indexOf(":") - 1);
            //assign value based on number of rooms
            var building2;
            if (noOfRooms > 1) {
                if (document.getElementById("building2").value == "Any")
                    building2 = "any";
                else
                    building2 = document.getElementById("building2").value.substr(0, document.getElementById("building2").value.indexOf(":") - 1);
            }
            var building3;
            if (noOfRooms > 2) {
                if (document.getElementById("building3").value == "Any")
                    building3 = "any";
                else
                    building3 = document.getElementById("building3").value.substr(0, document.getElementById("building3").value.indexOf(":") - 1);
            }
            var building4;
            if (noOfRooms > 3) {
                if (document.getElementById("building4").value == "Any")
                    building4 = "any";
                else
                    building4 = document.getElementById("building4").value.substr(0, document.getElementById("building4").value.indexOf(":") - 1);
            }
            var building5;
            if (noOfRooms > 4) {
                if (document.getElementById("building5").value == "Any")
                    building5 = "any";
                else
                    building5 = document.getElementById("building5").value.substr(0, document.getElementById("building5").value.indexOf(":") - 1);
            }
            var capacity = parseInt(document.getElementById("capacity1").value);
            var capacity2; if (noOfRooms > 1) capacity2 = parseInt(document.getElementById("capacity2").value);
            var capacity3; if (noOfRooms > 2) capacity3 = parseInt(document.getElementById("capacity3").value);
            var capacity4; if (noOfRooms > 3) capacity4 = parseInt(document.getElementById("capacity4").value);
            var capacity5; if (noOfRooms > 4) capacity5 = parseInt(document.getElementById("capacity5").value);
            var isWheelchair = parseInt(document.getElementById("wheelchair").value);
            var isWheelchair2; if (noOfRooms > 1) isWheelchair2 = parseInt(document.getElementById("wheelchair2").value);
            var isWheelchair3; if (noOfRooms > 2) isWheelchair3 = parseInt(document.getElementById("wheelchair3").value);
            var isWheelchair4; if (noOfRooms > 3) isWheelchair4 = parseInt(document.getElementById("wheelchair4").value);
            var isWheelchair5; if (noOfRooms > 4) isWheelchair5 = parseInt(document.getElementById("wheelchair5").value);
            var isVisualiser = parseInt(document.getElementById("visualiser").value);
            var isVisualiser2; if (noOfRooms > 1) isVisualiser2 = parseInt(document.getElementById("visualiser2").value);
            var isVisualiser3; if (noOfRooms > 2) isVisualiser3 = parseInt(document.getElementById("visualiser3").value);
            var isVisualiser4; if (noOfRooms > 3) isVisualiser4 = parseInt(document.getElementById("visualiser4").value);
            var isVisualiser5; if (noOfRooms > 4) isVisualiser5 = parseInt(document.getElementById("visualiser5").value);
            var isProjector = parseInt(document.getElementById("projector").value);
            var isProjector2; if (noOfRooms > 1) isProjector2 = parseInt(document.getElementById("projector2").value);
            var isProjector3; if (noOfRooms > 2) isProjector3 = parseInt(document.getElementById("projector3").value);
            var isProjector4; if (noOfRooms > 3) isProjector4 = parseInt(document.getElementById("projector4").value);
            var isProjector5; if (noOfRooms > 4) isProjector5 = parseInt(document.getElementById("projector5").value);
            var isWhiteboard = parseInt(document.getElementById("whiteboard").value);
            var isWhiteboard2; if (noOfRooms > 1) isWhiteboard2 = parseInt(document.getElementById("whiteboard2").value);
            var isWhiteboard3; if (noOfRooms > 2) isWhiteboard3 = parseInt(document.getElementById("whiteboard3").value);
            var isWhiteboard4; if (noOfRooms > 3) isWhiteboard4 = parseInt(document.getElementById("whiteboard4").value);
            var isWhiteboard5; if (noOfRooms > 4) isWhiteboard5 = parseInt(document.getElementById("whiteboard5").value);
            var computer = parseInt(document.getElementById("computer").value);
            var computer2; if (noOfRooms > 1) computer2 = parseInt(document.getElementById("computer2").value);
            var computer3; if (noOfRooms > 2) computer3 = parseInt(document.getElementById("computer3").value);
            var computer4; if (noOfRooms > 3) computer4 = parseInt(document.getElementById("computer4").value);
            var computer5; if (noOfRooms > 4) computer5 = parseInt(document.getElementById("computer5").value);
            var capture = parseInt(document.getElementById("capture").value);
            var capture2; if (noOfRooms > 1) capture2 = parseInt(document.getElementById("capture2").value);
            var capture3; if (noOfRooms > 2) capture3 = parseInt(document.getElementById("capture3").value);
            var capture4; if (noOfRooms > 3) capture4 = parseInt(document.getElementById("capture4").value);
            var capture5; if (noOfRooms > 4) capture5 = parseInt(document.getElementById("capture5").value);
            var pa = parseInt(document.getElementById("pa").value);
            var pa2; if (noOfRooms > 1) pa2 = parseInt(document.getElementById("pa2").value);
            var pa3; if (noOfRooms > 2) pa3 = parseInt(document.getElementById("pa3").value);
            var pa4; if (noOfRooms > 3) pa4 = parseInt(document.getElementById("pa4").value);
            var pa5; if (noOfRooms > 4) pa5 = parseInt(document.getElementById("pa5").value);
            var mic = parseInt(document.getElementById("mic").value);
            var mic2; if (noOfRooms > 1) mic2 = parseInt(document.getElementById("mic2").value);
            var mic3; if (noOfRooms > 2) mic3 = parseInt(document.getElementById("mic3").value);
            var mic4; if (noOfRooms > 3) mic4 = parseInt(document.getElementById("mic4").value);
            var mic5; if (noOfRooms > 4) mic5 = parseInt(document.getElementById("mic5").value);
            var video = parseInt(document.getElementById("video").value);
            var video2; if (noOfRooms > 1) video2 = parseInt(document.getElementById("video2").value);
            var video3; if (noOfRooms > 2) video3 = parseInt(document.getElementById("video3").value);
            var video4; if (noOfRooms > 3) video4 = parseInt(document.getElementById("video4").value);
            var video5; if (noOfRooms > 4) video5 = parseInt(document.getElementById("video5").value);
            var arrangement_select = document.getElementById("arrangement").value;
            if (arrangement_select == "Tiered")
                arrangement = "tiered";
            else if (arrangement_select == "Any")
                arrangement = "any";
            else
                arrangement = "flat";
            
            var arrangement_select2; if (noOfRooms > 1) arrangement_select2 = document.getElementById("arrangement2").value;
            if (arrangement_select2 == "Tiered")
                arrangement2 = "tiered";
            else if (arrangement_select2 == "Any")
                arrangement2 = "any";
            else
                arrangement2 = "flat";
            var arrangement_select3; if (noOfRooms > 2) arrangement_select3 = document.getElementById("arrangement3").value;
            if (arrangement_select3 == "Tiered")
                arrangement3 = "tiered";
            else if (arrangement_select3 == "Any")
                arrangement3 = "any";
            else
                arrangement3 = "flat";
            var arrangement_select4; if (noOfRooms > 3) arrangement_select4 = document.getElementById("arrangement4").value;
            if (arrangement_select4 == "Tiered")
                arrangement4 = "tiered";
            else if (arrangement_select4 == "Any")
                arrangement4 = "any";
            else
                arrangement4 = "flat";
            var arrangement_select5; if (noOfRooms > 4) arrangement_select5 = document.getElementById("arrangement5").value;
            if (arrangement_select5 == "Tiered")
                arrangement5 = "tiered";
            else if (arrangement_select5 == "Any")
                arrangement5 = "any";
            else
                arrangement5 = "flat";
            var room_arr1;
            var room_arr2;
            var room_arr3;
            var room_arr4;
            var room_arr5;

            //empty the room code list
            $("#room1").empty();
            $("#room1").append("<option>" + "Any" + "</option>");
            $("#room2").empty();
            $("#room2").append("<option>" + "Any" + "</option>");
            $("#room3").empty();
            $("#room3").append("<option>" + "Any" + "</option>");
            $("#room4").empty();
            $("#room4").append("<option>" + "Any" + "</option>");
            $("#room5").empty();
            $("#room5").append("<option>" + "Any" + "</option>");
            
            for (var i = 0; i < roomData.length; i++) {
                //room preference 1
                //check room arrangement selection
                if (arrangement == "tiered")
                    room_arr1 = roomData[i].tiered;
                else if (arrangement == "any")
                    room_arr1 = arrangement;
                else
                    room_arr1 = roomData[i].flat;
                
                //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                if ((park == "Any" || park == roomData[i].park) &&
                (isWheelchair == 0 || roomData[i].wheelchair == 1) &&
                (isVisualiser == 0 || roomData[i].visualiser == 1) &&
                (isProjector == 0 || roomData[i].projector == 1) &&
                (isWhiteboard == 0 || roomData[i].whiteboard == 1) &&
                (computer == 0 || roomData[i].computer == 1) &&
                (capture == 0 || roomData[i].lecture_capture == 1) &&
                (pa == 0 || roomData[i].pa_system == 1) &&
                (mic == 0 || roomData[i].radio_microphone == 1) &&
                (video == 0 || roomData[i].video_dvd == 1) &&
                (roomData[i].capacity >= capacity) &&
                (room_arr1 == "any" || room_arr1 == 1) &&
                (building == "any" || building == roomData[i].building_code)) {
                    $("#room1").append("<option>" + roomData[i].room_code + "</option>");
                }

                //room preference 2
                //only apply this if number of rooms is 2
                //check room arrangement selection
                if (noOfRooms > 1) {
                    if (arrangement2 == "tiered")
                        room_arr2 = roomData[i].tiered;
                    else if (arrangement2 == "any")
                        room_arr2 = arrangement;
                    else
                        room_arr2 = roomData[i].flat;
                    //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                    //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                    if ((park == "Any" || park == roomData[i].park) &&
                    (isWheelchair2 == 0 || roomData[i].wheelchair == 1) &&
                    (isVisualiser2 == 0 || roomData[i].visualiser == 1) &&
                    (isProjector2 == 0 || roomData[i].projector == 1) &&
                    (isWhiteboard2 == 0 || roomData[i].whiteboard == 1) &&
                    (computer2 == 0 || roomData[i].computer == 1) &&
                    (capture2 == 0 || roomData[i].lecture_capture == 1) &&
                    (pa2 == 0 || roomData[i].pa_system == 1) &&
                    (mic2 == 0 || roomData[i].radio_microphone == 1) &&
                    (video2 == 0 || roomData[i].video_dvd == 1) &&
                    (roomData[i].capacity >= capacity2) &&
                    (room_arr2 == "any" || room_arr2 == 1) &&
                    (building2 == "any" || building2 == roomData[i].building_code)) {
                        $("#room2").append("<option>" + roomData[i].room_code + "</option>");
                }
            }
                //room preference 3
                //only apply this if number of rooms is 3
                //check room arrangement selection
                if (noOfRooms > 2) {
                    if (arrangement3 == "tiered")
                        room_arr3 = roomData[i].tiered;
                    else if (arrangement3 == "any")
                        room_arr3 = arrangement;
                    else
                        room_arr3 = roomData[i].flat;
                    //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                    //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                    if ((park == "Any" || park == roomData[i].park) &&
                    (isWheelchair3 == 0 || roomData[i].wheelchair == 1) &&
                    (isVisualiser3 == 0 || roomData[i].visualiser == 1) &&
                    (isProjector3 == 0 || roomData[i].projector == 1) &&
                    (isWhiteboard3 == 0 || roomData[i].whiteboard == 1) &&
                    (computer3 == 0 || roomData[i].computer == 1) &&
                    (capture3 == 0 || roomData[i].lecture_capture == 1) &&
                    (pa3 == 0 || roomData[i].pa_system == 1) &&
                    (mic3 == 0 || roomData[i].radio_microphone == 1) &&
                    (video3 == 0 || roomData[i].video_dvd == 1) &&
                    (roomData[i].capacity >= capacity3) &&
                    (room_arr3 == "any" || room_arr3 == 1) &&
                    (building3 == "any" || building3 == roomData[i].building_code)) {
                        $("#room3").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                //room preference 4
                //only apply this if number of rooms is 4
                //check room arrangement selection
                if (noOfRooms > 3) {
                    if (arrangement4 == "tiered")
                        room_arr4 = roomData[i].tiered;
                    else if (arrangement4 == "any")
                        room_arr4 = arrangement;
                    else
                        room_arr4 = roomData[i].flat;
                    //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                    //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                    if ((park == "Any" || park == roomData[i].park) &&
                    (isWheelchair4 == 0 || roomData[i].wheelchair == 1) &&
                    (isVisualiser4 == 0 || roomData[i].visualiser == 1) &&
                    (isProjector4 == 0 || roomData[i].projector == 1) &&
                    (isWhiteboard4 == 0 || roomData[i].whiteboard == 1) &&
                    (computer4 == 0 || roomData[i].computer == 1) &&
                    (capture4 == 0 || roomData[i].lecture_capture == 1) &&
                    (pa4 == 0 || roomData[i].pa_system == 1) &&
                    (mic4 == 0 || roomData[i].radio_microphone == 1) &&
                    (video4 == 0 || roomData[i].video_dvd == 1) &&
                    (roomData[i].capacity >= capacity4) &&
                    (room_arr4 == "any" || room_arr4 == 1) &&
                    (building4 == "any" || building4 == roomData[i].building_code)) {
                        $("#room4").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                //room preference 5
                //only apply this if number of rooms is 5
                //check room arrangement selection
                if (noOfRooms > 4) {
                    if (arrangement5 == "tiered")
                        room_arr5 = roomData[i].tiered;
                    else if (arrangement5 == "any")
                        room_arr5 = arrangement;
                    else
                        room_arr5 = roomData[i].flat;
                    //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                    //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                    if ((park == "Any" || park == roomData[i].park) &&
                    (isWheelchair5 == 0 || roomData[i].wheelchair == 1) &&
                    (isVisualiser5 == 0 || roomData[i].visualiser == 1) &&
                    (isProjector5 == 0 || roomData[i].projector == 1) &&
                    (isWhiteboard5 == 0 || roomData[i].whiteboard == 1) &&
                    (computer5 == 0 || roomData[i].computer == 1) &&
                    (capture5 == 0 || roomData[i].lecture_capture == 1) &&
                    (pa5 == 0 || roomData[i].pa_system == 1) &&
                    (mic5 == 0 || roomData[i].radio_microphone == 1) &&
                    (video5 == 0 || roomData[i].video_dvd == 1) &&
                    (roomData[i].capacity >= capacity5) &&
                    (room_arr5 == "any" || room_arr5 == 1) &&
                    (building5 == "any" || building5 == roomData[i].building_code)) {
                        $("#room5").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
            }
        }
        function init_module_dialog() {
            $("#dialog-module").dialog();
            $("#dialog-module").dialog("close");
        }
        function showModDialog() {
            $("#dialog-module").dialog("open");
        }
    </script>

  
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Create Request - Round: 1</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div id="general_info">
        <%-- General information --%>
        <table class="inputs box_class" id="main_layout" >
            <tr>
                <td align="left" colspan="2" style="padding-left:5px; color:#CA006C;"  >Department</td>
                <td align="left">Module</td>
            </tr>
            <tr>
                <%-- Department --%>
                <td align="left" colspan="2" style="padding-left:5px;">
                    <input type="text" id="dept" name="dept" style="border:0;" readonly="readonly" />
                </td>
                <%-- Module --%>
                <td align="left">
                    <select id="module" name="module">

                    </select><br />
                    <input type="button" id="add_mod" onclick="showModDialog()" value="Add New Module" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="padding-left:5px;">Number of Rooms</td>
                <td align="left">Session Type</td>
            </tr>
            <tr>
                <%-- Number of rooms --%>
                <td align="center" colspan="2">
                    <table>
                        <tr>
                            <td>
                                <div id="slider-rooms"></div>
                            </td>
                            <td>
                                <input type="text" id="noRooms" name="noRooms" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                            </td>
                        </tr>
                    </table>
                </td>
                <%-- Session type --%>
                <td align="left">
                    <ol id="selectable-session">
                        <li class="ui-state-default ui-selected" style="width: 80px">Lecture</li>
                        <li class="ui-state-default" style="width: 80px">Practical</li>
                        <li class="ui-state-default" style="width: 80px">Seminar</li>
                        <li class="ui-state-default" style="width: 80px">Tutorial</li>
                    </ol>
                    <input type="hidden" id="session" name="session" value="Lecture" />
                </td>
            </tr>
            <tr>
                <td align="left" style="padding-left:5px;">
                    Priority
                </td>
                <td align="left">
                    Park
                </td>
                <td align="left">
                    Lecturer
                </td>
            </tr>
            <tr>
                <td align="left" style="padding-left:5px;">
                    <input type="text" readonly="readonly" value="P" />
                </td>
                <%-- Park --%>
                <td align="left">
                    <table>
                        <tr>
                            <td>
                                
                                <select id="park" name="park" onchange="changePark()">
                                    <option>Any</option>
                                    <option>Central</option>
                                    <option>East</option>
                                    <option>West</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="left">
                    <input type="text" id="lecturer" name="lecturer" />
                </td>
            </tr>
        </table>
        <br />
        <%--Room preference 1--%> 
        <div id="room_pref1">     
            <table class="inputs box_class">
                <tr>
                    <td colspan="2" align="left" style="padding-left:5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <%--Facility options 1--%> 
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-computer">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer" name="computer" value="0"/>
                                </td>
                                <td>
                                        <ol id="selectable-capture">
                                            <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                        </ol>
                                        <input type="hidden" id="capture" name="capture" value="0" />
                                </td>
                                </tr>
                                <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-pa">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa" name="pa" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector" name="projector" value="0" />
                                </td>
                                </tr>
                                <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-mic">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic" name="mic" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video" name="video" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-visualiser">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser" name="visualiser" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard" name="whiteboard" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-wheelchair">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair" name="wheelchair" value="0" />
                                </td>
                            </tr>
                        </table>
                        </td>
                        <td align="left">
                            <ol id="selectable-arrangement">
                                <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                                <li class="ui-state-default" style="width: 200px">Tiered</li>
                                <li class="ui-state-default" style="width: 200px">Flat</li>
                            </ol>
                            <input type="hidden" id="arrangement" name="arrangement" value="Any" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3"  style="padding-left:5px;">
                            Capacity
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <div id="slider-capacity1"></div>
                                    </td>
                                    <td>
                                        <input type="text" id="capacity1" name="capacity1" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2"  style="padding-left:5px;">Building</td>
                        <td align="left">Room</td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" style="padding-left:5px;">
                            <select id="building1" name="building1" onchange="changeRoom()">
                                <option>Any</option>
                            </select>
                        </td>
                        <td align="left">
                            <select id="room1" name="room1"></select>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3" style="padding-left:5px;">Additional requirement</td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3"  style="padding-left:5px;">
                            <textarea style="width:835px;" name="specialReq1" cols="80" maxlength="1000"></textarea>
                        </td>
                    </tr>
                </table>
            </div> 
          <br />
          <%--Room preference 2--%> 
        <div id="room_pref2" style="display:none">
            <table class="inputs box_class">
                <tr>
                    <td colspan="2" align="left"  style="padding-left:5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 2--%> 
                                <td  style="padding-left:5px;">
                                    <ol id="selectable-computer2">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer2" name="computer2" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture2">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture2" name="capture2" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-pa2">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa2" name="pa2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector2">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector2" name="projector2" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-mic2">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic2" name="mic2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video2">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video2" name="video2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-visualiser2">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser2" name="visualiser2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard2">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard2" name="whiteboard2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-wheelchair2">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair2" name="wheelchair2" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement2">
                            <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                            <li class="ui-state-default" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement2" name="arrangement2" value="Any" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left:5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity2"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <select id="building2" name="building2" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room2" name="room2"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        <textarea style="width:835px;" name="specialReq2" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
        </div>
          <br />
        <%--Room preference 3--%> 
        <div id="room_pref3" style="display:none">
            <table class="inputs box_class">
                <tr>
                    <td colspan="2" align="left" style="padding-left:5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 3--%> 
                                <td style="padding-left:5px;">
                                    <ol id="selectable-computer3">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer3" name="computer3" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture3">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture3" name="capture3" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-pa3">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa3" name="pa3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector3">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector3" name="projector3" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-mic3">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic3" name="mic3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video3">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video3" name="video3" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-visualiser3">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser3" name="visualiser3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard3">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard3" name="whiteboard3" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:5px;">
                                    <ol id="selectable-wheelchair3">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair3" name="wheelchair3" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement3">
                            <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                            <li class="ui-state-default" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement3" name="arrangement3" value="Any" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left:5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity3"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity3" name="capacity3" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <select id="building3" name="building3" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room3" name="room3"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        <textarea style="width:835px;" name="specialReq3" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
        </div>
          <br />
        <%--Room preference 4--%> 
        <div id="room_pref4" style="display:none">
            <table class="inputs box_class">
                <tr>
                    <td colspan="2" align="left" style="padding-left:5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <table>
                            <tr>
                                <%--Facility options 4--%> 
                                <td>
                                    <ol id="selectable-computer4">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer4" name="computer4" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture4">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture4" name="capture4" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-pa4">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa4" name="pa4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector4">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector4" name="projector4" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-mic4">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic4" name="mic4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video4">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video4" name="video4" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-visualiser4">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser4" name="visualiser4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard4">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard4" name="whiteboard4" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-wheelchair4">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair4" name="wheelchair4" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement4">
                            <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                            <li class="ui-state-default" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement4" name="arrangement4" value="Any" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left:5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity4"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity4" name="capacity4" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <select id="building4" name="building4" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room4" name="room4"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        <textarea style="width:835px;" name="specialReq4" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <%--Room preference 5--%> 
        <div id="room_pref5" style="display:none">
            <table class="inputs box_class">
                <tr>
                    <td colspan="2" align="left" style="padding-left:5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <table>
                            <tr>
                                <%--Facility options 5--%> 
                                <td>
                                    <ol id="selectable-computer5">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer5" name="computer5" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture5">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture5" name="capture5" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-pa5">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa5" name="pa5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector5">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector5" name="projector5" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-mic5">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic5" name="mic5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video5">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video5" name="video5" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-visualiser5">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser5" name="visualiser5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard5">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard5" name="whiteboard5" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-wheelchair5">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair5" name="wheelchair5" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement5">
                            <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                            <li class="ui-state-default" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement5" name="arrangement5" value="Any" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left:5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity5"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity5" name="capacity5" readonly="readonly" style="border:0; color:#CA006C; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left:5px;">
                        <select id="building5" name="building5" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room5" name="room5"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left:5px;">
                        <textarea style="width:835px;" name="specialReq5" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <%--Time--%>
        <div id="time">
            <table class="inputs box_bottom_class">
                <tr>
                    <td align="left" style="padding-left:5px;">Day</td>
                    <td align="left">Semester</td>
                    <td align="left">Period</td>
                    <td align="left">Duration</td>
                </tr>
                <tr>
                    <%--Selectable - Day--%>
                    <td align="left" style="padding-left:5px;" >
                        <table><tr>
                        <ol id="selectable-day">
                            <li class="ui-state-default" style="width: 100px">Monday</li>
                            <li class="ui-state-default" style="width: 100px">Tuesday</li>
                            <li class="ui-state-default" style="width: 100px">Wednesday</li>
                            <li class="ui-state-default" style="width: 100px">Thursday</li>
                            <li class="ui-state-default" style="width: 100px">Friday</li>
                        </ol>
                        </td></tr></table>
                        <input type="hidden" id="day" name="day" value=""/>
                    </td>
                    <%--Drop down for semester--%>
                    <td align="left">
                        <select id="semester" name="semester">
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </td>
                    <%--Drop down for period - content populate by function loadPeriod() when the page load--%>
                    <td align="left">
                        <select id="period" name="period" onchange="refillDuration()">

                        </select>
                    </td>
                    <%--Drop down for duration - content populate by function loadDuration() when the page load--%>
                     <td align="left">
                        <select id="duration" name="duration">

                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="left" style="padding-left:200px;">Week</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="checkbox" name="weeks[]" id="week1" value="1" checked="checked" class="vis-hidden new-post-tags"/>
						<label style="margin-left: 100px;" id="week" for="week1" class="week_label">  1  </label>
						<input type="checkbox" name="weeks[]" id="week2" value="2" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week2" class="week_label">  2  </label>
						<input type="checkbox" name="weeks[]" id="week3" value="3" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week3" class="week_label">  3  </label>
						<input type="checkbox" name="weeks[]" id="week4" value="4" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week4" class="week_label">  4  </label>
						<input type="checkbox" name="weeks[]" id="week5" value="5" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week5" class="week_label">  5  </label>
						<input type="checkbox" name="weeks[]" id="week6" value="6" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week6" class="week_label">  6  </label>
						<input type="checkbox" name="weeks[]" id="week7" value="7" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week7" class="week_label">  7  </label>
						<input type="checkbox" name="weeks[]" id="week8" value="8" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week8" class="week_label">  8  </label>
						<input type="checkbox" name="weeks[]" id="week9" value="9" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week9" class="week_label">  9  </label>
						<input type="checkbox" name="weeks[]" id="week10" value="10" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week10" class="week_label"> 10 </label>
						<input type="checkbox" name="weeks[]" id="week11" value="11" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week11" class="week_label"> 11 </label>
						<input type="checkbox" name="weeks[]" id="week12" value="12" checked="checked" class="vis-hidden new-post-tags"/>
						<label id="week" for="week12" class="week_label"> 12 </label>
						<input type="checkbox" name="weeks[]" id="week13" value="13" class="vis-hidden new-post-tags"/>
						<label id="week" for="week13" class="week_label"> 13 </label>
						<input type="checkbox" name="weeks[]" id="week14" value="14" class="vis-hidden new-post-tags"/>
						<label id="week" for="week14" class="week_label"> 14 </label>
						<input type="checkbox" name="weeks[]" id="week15" value="15" class="vis-hidden new-post-tags"/>
						<label id="week" for="week15" class="week_label"> 15 </label>
						<input type="checkbox" name="weeks[]" id="week16" value="16" class="vis-hidden new-post-tags"/>
						<label id="week" for="week16" class="week_label"> 16 </label>
                    </td>
                </tr>
            </table>
        </div>
      </div>
    <div id="dialog-module" title="Add New Module">
        <form id="module_form" name="module_form" method="post">
            Module code: <input type="text" id="mod_dept" readonly="readonly" name="mod_dept" /> &nbsp; 
            <select id="mod_part" name="mod_part">
                <option>A</option>
                <option>B</option>
                <option>C</option>
                <option>D</option>
                <option>F</option>
                <option>I</option>
                <option>P</option>
            </select> &nbsp;
            <input type="text" id="mod_num" name="mod_num" /><br />
            Module title: <input type="text" id="mod_title" name="mod_title" /><br /> 
            <input type="button" id="module_submit" value="Submit" onclick="addNewModuleAjax()" />&nbsp; 
            <input type="button" id="module_cancel" value="Cancel" onclick="$('#dialog-module').dialog('close')" />  
        </form>
    </div>      
</asp:Content>
