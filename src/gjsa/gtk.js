class GTK {
    constructor() {
        this.engine = imports.gi.Gtk;
        this.inited = false;
    }

    init() {
        if (!this.inited) this.engine.init(null);
    }

    run() {
        this.init();
        this.engine.main();
    }
}

export default new GTK();