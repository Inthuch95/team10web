<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback="true" %>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        var roomData;
        var buildingData;
        var currentDept;
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
        //selectable Private
        var selectedWhiteboardPr = false;
        var selectedComputerPr = false;
        var selectedCapPr = false;
        var selectedPaPr = false;
        var selectedProjectorPr = false;
        var selectedMicPr = false;
        var selectedVideoPr = false;
        var selectedVisualiserPr = false;
        var selectedWheelchairPr = false;
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
            //Private Room
            $("#selectable-arrangementPr").selectable({
                stop: function () {
                    $(".ui-selected", this).each(function () {
                        var index = $("#selectable-arrangementPr li").index(this);
                        switch (index) {
                            case 0:
                                $("#arrangementPr").val("Tiered");
                                break;
                            case 1:
                                $("#arrangementPr").val("Flat");
                                break;
                        }
                    });
                }
            });
            $("#selectable-wheelchairPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedWheelchairPr == false)
                    selectedWheelchairPr = true;
                else
                    selectedWheelchairPr = false;
                if (selectedWheelchairPr)
                    $("#wheelchairPr").val("1");
                else
                    $("#wheelchairPr").val("0");
            }).selectable();
            $("#selectable-whiteboardPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedWhiteboardPr == false)
                    selectedWhiteboardPr = true;
                else
                    selectedWhiteboardPr = false;
                if (selectedWhiteboardPr)
                    $("#whiteboardPr").val("1");
                else
                    $("#whiteboardPr").val("0");
            }).selectable();
            $("#selectable-projectorPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedProjectorPr == false)
                    selectedProjectorPr = true;
                else
                    selectedProjectorPr = false;
                if (selectedProjectorPr)
                    $("#projectorPr").val("1");
                else
                    $("#projectorPr").val("0");
            }).selectable();
            $("#selectable-visualiserPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedVisualiserPr == false)
                    selectedVisualiserPr = true;
                else
                    selectedVisualiserPr = false;
                if (selectedVisualiserPr)
                    $("#visualiserPr").val("1");
                else
                    $("#visualiserPr").val("0");
            }).selectable();
            $("#selectable-computerPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedComputerPr == false)
                    selectedComputerPr = true;
                else
                    selectedComputerPr = false;
                if (selectedComputerPr)
                    $("#computerPr").val("1");
                else
                    $("#computerPr").val("0");
            }).selectable();
            $("#selectable-videoPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedVideoPr == false)
                    selectedVideoPr = true;
                else
                    selectedVideoPr = false;
                if (selectedVideoPr)
                    $("#videoPr").val("1");
                else
                    $("#videoPr").val("0");
            }).selectable();
            $("#selectable-paPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedPaPr == false)
                    selectedPaPr = true;
                else
                    selectedPaPr = false;
                if (selectedPaPr)
                    $("#paPr").val("1");
                else
                    $("#paPr").val("0");
            }).selectable();
            $("#selectable-micPr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedMicPr == false)
                    selectedMicPr = true;
                else
                    selectedMicPr = false;
                if (selectedMicPr)
                    $("#micPr").val("1");
                else
                    $("#micPr").val("0");
            }).selectable();
            $("#selectable-capturePr").bind("mousedown", function (e) {
                e.metaKey = true;
                if (selectedCapPr == false)
                    selectedCapPr = true;
                else
                    selectedCapPr = false;
                if (selectedCapPr)
                    $("#capturePr").val("1");
                else
                    $("#capturePr").val("0");
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
            getBuildingAjaxPr();
            loadDuration();
            loadPeriod();
            init_module_dialog();
            loadRoomDialog();
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
            //capacity 5
            $("#slider-capacityPr").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacityPr").val(ui.value);
                    changeRoom();
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacityPr").val($("#slider-capacityPr").slider("value"));
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
                        $("#module").append("<option value='" + result[i].module_code + "'>" + result[i].module_code + " : " + result[i].module_title + "</option>");
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
                    currentDept = data.d;
                    console.log(currentDept);
                    $("#dept").val(currentDept[0]);
                    $("#mod_dept").val(currentDept[1]);
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
        function insertRequestAjax() {
            for (var i = 1; i <= 16; i++) {
                if ($("#week" + i).prop("checked")) {
                    $("#week" + i + "-check").val(1);
                    console.log($("#week" + i + "-check").val());
                }
                else {
                    $("#week" + i + "-check").val(0);
                    console.log($("#week" + i + "-check").val());
                }
            }
            if (confirm("Are you sure?")) {
                //collect form value as object
                var request = {};

                request.module = $("#module").val();
                request.noRooms = $("#noRooms").val();
                request.room_code1 = $("#room1").val();
                request.room_code2 = $("#room2").val();
                request.room_code3 = $("#room3").val();
                request.room_code4 = $("#room4").val();
                request.room_code5 = $("#room5").val();
                request.capacity1 = $("#capacity1").val();
                request.capacity2 = $("#capacity2").val();
                request.capacity3 = $("#capacity3").val();
                request.capacity4 = $("#capacity4").val();
                request.capacity5 = $("#capacity5").val();
                request.wheelchair = $("#wheelchair").val();
                request.projector = $("#projector").val();
                request.visualiser = $("#visualiser").val();
                request.whiteboard = $("#whiteboard").val();
                request.computer = $("#computer").val();
                request.lecture_capture = $("#capture").val();
                request.video_dvd = $("#video").val();
                request.pa_system = $("#pa").val();
                request.radio_microphone = $("#mic").val();
                request.wheelchair2 = $("#wheelchair2").val();
                request.projector2 = $("#projector2").val();
                request.visualiser2 = $("#visualiser2").val();
                request.whiteboard2 = $("#whiteboard2").val();
                request.computer2 = $("#computer2").val();
                request.lecture_capture2 = $("#capture2").val();
                request.video_dvd2 = $("#video2").val();
                request.pa_system2 = $("#pa2").val();
                request.radio_microphone2 = $("#mic2").val();
                request.wheelchair3 = $("#wheelchair3").val();
                request.projector3 = $("#projector3").val();
                request.visualiser3 = $("#visualiser3").val();
                request.whiteboard3 = $("#whiteboard3").val();
                request.computer3 = $("#computer3").val();
                request.lecture_capture3 = $("#capture3").val();
                request.video_dvd3 = $("#video3").val();
                request.pa_system3 = $("#pa3").val();
                request.radio_microphone3 = $("#mic3").val();
                request.wheelchair4 = $("#wheelchair4").val();
                request.projector4 = $("#projector4").val();
                request.visualiser4 = $("#visualiser4").val();
                request.whiteboard4 = $("#whiteboard4").val();
                request.computer4 = $("#computer4").val();
                request.lecture_capture4 = $("#capture4").val();
                request.video_dvd4 = $("#video4").val();
                request.pa_system4 = $("#pa4").val();
                request.radio_microphone4 = $("#mic4").val();
                request.wheelchair5 = $("#wheelchair5").val();
                request.projector5 = $("#projector5").val();
                request.visualiser5 = $("#visualiser5").val();
                request.whiteboard5 = $("#whiteboard5").val();
                request.computer5 = $("#computer5").val();
                request.lecture_capture5 = $("#capture5").val();
                request.video_dvd5 = $("#video5").val();
                request.pa_system5 = $("#pa5").val();
                request.radio_microphone5 = $("#mic5").val();
                request.arrangement = $("#arrangement").val();
                request.arrangement2 = $("#arrangement2").val();
                request.arrangement3 = $("#arrangement3").val();
                request.arrangement4 = $("#arrangement4").val();
                request.arrangement5 = $("#arrangement5").val();
                request.special_req1 = $("#specialReq1").val();
                request.special_req2 = $("#specialReq2").val();
                request.special_req3 = $("#specialReq3").val();
                request.special_req4 = $("#specialReq4").val();
                request.special_req5 = $("#specialReq5").val();
                request.priority = $("#priority").val();
                request.day = $("#day").val();
                request.period = $("#period").val();
                request.duration = $("#duration").val();
                request.status = "Pending";
                request.semester = $("#semester").val();
                request.lecturer = $("#lecturer").val();
                request.session = $("#session").val();
                request.park = $("#park").val();
                request.year = "2015";
                request.week1 = $("#week1-check").val();
                request.week2 = $("#week2-check").val();
                request.week3 = $("#week3-check").val();
                request.week4 = $("#week4-check").val();
                request.week5 = $("#week5-check").val();
                request.week6 = $("#week6-check").val();
                request.week7 = $("#week7-check").val();
                request.week8 = $("#week8-check").val();
                request.week9 = $("#week9-check").val();
                request.week10 = $("#week10-check").val();
                request.week11 = $("#week11-check").val();
                request.week12 = $("#week12-check").val();
                request.week13 = $("#week13-check").val();
                request.week14 = $("#week14-check").val();
                request.week15 = $("#week15-check").val();
                request.week16 = $("#week16-check").val();
                $.ajax(
                 {
                     type: "POST",
                     async: true,
                     url: "CreateRequest.aspx/insertRequest",
                     data: "{request: " + JSON.stringify(request) + "}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (data) {
                         alert("success");
                     },
                     error: function (response) {
                         console.log(response);
                     }
                 });
            }
            else
                return false;
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
                (building == "any" || building == roomData[i].building_code) && roomData[i].dept == "pool") {
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
        function loadRoomDialog() {
            $("#dialog-pool").dialog({
                height: 500,
                width: 900,
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-pool").dialog("close");
        }
        function showPoolDialog() {
            $("#dialog-pool").dialog("open");
        }
        function getBuildingAjaxPr() {
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
                        $("#building_filter").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        $("#building_add").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        function fillBuildingPart() {
            var buildingSelect = document.getElementById("building_add").value;
            var building = buildingSelect.substring(0, buildingSelect.indexOf(":") - 1);
            $("#building_part").val(building);
        }
        function insertRoomAjax() {
            var room = {};
            //get user input value
            var buildingSelect = document.getElementById("building_add").value;
            var building = buildingSelect.substring(0, buildingSelect.indexOf(":") - 1);
            var roomCode = document.getElementById("building_part").value + "." + document.getElementById("floor_part").value + "." + document.getElementById("room_part").value;
            var capacity = $("#capacityPr").val();
            var wheelchair = $("#wheelchairPr").val();
            var visualiser = $("#visualiserPr").val();
            var projector = $("#projectorPr").val();
            var whiteboard = $("#whiteboardPr").val();
            var computer = $("#computerPr").val();
            var capture = $("#capturePr").val();
            var pa = $("#paPr").val();
            var mic = $("#micPr").val();
            var video = $("#videoPr").val();

            var tiered
            var flat
            if (document.getElementById("arrangementPr").value == "Tiered") {
                tiered = 1;
                flat = 0;
            }
            else {
                tiered = 0;
                flat = 1;
            }
            room.building_code = building;
            room.room_code = roomCode;
            room.capacity = capacity;
            room.wheelchair = wheelchair;
            room.projector = projector;
            room.visualiser = visualiser;
            room.whiteboard = whiteboard;
            room.computer = computer;
            room.lecture_capture = capture;
            room.video_dvd = video;
            room.pa_system = pa;
            room.radio_microphone = mic;
            room.tiered = tiered;
            room.flat = flat;
            if (confirm("Are you sure you want to add this room?")) {
                $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "CreateRequest.aspx/insertRoom",
                    data: "{room: " + JSON.stringify(room) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("success");
                        getRoomAjax();
                        $("#dialog-add-room").dialog("close");
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
            }
            else
                return false;
        }

        function checkRadio() {

            if (document.getElementById('roomsAll').checked) {
                rate_value = document.getElementById('roomsAll').value;

                $("#room1").empty();
                changePark();
                changeRoom();
            }
            if (document.getElementById('roomsPriv').checked) {
                rate_value = document.getElementById('roomsPriv').value;

                //code to insert private rooms into rooms select
                $("#room1").empty();
                $("#room1").append("<option>Any</option>");
                for (var i = 0; i < roomData.length; i++) {
                    if (currentDept[1] == roomData[i].dept) {
                        $("#room1").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                $("#building1").empty();
                $("#building1").append("<option>Any</option>");
            }

        }
        function checkRadio2() {

            if (document.getElementById('roomsAll2').checked) {
                rate_value = document.getElementById('roomsAll2').value;

                $("#room2").empty();
                changePark();
                changeRoom();
            }
            if (document.getElementById('roomsPriv2').checked) {
                rate_value = document.getElementById('roomsPriv2').value;

                //code to insert private rooms into rooms select
                $("#room2").empty();
                $("#room2").append("<option>Any</option>");
                for (var i = 0; i < roomData.length; i++) {
                    if (currentDept[1] == roomData[i].dept) {
                        $("#room2").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                $("#building2").empty();
                $("#building2").append("<option>Any</option>");
            }

        }
        function checkRadio3() {

            if (document.getElementById('roomsAll').checked) {
                rate_value = document.getElementById('roomsAll').value;

                $("#room3").empty();
                changePark();
                changeRoom();
            }
            if (document.getElementById('roomsPriv').checked) {
                rate_value = document.getElementById('roomsPriv').value;

                //code to insert private rooms into rooms select
                $("#room3").empty();
                $("#room3").append("<option>Any</option>");
                for (var i = 0; i < roomData.length; i++) {
                    if (currentDept[1] == roomData[i].dept) {
                        $("#room3").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                $("#building3").empty();
                $("#building3").append("<option>Any</option>");
            }

        }
        function checkRadio4() {

            if (document.getElementById('roomsAll').checked) {
                rate_value = document.getElementById('roomsAll').value;

                $("#room4").empty();
                changePark();
                changeRoom();
            }
            if (document.getElementById('roomsPriv').checked) {
                rate_value = document.getElementById('roomsPriv').value;

                //code to insert private rooms into rooms select
                $("#room4").empty();
                $("#room4").append("<option>Any</option>");
                for (var i = 0; i < roomData.length; i++) {
                    if (currentDept[1] == roomData[i].dept) {
                        $("#room4").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                $("#building4").empty();
                $("#building4").append("<option>Any</option>");
            }

        }
        function checkRadio5() {

            if (document.getElementById('roomsAll').checked) {
                rate_value = document.getElementById('roomsAll').value;

                $("#room5").empty();
                changePark();
                changeRoom();
            }
            if (document.getElementById('roomsPriv').checked) {
                rate_value = document.getElementById('roomsPriv').value;

                //code to insert private rooms into rooms select
                $("#room5").empty();
                $("#room5").append("<option>Any</option>");
                for (var i = 0; i < roomData.length; i++) {
                    if (currentDept[1] == roomData[i].dept) {
                        $("#room5").append("<option>" + roomData[i].room_code + "</option>");
                    }
                }
                $("#building5").empty();
                $("#building5").append("<option>Any</option>");
            }

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
        <table class="inputs box_class" id="main_layout">
            <tr>
                <td align="left" colspan="2" style="padding-left: 5px; color: #CA006C;">Department</td>
                <td align="left">Module</td>
            </tr>
            <tr>
                <%-- Department --%>
                <td align="left" colspan="2" style="padding-left: 5px;">
                    <input type="text" id="dept" name="dept" style="border: 0;" readonly="readonly" />
                </td>
                <%-- Module --%>
                <td align="left">
                    <select id="module" name="module">
                    </select><br />
                    <input type="button" id="add_mod" onclick="showModDialog()" value="Add New Module" />
                    <input type="button" id="add_room" onclick="showPoolDialog()" value="Add New Private Room" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="padding-left: 5px;">Number of Rooms</td>
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
                                <input type="text" id="noRooms" name="noRooms" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
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
                <td align="left" style="padding-left: 5px;">Priority
                </td>
                <td align="left">Park
                </td>
                <td align="left">Lecturer
                </td>
            </tr>
            <tr>
                <td align="left" style="padding-left: 5px;">
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
                    <td colspan="3" align="left" style="padding-left: 5px;">Room Preference 1</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left: 5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <%--Facility options 1--%>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-computer">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer" name="computer" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-capture">
                                        <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                    </ol>
                                    <input type="hidden" id="capture" name="capture" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                    <td align="left" colspan="3" style="padding-left: 5px;">Capacity
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
                                    <input type="text" id="capacity1" name="capacity1" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms" value="all" id="roomsAll" checked onclick="checkRadio()">Pool Rooms</td>
                    <td align="left" >Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms" value="private" id="roomsPriv" onclick="checkRadio()" />Private Rooms</td>
                    <td align="left" >
                        <select id="building1" name="building1" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room1" name="room1"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">
                        <textarea style="width: 835px;" id="specialReq1" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <%--Room preference 2--%>
        <div id="room_pref2" style="display: none">
            <table class="inputs box_class">
                <tr>
                    <td colspan="3" align="left" style="padding-left: 5px;">Room Preference 2</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left: 5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 2--%>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-computer2">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer2" name="computer2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-capture2">
                                        <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                    </ol>
                                    <input type="hidden" id="capture2" name="capture2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                    <td align="left" colspan="3" style="padding-left: 5px;">Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity2"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms2" value="all" id="roomsAll2" checked onclick="checkRadio2()">Pool Rooms</td>
                    <td align="left" style="padding-left: 5px;">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms2" value="priv" id="roomsPriv2" onclick="checkRadio2()">Private Rooms</td>
                    <td align="left" style="padding-left: 5px;">
                        <select id="building2" name="building2" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room2" name="room2"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">
                        <textarea style="width: 835px;" id="specialReq2" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <%--Room preference 3--%>
        <div id="room_pref3" style="display: none">

            <table class="inputs box_class">
                <tr>
                    <td colspan="3" align="left" style="padding-left: 5px;">Room Preference 3</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left: 5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 3--%>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-computer3">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer3" name="computer3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-capture3">
                                        <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                    </ol>
                                    <input type="hidden" id="capture3" name="capture3" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                                <td style="padding-left: 5px;">
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
                    <td align="left" colspan="3" style="padding-left: 5px;">Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity3"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity3" name="capacity3" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms3" value="all" id="roomsAll3" checked onclick="checkRadio3()">Pool Rooms</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms3" value="all" id="roomsPriv3" onclick="checkRadio3()">Private Rooms</td>
                    <td align="left">
                        <select id="building3" name="building3" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room3" name="room3"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">
                        <textarea style="width: 835px;" id="specialReq3" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <%--Room preference 4--%>
        <div id="room_pref4" style="display: none">

            <table class="inputs box_class">
                <tr>
                    <td colspan="3" align="left" style="padding-left: 5px;">Room Preference 4</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left: 5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <%--Facility options 4--%>
                                <td>
                                    <ol id="selectable-computer4">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer4" name="computer4" value="0" />
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
                    <td align="left" colspan="3" style="padding-left: 5px;">Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity4"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity4" name="capacity4" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms4" value="all" id="roomsAll4" checked onclick="checkRadio4()">Pool Rooms</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms4" value="all" id="roomsPriv4" onclick="checkRadio4()">Private Rooms</td>
                    <td align="left">
                        <select id="building4" name="building4" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room4" name="room4"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">
                        <textarea style="width: 835px;" id="specialReq4" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <%--Room preference 5--%>
        <div id="room_pref5" style="display: none">

            <table class="inputs box_class">
                <tr>
                    <td colspan="3" align="left" style="padding-left: 5px;">Room Preference 5</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left: 5px;">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <%--Facility options 5--%>
                                <td>
                                    <ol id="selectable-computer5">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer5" name="computer5" value="0" />
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
                    <td align="left" colspan="3" style="padding-left: 5px;">Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity5"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity5" name="capacity5" readonly="readonly" style="border: 0; color: #CA006C; font-weight: bold; text-align: center;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms5" value="all" id="roomsAll5" onclick="checkRadio5()" checked>Pool Rooms</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;"><input type="radio" name="rooms5" value="all" id="roomsPriv5" onclick="checkRadio5()">Private Rooms</td>
                    <td align="left">
                        <select id="building5" name="building5" onchange="changeRoom()">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room5" name="room5"></select>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">Additional requirement</td>
                </tr>
                <tr>
                    <td align="left" colspan="3" style="padding-left: 5px;">
                        <textarea style="width: 835px;" id="specialReq5" cols="80" maxlength="1000"></textarea>
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <%--Time--%>
        <div id="time">
            <table class="inputs box_bottom_class">
                <tr>
                    <td align="left" style="padding-left: 5px;">Day</td>
                    <td align="left">Semester</td>
                    <td align="left">Period</td>
                    <td align="left">Duration</td>
                </tr>
                <tr>
                    <%--Selectable - Day--%>
                    <td align="left" style="padding-left: 5px;">
                        <table>
                            <tr>
                                <td>
                                    <ol id="selectable-day">
                                        <li class="ui-state-default" style="width: 100px">Monday</li>
                                        <li class="ui-state-default" style="width: 100px">Tuesday</li>
                                        <li class="ui-state-default" style="width: 100px">Wednesday</li>
                                        <li class="ui-state-default" style="width: 100px">Thursday</li>
                                        <li class="ui-state-default" style="width: 100px">Friday</li>
                                    </ol>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" id="day" name="day" value="" />
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
                    <td colspan="4" align="left" style="padding-left: 200px;">Week</td>
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
                        <input type="hidden" id="week1-check" value="1" />
                        <input type="hidden" id="week2-check" value="1" />
                        <input type="hidden" id="week3-check" value="1" />
                        <input type="hidden" id="week4-check" value="1" />
                        <input type="hidden" id="week5-check" value="1" />
                        <input type="hidden" id="week6-check" value="1" />
                        <input type="hidden" id="week7-check" value="1" />
                        <input type="hidden" id="week8-check" value="1" />
                        <input type="hidden" id="week9-check" value="1" />
                        <input type="hidden" id="week10-check" value="1" />
                        <input type="hidden" id="week11-check" value="1" />
                        <input type="hidden" id="week12-check" value="1" />
                        <input type="hidden" id="week13-check" value="0" />
                        <input type="hidden" id="week14-check" value="0" />
                        <input type="hidden" id="week15-check" value="0" />
                        <input type="hidden" id="week16-check" value="0" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="button" onclick="insertRequestAjax()" value="Submit Request" /></td>
                </tr>
            </table>
        </div>

    </div>
    <div id="dialog-module" title="Add New Module">
        <form id="module_form" name="module_form" method="post">
            Module code:
            <input type="text" id="mod_dept" readonly="readonly" name="mod_dept" />
            &nbsp; 
            <select id="mod_part" name="mod_part">
                <option>A</option>
                <option>B</option>
                <option>C</option>
                <option>D</option>
                <option>F</option>
                <option>I</option>
                <option>P</option>
            </select>
            &nbsp;
            <input type="text" id="mod_num" name="mod_num" /><br />
            Module title:
            <input type="text" id="mod_title" name="mod_title" /><br />
            <input type="button" id="module_submit" value="Submit" onclick="addNewModuleAjax()" />&nbsp; 
            <input type="button" id="module_cancel" value="Cancel" onclick="$('#dialog-module').dialog('close')" />
        </form>
    </div>
    <div id="dialog-pool" title="Add New Private Room">
        <form id="pool_form" name="pool_form" method="post">
            Building: 
                <select id="building_add" onchange="fillBuildingPart()">
                </select><br />
            Room Code:
            <input type="text" readonly="readonly" id="building_part" value="A" />.
                <select id="floor_part">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                </select>.
                <input type="text" id="room_part" /><br />
            Arrangement:
                <table>
                    <tr>
                        <td>
                            <ol id="selectable-arrangementPr">
                                <li class="ui-state-default" style="width: 200px">Tiered</li>
                                <li class="ui-state-default" style="width: 200px">Flat</li>
                            </ol>
                            <input type="hidden" id="arrangementPr" name="arrangement" value="Any" />
                        </td>
                    </tr>
                </table>
            <br />
            Capacity:
                <div id="slider-capacityPr"></div>
            <input type="text" id="capacityPr" name="capacityPr" readonly="readonly" style="border: 0; color: #f6931f; font-weight: bold; text-align: center;" />
            <br />
            Facility: 
                <table>
                    <tr>
                        <td>
                            <ol id="selectable-computerPr">
                                <li class="ui-state-default" style="width: 200px">Computer</li>
                            </ol>
                            <input type="hidden" id="computerPr" name="computerPr" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-capturePr">
                                <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                            </ol>
                            <input type="hidden" id="capturePr" name="capturePr" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-paPr">
                                <li class="ui-state-default" style="width: 200px">PA System</li>
                            </ol>
                            <input type="hidden" id="paPr" name="paPr" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-projectorPr">
                                <li class="ui-state-default" style="width: 200px">Projector</li>
                            </ol>
                            <input type="hidden" id="projectorPr" name="projectorPr" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-micPr">
                                <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                            </ol>
                            <input type="hidden" id="micPr" name="micPr" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-videoPr">
                                <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                            </ol>
                            <input type="hidden" id="videoPr" name="videoPr" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-visualiserPr">
                                <li class="ui-state-default" style="width: 200px">Visualiser</li>
                            </ol>
                            <input type="hidden" id="visualiserPr" name="visualiserPr" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-whiteboardPr">
                                <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                            </ol>
                            <input type="hidden" id="whiteboardPr" name="whiteboardPr" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-wheelchairPr">
                                <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                            </ol>
                            <input type="hidden" id="wheelchairPr" name="wheelchairPr" value="0" />
                        </td>
                    </tr>
                </table>
            <br />
            <input type="button" id="add_room_submit" value="Submit" class="btns" onclick="insertRoomAjax()" />
        </form>
    </div>
</asp:Content>
