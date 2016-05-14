/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.6
import QtQuick.Templates 2.0 as T
import QtQuick.Controls.Universal 2.0

T.SwipeDelegate {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    spacing: 12

    topPadding: 11
    leftPadding: 12
    rightPadding: 12
    bottomPadding: 13

    //! [contentItem]
    contentItem: Text {
        leftPadding: !control.mirrored ? (control.indicator ? control.indicator.width : 0) + control.spacing : 0
        rightPadding: control.mirrored ? (control.indicator ? control.indicator.width : 0) + control.spacing : 0

        text: control.text
        font: control.font
        elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        renderType: Text.NativeRendering

        opacity: enabled ? 1.0 : 0.2
        color: control.Universal.foreground

        Behavior on x {
            enabled: !control.down
            NumberAnimation {
                easing.type: Easing.InOutCubic
                duration: 400
            }
        }
    }
    //! [contentItem]

    //! [background]
    background: Rectangle {
        color: control.Universal.background

        Rectangle {
            width: parent.width
            height: parent.height
            color: control.down ? control.Universal.listMediumColor : control.Universal.altMediumLowColor
            Rectangle {
                width: parent.width
                height: parent.height
                visible: control.visualFocus || control.highlighted
                color: control.Universal.accent
                opacity: control.Universal.theme === Universal.Light ? 0.4 : 0.6
            }
        }

        Behavior on x {
            enabled: !control.down
            NumberAnimation {
                easing.type: Easing.InOutCubic
                duration: 400
            }
        }
    }
    //! [background]
}
