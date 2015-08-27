import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Window {
    width: 400
    height: 600
    visible: true


    Text {
        text: qsTr("Каталог книг")
    }
    ListView {
        id: list1
        width: parent.width
        height: 200

        JSONListModel {
            id: jsonModel1
            source: "jsonData.txt"

            query: "$.store.book[*]"
        }
        model: jsonModel1.model

        section.delegate: sectionDelegate
        section.property: "title"
        section.criteria: ViewSection.FirstCharacter

        delegate: Component {
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 14
                color: "black"
                text: model.title

                Text {
                    anchors.fill: parent
                    anchors.rightMargin: 5
                    horizontalAlignment: Text.AlignRight
                    font.pixelSize: 12
                    color: "gray"
                    text: model.author
                }
            }
        }
    }

    Component {
        id: sectionDelegate
        Rectangle {
            color: "gray"
            width: parent.width
            height: sectionLabel.height
            Text {
                id: sectionLabel
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pixelSize: 16
                color: "white"
                style: Text.Raised
                text: section
            }
        }
    }
}

