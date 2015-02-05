import QtQuick 2.0
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.1

MainView {
    objectName: "mainView"
    applicationName: "com.ubuntu.developer.robert-ancell.dice-roller"
    useDeprecatedToolbar: false

    width: units.gu (40)
    height: units.gu (71)

    Page {
        id: main_page
        property var total: "Total: " + 0
        Item {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: total_label.top
            anchors.margins: units.gu (2)
            Flow {
                id: die_grid
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: units.gu (1)
                flow: Flow.TopToBottom
            }
        }
        Label {
            id: total_label
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: buttons_layout.top
            anchors.bottomMargin: units.gu (2)
            text: parent.total
        }
        RowLayout {
            id: buttons_layout
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: roll_button.top
            anchors.bottomMargin: units.gu (2)
            Button {
                text: "-"
                onClicked: main_page.remove_die ()
            }
            Button {
                text: "+"
                onClicked: main_page.add_die ()
            }
        }
        Button {
            id: roll_button
            text: "Roll"
            anchors.left: parent.left
            anchors.leftMargin: units.gu (2)
            anchors.right: parent.right
            anchors.rightMargin: units.gu (2)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: units.gu (2)
            onClicked: main_page.roll ()
        }
        Component.onCompleted: {
            add_die ()
            add_die ()
        }
        property var dice: []
        function add_die ()
        {
            var die_component = Qt.createComponent ("Die.qml")
            var die = die_component.createObject (die_grid)
            dice[dice.length] = die
        }
        function remove_die ()
        {
        }
        function roll ()
        {
            for (var i = 0; i < dice.length; i++)
                dice[i].roll ()
        }
    }
}
