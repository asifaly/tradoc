import { Controller } from "stimulus"
import $ from 'jquery';
require("selectize/dist/css/selectize");
require("selectize/dist/css/selectize.default");

import Selectize from "selectize"

export default class extends Controller {

    connect() {
        $('.selectize').selectize({
            valueField: 'lc_number',
            labelField: 'lc_number',
            searchField: 'lc_number',
            create: true,
            render: {
                option: function(item, escape) {
                    console.log(item);
                    return '<div>' + '<span>' + escape(item.lc_number) + '</span>' + '</div>';
                }
            },
            load: function(query, callback) {
                if (!query.length) return callback();
                $.ajax({
                    url: '/letter_of_credits/' + encodeURIComponent(query),
                    type: 'GET',
                    dataType: "json",
                    error: function(err) {
                        console.log(err);
                        callback();
                    },
                    success: function(res) {
                        console.log(res);
                        callback(res);
                    }
                });
            }
        });
    }
}