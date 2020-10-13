configuration {
    show-icons: true;
    icon-theme: "Qogir-dark";
}

@import "colors"

window {
    transparency: "real";
    background-color: @background;
    width: 75%;
    padding: 4px;
    children: [ listview ];
    border-color: @accent;
    border-radius: 25px;
    border: 3px;
}

mainbox {
    border:  10;
}

inputbar {
    enabled: false;
}

message {
    enabled: false;
}

textbox {
    enabled: false;
}

listview {
    columns: 5;
    fixed-height: true;
    lines: 1;
}

element {
    width: 15em;
}

element-text {
    enabled: false;
}

element-icon {
    padding: 10px;
    size: 15em;
}

element-icon selected{
    background-color: @accent;
}

