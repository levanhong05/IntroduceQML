/****************************************************************************
**
** Copyright (C) 2019 Eric Lee.
** Contact: levanhong05@gmail.com
** Company: Robert Bosch Vietnam
**
** This file is part of the Introduce QML project.
**
**All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import "../theme"

import "../scripts/branding.js" as Branding

Frame {
    property bool topSpacing: true

    property string title: Branding.VER_APPNAME_STR

    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0

    topPadding: topSpacing ? AppTheme.headerTopPadding : 0

    Layout.fillWidth: true

    background: Rectangle {
        color: "transparent"
        border.color: "transparent"
        radius: 0
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true

            spacing: AppTheme.hscale(30)

            Item {
                Layout.preferredWidth: AppTheme.hscale(50)
            }

            Image {
                id: btnDrawer

                visible: true

                Layout.preferredWidth: AppTheme.tscale(48)
                Layout.preferredHeight: AppTheme.tscale(48)

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/introduce/images/menu_indicator.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        //TODO
                    }
                }
            }

            Rectangle{
                id: notifyIndicator

                Layout.preferredWidth: AppTheme.tscale(10)
                Layout.preferredHeight: AppTheme.tscale(10)

                radius: AppTheme.tscale(10)
                color: "#ff0000"

                visible: true

                anchors.top: btnDrawer.top
                anchors.right: btnDrawer.right

                anchors.topMargin: AppTheme.vscale(7)
                anchors.rightMargin: AppTheme.hscale(2)
            }

            Button {
                id: btnBack

                text: qsTr("Back") + translator.tr

                font.capitalization: Font.AllUppercase
                font.pointSize: AppTheme.textSize20

                contentItem: Text {
                    text: btnBack.text
                    font: btnBack.font

                    color: "#000000"

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                background: Rectangle {
                    implicitWidth: AppTheme.hscale(150)
                    implicitHeight: AppTheme.vscale(50)

                    color: btnBack.pressed ? "#09a6f9" : "#f8f9fc"
                    border.color: btnBack.pressed ? "#09a6f9" : "#f0f3f8"
                    radius: AppTheme.tscale(10)
                    opacity: 0.8
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Image {
                source: "qrc:/introduce/images/cover_image.png"

                fillMode: Image.PreserveAspectFit

                Layout.preferredHeight: AppTheme.vscale(70)
                Layout.preferredWidth: AppTheme.hscale(160)
            }

            Label {
                id: lblTitle
                text: title
                color: "#039be6"

                font {
                    capitalization: Font.AllUppercase
                    weight: Font.Bold
                    bold: true
                    pointSize: AppTheme.textSize23
                }

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                padding: AppTheme.propertyPadding
            }

            Item {
                Layout.preferredWidth: AppTheme.hscale(50)
            }
        }

        Rectangle {
            color: "#b0b0b0"

            Layout.fillWidth: true
            Layout.preferredHeight: AppTheme.vscale(1)
        }
    }
}
