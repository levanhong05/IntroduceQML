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
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.10

import "../theme"

import "../delegates"
import "../sections"

import "../scripts/branding.js" as Branding

Dialog {
    id: root

    focus: true
    modal: true

    width: AppTheme.hscale(900)
    height: AppTheme.vscale(600)

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    padding: AppTheme.tscale(20)

    header: Frame {
        padding: AppTheme.vscale(10)

        background: Rectangle {
            color: "#00a8ff"
            border.color: "transparent"
            radius: 0
        }

        RowLayout {
            anchors.fill: parent

            spacing: AppTheme.hscale(30)

            Image {
                Layout.alignment: Text.AlignLeft

                source: "qrc:/introduce/images/logo.png"

                Layout.preferredWidth: AppTheme.tscale(24)
                Layout.preferredHeight: AppTheme.tscale(24)
            }

            Label {
                text: Branding.VER_APPNAME_STR + " - " + qsTr("Contact books") + translator.tr
                color: "#ffffff"
                font.bold: true
                font.pointSize: AppTheme.textSize14
                Layout.fillWidth: true

                MouseArea {
                    anchors.fill: parent

                    cursorShape: Qt.SizeAllCursor

                    property variant previousPosition

                    onPressed: {
                        previousPosition = Qt.point(mouseX, mouseY)
                    }

                    onPositionChanged: {
                        if (pressedButtons == Qt.LeftButton) {
                            var dx = mouseX - previousPosition.x
                            var dy = mouseY - previousPosition.y

                            root.x = root.x + dx
                            root.y = root.y + dy
                        }
                    }
                }
            }

            Image {
                Layout.preferredWidth: AppTheme.tscale(16)
                Layout.preferredHeight: AppTheme.tscale(16)

                anchors.verticalCenter: parent.verticalCenter

                source: "qrc:/introduce/images/close.png"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        root.close()
                    }
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Layout.fillWidth: true
        Layout.fillHeight: true

        ListView {
            id: listView

            anchors.fill: parent

            spacing: AppTheme.screenPadding

            contentHeight: height
            contentWidth: width

            focus: true
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.HorizontalAndVerticalFlick

            delegate: ContactDelegate {
                id: delegate
                width: listView.width
            }

            model: contactModel

            ScrollBar.vertical: ScrollBar { }
        }
    }

    ListModel {
        id: contactModel

        ListElement {
            name: "Eric Lee"
            image: "qrc:/introduce/images/social/facebook.png"
            email: "levanhong05@gmail.com"
            tel: "(84)0123456789"
        }

        ListElement {
            name: "Bill Gate"
            image: "qrc:/introduce/images/social/twitter.png"
            email: "gate.bill@microsoft.com"
            tel: "123456789"
        }

        ListElement {
            name: "Alon Musk"
            image: "qrc:/introduce/images/social/youtube.png"
            email: "musk.alon@tessla.com"
            tel: "(19)11987456875"
        }
    }
}
