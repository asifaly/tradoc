import { Controller } from "stimulus"

const upKey = 38;
const downKey = 40;
const enterKey = 13;
const navigationKeys = [upKey, downKey, enterKey];

export default class extends Controller {
    static targets = [ "result" ];

    connect() {
        this.currentResultIndex = 0;
    }

    navigateResults(event) {
        if(!navigationKeys.includes(event.keyCode)) {
            return
        }

        event.preventDefault();

        switch(event.keyCode) {
            case downKey:
                this.selectNextResult();
                break;
            case upKey:
                this.selectPreviousResult();
                break;
            case enterKey:
                this.goToSelectedResult();
                break;
        }
    }

    // private

    selectCurrentResult() {
        this.resultTargets.forEach((element, index) => {
            console.log(element);
            element.classList.toggle("search-result-current", index == this.currentResultIndex)
        })
    }

    selectNextResult() {
        if(this.currentResultIndex < this.resultTargets.length - 1) {
            this.currentResultIndex++
            this.selectCurrentResult()
        }
    }

    selectPreviousResult() {
        if(this.currentResultIndex > 0) {
            this.currentResultIndex--
            this.selectCurrentResult()
        }
    }

    // goToSelectedResult() {
    //     // $("#query").val(this.resultTargets[this.currentResultIndex].data("lc"))
    //     this.resultTargets[this.currentResultIndex].firstElementChild.click()
    // }
}