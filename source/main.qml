import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    id: window
    minimumWidth: 375
    minimumHeight: 667
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: true
    title: qsTr("Calculator")
    color: "black"

    // indica se a label ja tem o ponto
    property bool hasDot: false
    // indica a operacao a executar (+, -, *, /)
    property string operation: ""
    // indica se vai inserir um novo operando
    // depois de pressionar (+, -, *, /)
    property bool newOperand: false
    // guarda o valor do primeiro operando depois
    // de pressionar (+, -, *, /)
    property string firstOperand: ""

    function add(x, y) { // x e y sao strings
        // converter para number
        var op1 = parseInt(x)
        var op2 = parseInt(y)
        return op1 + op2
    }

    function calculate(text) {
        if (text === "AC") { // botão "AC" pressionado
            labelResult.text = "0" // coloca o texto da label a "0"
            hasDot = false   // apagar o estado do ponto
            newOperand = false
            firstOperand = ""
        } else if (text === "+/-") { // botão "+/-" pressioando
            labelResult.text *= -1
        } else if (text === "%") { // botão "%" pressioando
            labelResult.text /= 100
        } else if (text === ".") { // botão "." pressioando
            // se ja tem o ponto, nao insere outro
            if (hasDot === false) {
                labelResult.text += text
                hasDot = true
            }
        } else if (text === "+") { // botão "+" pressioando
            operation = "+"
            newOperand = true
            firstOperand = labelResult.text
        }else if (text === "=") { // botão "=" pressioando
            if (firstOperand !== "" && operation !== "")
            {
                if (operation == "+") {
                    labelResult.text = add(firstOperand, labelResult.text)
                }
            }
        } else {
            // se for um novo operando, apaga o texto que ja existe
            if (newOperand) {
                labelResult.text = text
                newOperand = false
            } else {
                // se tiver o so o zero => nao acrescenta
                if (labelResult.text[0] === "0" && labelResult.text.length === 1)
                    labelResult.text = text
                else
                    labelResult.text += text
            }
        }
    }

    Label {
        id: labelResult
        x: 10
        y: 140
        width: 355
        height: 60
        text: "0"
        color: "black"
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignRight
        font.pointSize: 38
        background: Rectangle {
            color: "white"
        }
    }

    ListModel {
            id: model1                           // identificador único do modelo
            ListElement {                        // propriedades do botão "AC"
                labelText: "AC"
                buttonColor: "#a5a5a5"
                textColor: "#000000"
                span: 1
            }
            ListElement {                        // propriedades do botão "+/-"
                labelText: "+/-"
                buttonColor: "#a5a5a5"
                textColor: "#000000"
                span: 1
            }
            ListElement {                        // propriedades do botão "%"
                labelText: "%"
                buttonColor: "#a5a5a5"
                textColor: "#000000"
                span: 1
            }
            ListElement {                        // propriedades do botão "/"
                labelText: "/"
                buttonColor: "#fe9601"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "7"
                labelText: "7"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "8"
                labelText: "8"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "9"
                labelText: "9"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "x"
                labelText: "x"
                buttonColor: "#fe9601"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "4"
                labelText: "4"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "5"
                labelText: "5"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "6"
                labelText: "6"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "-"
                labelText: "-"
                buttonColor: "#fe9601"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "1"
                labelText: "1"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "2"
                labelText: "2"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "3"
                labelText: "3"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "+"
                labelText: "+"
                buttonColor: "#fe9601"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "0"
                labelText: "0"
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 2
            }
            ListElement {                        // propriedades do botão "."
                labelText: "."
                buttonColor: "#333333"
                textColor: "#ffffff"
                span: 1
            }
            ListElement {                        // propriedades do botão "="
                labelText: "="
                buttonColor: "#fe9601"
                textColor: "#ffffff"
                span: 1
            }
        }

    GridLayout {
        id: gridLayout
        anchors.margins: 10
        anchors.top: labelResult.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        columnSpacing: 10
        rowSpacing: 10
        columns: 4
        rows: 5

        Repeater {
            model: model1
            ButtonCircle {
                buttonColor: model.buttonColor
                textColor: model.textColor
                labelText: model.labelText
                Layout.columnSpan: model.span
                span: model.span
                onButtonPressed: {
                    calculate(text)
                }
            }
        }
    }
}
