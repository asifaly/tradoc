import {Controller} from "stimulus"
import $ from 'jquery';

require("selectize/dist/css/selectize");
require("selectize/dist/css/selectize.default");

import Selectize from "selectize"

export default class extends Controller {

    connect() {
        $('.selectize').selectize({
            maxItems: 1,
            valueField: 'id',
            labelField: 'lc_number',
            searchField: 'lc_number',
            create: function (input, callback) {
                $("#create").click()
                $("#letter_of_credit_lc_number").val(input);
                $("#new_letter_of_credit").on("submit", function(e) {
                    e.preventDefault();
                    $.ajax({
                        method: "POST",
                        url: $(this).attr("action"),
                        data: $(this).serialize(),
                        success: function(response) {
                            callback({value: response.id, text: response.lc_number});
                            $("#close-lc-modal").click()
                        }
                    });
                });
                callback();
            },
            render: {
                option: function (item, escape) {
                    console.log(item);
                    return '<div class="border-b border-gray-500 mb-2">' + '<p class="text-sm uppercase">' + escape(item.lc_number) + '</p>' + '<p class="ml-2 text-xs text-gray-200">' + escape(item.expiry_date) + '</p>' + '</div>';
                }
            },
            load: function (query, callback) {
                if (!query.length) return callback();
                $.ajax({
                    url: '/letter_of_credits/' + encodeURIComponent(query),
                    type: 'GET',
                    dataType: "json",
                    error: function (err) {
                        console.log(err);
                        callback();
                    },
                    success: function (res) {
                        console.log(res);
                        callback(res);
                    }
                });
            }
        });
    }
}