import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["disable"];

    connect() {
        const fields = document.querySelectorAll(".form-control")
        for (let i = 0; i < fields.length; ++i) {
            fields[i].disabled = true;
        }
    }
}