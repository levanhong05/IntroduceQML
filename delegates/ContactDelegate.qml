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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import "../theme"

ItemDelegate {
    id: delegate

    checkable: true
    checked: true

    contentItem: ColumnLayout {
        RowLayout {
            Layout.fillWidth: true

            Label {
                text: name
                font.pointSize: AppTheme.textSize16
                font.bold: true
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Label {
                text: national
                font.pointSize: AppTheme.textSize15
                color: "#9d9fab"
                elide: Text.ElideRight
            }
        }

        GridLayout {
            id: grid
            visible: false

            rowSpacing: AppTheme.buttonBorderPadding
            columnSpacing: AppTheme.buttonBorderPadding

            Image {
                source: image

                Layout.preferredHeight: AppTheme.tscale(32)
                Layout.preferredWidth: AppTheme.tscale(32)
                fillMode: Image.PreserveAspectFit

                Layout.row: 0
                Layout.column: 0
            }

            Text {
                text: qsTr("Email: ") + translator.tr
                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignRight

                Layout.row: 0
                Layout.column: 1
            }

            Text {
                text: "<a href=\"mailto:" + email + "\">" + email + "</a>"
                font.pointSize: AppTheme.textSize14
                elide: Text.ElideRight

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("mailto:" + email)
                    }
                }

                Layout.row: 0
                Layout.column: 2
            }

            Item {
                Layout.fillWidth: true

                Layout.row: 0
                Layout.column: 3
            }
            Image {
                source: "qrc:/introduce/images/social/share.png"
                Layout.preferredHeight: AppTheme.tscale(32)
                Layout.preferredWidth: AppTheme.tscale(32)
                fillMode: Image.PreserveAspectFit

                Layout.row: 0
                Layout.column: 4
            }

            Text {
                text: qsTr("Tel: ") + translator.tr
                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignRight

                Layout.row: 1
                Layout.column: 1
            }

            Text {
                text: "<a href=\"tel:" + tel + "\">" + tel + "</a>"
                font.pointSize: AppTheme.textSize14
                elide: Text.ElideRight

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("tel:" + tel)
                    }
                }

                Layout.row: 1
                Layout.column: 2
            }

            Item {
                Layout.fillWidth: true

                Layout.row: 1
                Layout.column: 3
            }

            Image {
                source: "qrc:/introduce/images/social/share.png"
                Layout.preferredHeight: AppTheme.tscale(32)
                Layout.preferredWidth: AppTheme.tscale(32)
                fillMode: Image.PreserveAspectFit

                Layout.row: 1
                Layout.column: 4
            }
        }
    }

    states: [
        State {
            name: "expanded"
            when: delegate.checked

            PropertyChanges {
                target: grid
                visible: true
            }
        }
    ]
}
