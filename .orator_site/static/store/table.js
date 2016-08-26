var Textual = Textual || {};
Textual.Table = function (targetElement, width, height) {
    this._targetElement = targetElement;
    this._width = width;
    this._height = height;

    // Create table and insert it into the target element
    this._table = {};
    this._table.element = document.createElement('table');
    targetElement.appendChild(this._table.element);

    // Create table body and insert it into table
    this._table.tbody = document.createElement('tbody');
    this._table.element.appendChild(this._table.tbody);

    // Create rows
    this._table.cells = [];
    var self = this;
    for (var j = 0; j < height; j++) {
        self._table.cells[j] = [];
        var tr = this._table.element.insertRow();
        for (var i = 0; i < width; i++) {
            var td = tr.insertCell();
            self._table.cells[j][i] = td;
            td.dataset.x = j;
            td.dataset.y = i;
            // Fill cell so it is always shown
            td.innerHTML = "&nbsp;";
        }
    }
};

Textual.Table.prototype.getInternalRepr = function () {
    return this._table;
};

Textual.Table.prototype.putChar = function(ch, x, y) {
    // Make sure the cell is always shown
    if (ch == " ")
        ch = "&nbsp;"
    this._table.cells[y][x].innerHTML = ch;
};

Textual.Table.prototype.putStr = function(str, x, y) {
    var arr = str.split("")
    if (arr.indexOf("\n") != -1) {
        throw "\\n not supported";
    }

    var self = this;
    for (var i = 0; i < arr.length; i++) {
        self.putChar(arr[i], x, y);
        x++;
    }
};
