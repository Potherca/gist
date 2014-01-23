/*global QUnit*/
(function($, QUnit, window){
    QUnit.testSkip = function() {
        QUnit.test(arguments[0] + ' (SKIPPED)', 0, function() {
            var li = document.getElementById(QUnit.config.current.id);
            QUnit.done(function() {
                li.style.background = '#FFFF99';
            });
        });
    };

    window.testSkip = QUnit.testSkip;

}(jQuery, QUnit, window));

/* EOF */