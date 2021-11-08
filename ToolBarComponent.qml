import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1


ToolBar{
    id:toolbarID
    height:root.height/20

    //Toolbar current Time
    Timer{
        interval:60000
        repeat:true
        running:true
        onTriggered:{
            textHours.text=Qt.formatTime(new Date(), "hh")
            textMinutes.text=Qt.formatTime(new Date(), "mm")
        }
    }

    Rectangle{
        anchors.fill:parent
        color:"black"

            RowLayout{
                anchors.fill:parent
                width:root.width

                //"Task 5" text
                Text{
                    text:"Task 5"
                    color:"white"
                    font.pixelSize: parent.height*0.7

                    Layout.alignment:parent.left
                    leftPadding:10
                }
                   //search button
                ToolButton{
                    anchors.right:backButton.left
                    anchors.verticalCenter: parent.verticalCenter

                    anchors.rightMargin:width/2
                    rightPadding:10

                    background.visible:false
                    width:toolbarID.height
                    height:toolbarID.height

                    Image{
                        anchors.fill:parent
                        source:'qrc:search-icon.png'
                        fillMode: Image.PreserveAspectFit
                    }

                    onClicked:{
                        loadEmptyScreen.source="emptyScreen.qml"
                    }
                    Loader{
                        id:loadEmptyScreen
                    }
                }

                //back Button
                ToolButton{
                    id:backButton
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:separator.left
                    anchors.rightMargin:width/2

                    background.visible:false
                    width:toolbarID.height
                    height:toolbarID.height

                    Image{
                        anchors.fill:parent
                        source:'qrc:back-icon.png'
                        fillMode:Image.PreserveAspectFit
                    }
                    onClicked:Qt.quit()

            }

                //separator
                ToolSeparator{
                    id:separator
                    height:toolbarID.height

                    anchors.right:textHours.left
                    anchors.verticalCenter: parent.verticalCenter

                }

                //hours
                Text{
                    id:textHours
                    text:Qt.formatTime(new Date(), "hh")

                    anchors.right:textMinutes.left
                    anchors.verticalCenter: parent.verticalCenter

                    rightPadding:5
                    color:"white"
                    font.pixelSize: 36
                }

                //Minutes
                Text{
                    id:textMinutes
                    text:Qt.formatTime(new Date(), "mm")
                    height:parent.height/2

                    color:"white"
                    font.pixelSize: 24

                    anchors.right:parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    anchors.verticalCenterOffset: -5
                    anchors.rightMargin:20
                }

                //line under minutes
                Rectangle{
                    width:textMinutes.width
                    height:1
                    color:"white"

                    anchors.right:textMinutes.right
                    anchors.verticalCenterOffset: textMinutes.height-10
                    anchors.verticalCenter: textMinutes.verticalCenter
                }
    }


  }

}//toolbar
