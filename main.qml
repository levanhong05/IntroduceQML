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
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.10
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import "scripts/setting.js" as Settings
import "scripts/branding.js" as Branding

import "dialogs"
import "theme"
import "sections"

ApplicationWindow {
    id: _mainWindow

    title: Branding.VER_PRODUCTNAME_STR

    Material.accent: "#039be6"

    width: AppTheme.screenWidthSize
    height: AppTheme.screenHeightSize

    minimumWidth: AppTheme.screenWidthSize
    minimumHeight: AppTheme.screenHeightSize

    visible: true

    background: Rectangle {
        anchors.fill: parent

        border.color: "transparent"

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#ffffff"
            }

            GradientStop {
                position: 0.4
                color: "#ffffff"
            }

            GradientStop {
                position: 0.401
                color: "#039be6"
            }

            GradientStop {
                position: 1.0
                color: "#039be6"
            }
        }
    }

    AboutDialog {
        id: aboutDialog
    }

    LanguageDialog {
        id: languageDialog
    }

    header: HeaderSection {
        id: headerBar

        title: Branding.VER_APPNAME_STR
    }

    Frame {

        anchors.fill: parent

        leftPadding: AppTheme.tscale(100)
        rightPadding: AppTheme.tscale(100)

        ColumnLayout {
            Layout.fillWidth: true
            anchors.fill: parent

            ColumnLayout {
                Layout.fillWidth: true

                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    id: lblTitleTool

                    text: qsTr("Information") + translator.tr
                    color: "#09a6f9"

                    font.weight: Font.Bold
                    font.bold: true
                    font.pointSize: AppTheme.textSize23

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    Layout.fillWidth: true
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: AppTheme.lineHeight
                    color: "#09a6f9"
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: AppTheme.vscale(20)

                RowLayout {
                    Layout.fillWidth: true

                    spacing: AppTheme.screenPadding

                    Image {
                        source: "qrc:/introduce/images/settings/translate.png"

                        Layout.preferredWidth: AppTheme.tscale(32)
                        Layout.preferredHeight: AppTheme.tscale(32)
                    }

                    Label {
                        id: lblLanguage

                        text: qsTr("Language") + translator.tr

                        font.pointSize: AppTheme.textSize18
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: 0
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                var strCurrentLanguage = Settings.language

                                if (strCurrentLanguage === "vi_VN") {
                                    languageDialog.currentLanguage = 1
                                } else {
                                    languageDialog.currentLanguage = 0
                                }

                                languageDialog.open()
                            }
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    spacing: AppTheme.screenPadding

                    Label {
                        id: lblVersion

                        text: qsTr("Version: %1").arg(Branding.APP_VERSION_SHORT) + translator.tr
                        font.pointSize: AppTheme.textSize18
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        enabled: false
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    spacing: AppTheme.screenPadding

                    Image {
                        source: "qrc:/introduce/images/settings/about.png"

                        Layout.preferredWidth: AppTheme.tscale(32)
                        Layout.preferredHeight: AppTheme.tscale(32)
                    }

                    Label {
                        id: lblAbout

                        text: qsTr("About") + translator.tr
                        font.pointSize: AppTheme.textSize18
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignVCenter

                        MouseArea {
                            id: mouseAreaAbout
                            anchors.fill: parent
                            anchors.margins: 0
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                aboutDialog.open()
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
