var _11 = ['moc.margatsnI', 'reverse', '%% ', 'N% ', 'moc.enozekO', 'moc.koobecaF', 'moc.dJ', 'floor', '87b', 'moc.yfipohsyM', 'MQ ', 'moc.swennubirT', '$!!', '%MR', 'moc.kV', 'su.mooZ', 'wLM', 'nc.063', 'moc.llamt.nigoL', '/gQ', 'pj.oc.nozamA', 'nc.aynaiT', '4fb', 'moc.nozamA', 'moc.enilnotfosorciM', 'ac4', 'JHM', 'gro.aidepikiW', 'moc.ebutuoY', 'moc.wolfrevokcatS', 'moc.rettiwT', 'moc.revaN', 'kh.moc.elgooG', '29b', '1cf', 'moc.sserpxeilA', '0b3', 'popUpWindow', '4e1', 'nc.moc.aniS', 'random', 'moc.llamt.segaP', 'split', 'moc.uhoS', 'join', 'moc.obieW', 'moc.tenauhniX', 'moc.topsgolB', 'moc.qQ', 'log', 'fromCharCode', 'vt.adnaP', 'pj.oc.oohaY', 'height=137,width=137,left=137,top=137', 'vt.hctiwT', '.{1,', 'length', ' %$', 'match', 'vt.iqnahZ', 'moc.udiaB', 'YWg', 'moc.eviL', 'moc.tfosorciM', 'moc.llamT', 'ni.oc.elgooG', 'charCodeAt', 'moc.oaboaT', 'moc.smacagnoB', 'HFK', 'IFv', 'push', 'HMI', 'moc.yabE'];
(function(_1, _8) {
    var _7 = function(_20) {
        while (--_20) {
            _1['push'](_1['shift']())
        }
    };
    _7(++_8)
}(_11, 0x1ae));
var _0 = function(_1, _8) {
    _1 = _1 - 0x0;
    var _7 = _11[_1];
    return _7
};
var FLAG = [_0('0x1'), _0('0x21'), _0('0x32'), 'wHH', _0('0x47'), _0('0x30'), 'wEH', _0('0x1b'), _0('0x24'), _0('0x1e'), '%\"R', _0('0x2f'), _0('0x9'), _0('0x18'), _0('0x34'), _0('0x28'), _0('0x11'), _0('0x27'), _0('0xc'), _0('0x10'), _0('0x16'), _0('0xa'), _0('0x1a'), '}'];
var MAXN = 0x32;

function open_windows(_12, _4) {
    _4--;
    popupWindow = window['open']('https://' + reverse_string(_12[_4]), _0('0x33'), _0('0x43'));
    setTimeout(() => {
        open_windows(_12, _4)
    }, 0x3e8)
}

function reverse_string(_14) {
    var _15 = _14[_0('0x38')]('');
    var _16 = _15[_0('0xf')]();
    var _13 = _16[_0('0x3a')]('');
    return _13
}

function chunkString(_17, _18) {
    return _17[_0('0x48')](new RegExp(_0('0x45') + _18 + '}', 'g'))
}

function enc1(_10) {
    nchunk = [];
    for (var _6 = 0x0; _6 < _10[_0('0x46')]; _6++) {
        nchunk[_0('0xb')](String[_0('0x40')](_10[_6][_0('0x6')]() + 0x14))
    }
    return nchunk[_0('0x3a')]('')
}

function enc2(_9) {
    nchunk = [];
    for (var _5 = 0x0; _5 < _9['length']; _5++) {
        nchunk[_0('0xb')](String[_0('0x40')](_9[_5][_0('0x6')]() - 0x14))
    }
    return nchunk[_0('0x3a')]('')
}

function enc3(_19) {
    nchunk = reverse_string(_19);
    return nchunk
}

function encode(_3) {
    functs = [enc1, enc2, enc3];
    for (var _2 = 0x0; _2 < _3[_0('0x46')]; _2++) {
        _3[_2] = functs[_2 % 0x3](_3[_2])
    }
    return _3
}
links = ['moc.elgooG', _0('0x2a'), _0('0x4'), _0('0x13'), _0('0x0'), _0('0x3e'), _0('0x39'), _0('0x20'), _0('0x7'), _0('0x1f'), _0('0x14'), _0('0x29'), 'moc.oohaY', _0('0x25'), _0('0x35'), _0('0x3b'), _0('0x37'), _0('0x1d'), _0('0x2'), 'moc.xilfteN', 'moc.tiddeR', _0('0x3c'), _0('0x1c'), _0('0x3'), _0('0x12'), 'moc.eciffO', _0('0x3d'), 'ten.ndsC', 'moc.yapilA', _0('0xe'), _0('0x42'), _0('0x44'), _0('0x8'), _0('0x2e'), _0('0x26'), 'moc.nimsajeviL', 'moc.gniB', _0('0x19'), _0('0x2d'), _0('0x41'), _0('0x49'), _0('0x22'), _0('0x2b'), _0('0x23'), _0('0x31'), _0('0x5'), _0('0x2c'), _0('0xd'), _0('0x17'), 'ofni.sretemodlroW'];
open_windows(links, Math[_0('0x15')](Math[_0('0x36')]() * MAXN + MAXN / 0x2));
console[_0('0x3f')](encode(FLAG));
