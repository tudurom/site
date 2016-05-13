var Textual = Textual || {};

Textual.Button = function (table, str, x, y, width, height) {
    this._table = table;
    this._x = x;
    this._y = y;
    this._w = width;
    this._h = height;

    table.putStr("." + "-".repeat(width - 2) + ".", x, y);
    for (var i = 1; i < height - 1; i++) {
        table.putStr("|" + " ".repeat(width - 2) + "|", x, y + i);
    }
    table.putStr("'" + "-".repeat(width - 2) + "'", x, y + height - 1);

    var textX = ((width - str.length) / 2) | 0;
    var textY = ((height - 1) / 2) | 0;
    table.putStr(str, x + textX, y + textY);
};

Textual.Button.prototype.attachHandler = function(handler) {
    var cells = this._table.getInternalRepr().cells;
    for (var i = 0; i < this._w; i++) {
        for (var j = 0; j < this._h; j++) {
            var el = cells[this._y + j][this._x + i];
            el.addEventListener("click", handler);
        }
    }
};

Textual.Button.prototype.getCells = function() {
    var self = this;

    var cells = [];
    for (var i = 0; i < this._w; i++) {
        cells[i] = [];
        for (var j = 0; j < this._h; j++) {
            cells[i][j] = self._table.getInternalRepr().cells[this._y + j][this._x + i];
        }
    }
};
