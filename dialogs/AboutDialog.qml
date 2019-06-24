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

import "../scripts/branding.js" as Branding

Dialog {
    id: root

    focus: true
    modal: true

    width: AppTheme.hscale(780)
    height: AppTheme.vscale(630)

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
                text: Branding.VER_APPNAME_STR + " - " + qsTr("About") + translator.tr
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
        Layout.fillWidth: true
        Layout.fillHeight: true

        anchors.fill: parent

        spacing: AppTheme.tscale(10)

        Image {
            id: imgProductIcon

            anchors.horizontalCenter: parent.horizontalCenter

            source: "qrc:/introduce/images/cover_image.png"

            Layout.preferredWidth: AppTheme.tscale(499)
            Layout.preferredHeight: AppTheme.tscale(189)

            fillMode: Image.PreserveAspectFit
        }

        RowLayout {
            id: groupSocial

            anchors.horizontalCenter: parent.horizontalCenter

            spacing: AppTheme.hscale(10)

            Item {
                Layout.fillWidth: true
            }

            Image {
                source: "qrc:/introduce/images/social/share.png"

                Layout.preferredWidth: AppTheme.tscale(32)
                Layout.preferredHeight: AppTheme.tscale(32)
            }

            Image {
                source: "qrc:/introduce/images/social/twitter.png"

                Layout.preferredWidth: AppTheme.tscale(32)
                Layout.preferredHeight: AppTheme.tscale(32)

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("https://twitter.com/levanhong05")
                    }
                }
            }

            Image {
                source: "qrc:/introduce/images/social/linkedin.png"

                Layout.preferredWidth: AppTheme.tscale(32)
                Layout.preferredHeight: AppTheme.tscale(32)

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("https://www.linkedin.com/in/levanhong05/")
                    }
                }
            }

            Image {
                source: "qrc:/introduce/images/social/facebook.png"

                Layout.preferredWidth: AppTheme.tscale(32)
                Layout.preferredHeight: AppTheme.tscale(32)

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("https://www.facebook.com/levanhong05/")
                    }
                }
            }

            Image {
                source: "qrc:/introduce/images/social/youtube.png"

                Layout.preferredWidth: AppTheme.tscale(32)
                Layout.preferredHeight: AppTheme.tscale(32)

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("https://www.youtube.com/channel/UCGryVRUhZseM-BAEU_jFMiQQ")
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }

        Label {
            id: lblVersion

            horizontalAlignment: Text.AlignHCenter

            text: qsTr("Version ") + translator.tr + Branding.VERSIONFULL
            font.pointSize: AppTheme.textSize14
            font.weight: Font.Normal

            Layout.fillWidth: true
        }

        Item {
            Layout.preferredHeight: AppTheme.vscale(5)
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Product of ") + translator.tr
                font.pointSize: AppTheme.textSize13
            }

            Label {
                id: lblOwner
                text: Branding.VER_PUBLISHER_STR
                font.pointSize: AppTheme.textSize14
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally(Branding.VER_COMPANYDOMAIN_STR)
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Developed by ") + translator.tr
                font.pointSize: AppTheme.textSize13
            }

            Label {
                id: lblManufacturer

                text: Branding.VER_MANUFACTURER_STR
                font.pointSize: AppTheme.textSize14
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally(Branding.VER_COMPANYDOMAIN_STR)
                    }
                }
            }
        }

        Label {
            id: lblAddress

            horizontalAlignment: Text.AlignHCenter

            text: qsTr("E-Town Complex, 364 Cong Hoa, Tan Binh District, Ho Chi Minh City, Vietnam") + translator.tr
            wrapMode: Text.WordWrap
            font.pointSize: AppTheme.textSize13
            Layout.fillWidth: true
        }

        Item {
            Layout.preferredHeight: AppTheme.vscale(5)
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Hotline: ") + translator.tr
                font.pointSize: AppTheme.textSize13
            }

            Label {
                id: lblTelephone
                text: "+84 123 456 789"
                font.pointSize: AppTheme.textSize13
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("tel:(+84)123456789")
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Email: ") + translator.tr
                font.pointSize: AppTheme.textSize13
            }

            Label {
                id: lblEmail
                text: "xxxxxxxxx@gmail.com"
                font.pointSize: AppTheme.textSize13
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("mailto:xxxxxxxxx@gmail.com")
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: qsTr("Website: ") + translator.tr
                font.pointSize: AppTheme.textSize13
            }

            Label {
                id: lblWebsite

                text: Branding.VER_PRODUCTDOMAIN_STR
                font.pointSize: AppTheme.textSize13
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally(Branding.VER_PRODUCTDOMAIN_STR)
                    }
                }
            }
        }

        Item {
            Layout.preferredHeight: AppTheme.vscale(5)
        }

        RowLayout {
            Layout.fillWidth: true

            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: lblReleaseNotes
                text: qsTr("Release notes") + translator.tr

                font.pointSize: AppTheme.textSize13
                font.underline: true
                color: "#04aade"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        //versionInfo.open()
                    }
                }
            }
        }
    }
}
