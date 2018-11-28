var args = require('system').args;
var address = args[1];
var image = args[2];

var page = require('webpage').create();
page.settings.userAgent = 'Movrm3n7/1.0 (Windows NT 6.1; WOW69)';
page.settings.javascriptEnabled = false;
page.resourceTimeout=1;
page.viewportSize = {width: 1024, height: 768};
page.clipRect = { top: 0, left: 0, width: 1024, height: 768 };

page.open(address , function () {
    page.render(image);
    phantom.exit();
});