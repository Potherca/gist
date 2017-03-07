/*global QUnit, window, document*/
(function (QUnit, window, document) {
    'use strict';

    QUnit.testSkip = function (p_sTestName) {
        QUnit.test(p_sTestName + ' (SKIPPED)', 0, function () {
            var li = document.getElementById(QUnit.config.current.id);
            QUnit.done(function () {
                li.style.background = '#FFFF99';
            });
        });
    };

    window.testSkip = QUnit.testSkip;

}(QUnit, window, document));

/* EOF */