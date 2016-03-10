var xLinePath = Array.apply(null, Array(26)).map(function (_, i) {return [i, 1];});

var waysConst = {
    "1": [
        [0, 5], [1, 5], [2, 5], [3, 5], [3, 4],
        [4, 4], [5, 4], [5, 5], [5, 6], [5, 7],
        [6, 7], [7, 7], [7, 6], [7, 5], [8, 5], [9, 5], [10, 5]
    ].concat(xLinePath.filter(function(i){return i[0] > 10}).map(function(i){return [i[0], i[1]+4]})),
    "2": xLinePath
};

var getId = function () {
    var s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return Array.apply(null, Array(8)).map(function () {
        return s.charAt(Math.floor(Math.random() * s.length));
    }).join('');
};