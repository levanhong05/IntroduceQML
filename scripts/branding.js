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

.pragma library

var VERSIONMAJOR = 1
var VERSIONMINOR = 0
var VERSIONREVIS = 0
var BUILD_NUMBER = 1

var VERSIONSHORT = VERSIONMAJOR + "." + VERSIONMINOR
var VERSIONFULL = VERSIONMAJOR + "." + VERSIONMINOR + "." + VERSIONREVIS
var VERSIONFULL2 = VERSIONMAJOR + "." + VERSIONMINOR + "." + VERSIONREVIS + "." + BUILD_NUMBER

var RELEASENUMBER = 1

var VER_APPNAME_STR = "Introduce QML"

var VER_PRODUCTNAME_STR = VER_APPNAME_STR

var TEXTVERSIONSHORT = "QML " + VERSIONSHORT

var TEXTVERSIONMAJORSHORT = "QML " + VERSIONMAJOR

var TEXTVERSIONLONG = VER_APPNAME_STR + " " + VERSIONFULL

var TEXTVERSIONFULL = VER_APPNAME_STR + " " + VERSIONFULL

var APP_VERSION_SHORT = VERSIONMAJOR + "." + VERSIONMINOR + "." + VERSIONREVIS

var VER_PUBLISHER_STR = "Eric Lee"

var VER_PUBLISHEDYEAR_STR = "2019"

var VER_LEGALCOPYRIGHT_STR = "© " + VER_PUBLISHEDYEAR_STR + " " + VER_PUBLISHER_STR

var VER_MANUFACTURER_STR = "Eric Lee"

var VER_COMPANYDOMAIN_STR = "https://github.com/levanhong05"

var VER_PRODUCTDOMAIN_STR = "https://github.com/levanhong05"
