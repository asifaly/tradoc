import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["disable"];

    connect() {
        $(".form-control").prop('disabled', true);
        $("trix-editor").addClass("trixdisable");
        $("trix-toolbar").addClass("trixdisable");
    }
}