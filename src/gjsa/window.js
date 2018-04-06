import gtk from "./gtk";

class Window {
    constructor() {
        gtk.init();
        this.gobject = new imports.gi.Gtk.Window();
        this.gobject.show_all();
    }
}

export default Window;