const Extension = imports.misc.extensionUtils.getCurrentExtension();
const ImportedCode = Extension.imports.code;

var console = { log: log };

function enable() {
    ImportedCode.enable();
}

function disable() {
    ImportedCode.disable();
}