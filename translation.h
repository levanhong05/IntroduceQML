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

#ifndef TRANSLATION_H
#define TRANSLATION_H

#include <QObject>
#include <QTranslator>

class Translation : public QObject
{
    Q_OBJECT

     Q_PROPERTY(QString tr READ getEmptyString NOTIFY languageChanged)

public:
    explicit Translation(QObject *parent = 0);

    QString getEmptyString();

    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();
    void requestTranslate(QString language);

private:
    QTranslator *_viTranslator;

};

#endif // TRANSLATION_H
