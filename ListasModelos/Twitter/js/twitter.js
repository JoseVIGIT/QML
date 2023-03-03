// Funciones JavaScript

// Token para el usuario Bearer
function demoToken()
{
    var a = new Array(22).join('A')
    return a + String.fromCharCode(0x44, 0x69, 0x4a, 0x52, 0x51, 0x41, 0x41, 0x41, 0x41,
                                   0x41, 0x41, 0x74, 0x2b, 0x72, 0x6a, 0x6c, 0x2b, 0x71,
                                   0x6d, 0x7a, 0x30, 0x72, 0x63, 0x79, 0x2b, 0x42, 0x62,
                                   0x75, 0x58, 0x42, 0x42, 0x73, 0x72, 0x55, 0x48, 0x47,
                                   0x45, 0x67, 0x3d, 0x71, 0x30, 0x45, 0x4b, 0x32, 0x61,
                                   0x57, 0x71, 0x51, 0x4d, 0x62, 0x31, 0x35, 0x67, 0x43,
                                   0x5a, 0x4e, 0x77, 0x5a, 0x6f, 0x39, 0x79, 0x71, 0x61,
                                   0x65, 0x30, 0x68, 0x70, 0x65, 0x32, 0x46, 0x44, 0x73,
                                   0x53, 0x39, 0x32, 0x57, 0x41, 0x75, 0x30, 0x67)
}

function loadTweets (modelo, maxTweets, searchForText) {

    /* esquema de campos utilizados en JSON
    "statuses" [
        {
        "text" "Aggressive Ponytail #freebandnames",
        "user"
            "profile_image_url" "http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg"
            "profile_image_url_https" "https://si0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg",
        }
    ]
    */

    var from = ""

    // Lectura del token del usuario Bearer
    var bearerToken = encodeURIComponent(demoToken())
    var req = new XMLHttpRequest;

    req.open("GET", "https://api.twitter.com/1.1/search/tweets.json?from=" + from +
                    "&count=" + maxTweets + "&q=" + encodeURIComponent(searchForText));
    req.setRequestHeader("Authorization", "Bearer " + bearerToken);

    req.onreadystatechange = function() {
        var status = req.readyState;
        if (status === XMLHttpRequest.DONE) {

            var objectArray = JSON.parse(req.responseText);
            if (objectArray.errors !== undefined)
                console.log("Error fetching tweets: " + objectArray.errors[0].message)
            else {

                var leidos = objectArray["statuses"].length
                modelo.clear() // Cuando se lanza el clear elimina todos los datos y recargará con los nuevos que se lean
                for (var i=0; i<objectArray["statuses"].length; i++) {
                    modelo.append({
                        imgProfile: objectArray["statuses"][i]["user"]["profile_image_url"],
                        txtTweet: objectArray["statuses"][i]["text"]
                    })
                }

            }
        }
    }

    req.send();
}
