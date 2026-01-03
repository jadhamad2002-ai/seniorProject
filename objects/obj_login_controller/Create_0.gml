/// obj_login_controller Create

// Current user data (filled from login/register screens)
login_username = "";
login_password = "";

// Status / flags
login_status = "Not logged in";
logged_in    = false;

// HTTP request ids
login_req_id    = -1;
register_req_id = -1;
score_req_id    = -1;
leader_req_id   = -1;

// Leaderboard raw text from server
leaderboard_data = "";

// ===== SIMPLE URL ENCODER =====
function url_encode(_str) {
    _str = string(_str);
    _str = string_replace_all(_str, " ", "%20");
    _str = string_replace_all(_str, "?", "%3F");
    _str = string_replace_all(_str, "&", "%26");
    _str = string_replace_all(_str, "=", "%3D");
    return _str;
}

// ===== LOGIN (POST) =====
start_login = function () {
    var url = "http://localhost/game/login.php"
        + "?username=" + url_encode(login_username)
        + "&password=" + url_encode(login_password);

    login_status = "Logging in...";
    login_req_id = http_request(url, "GET", -1, "");
};


// ===== REGISTER (POST) =====
start_register = function () {
    var url       = "http://localhost/game/register.php";
    var headers   = ds_map_create();
    ds_map_add(headers, "Content-Type", "application/x-www-form-urlencoded");

    var body = "username=" + url_encode(login_username)
             + "&password=" + url_encode(login_password);

    login_status    = "Registering...";
    register_req_id = http_request(url, "POST", headers, body);
};

// ===== SEND SCORE (GET, SIMPLE) =====
send_score = function () {
    if (!logged_in) {
        login_status = "Not logged in, cannot send score.";
        return;
    }

    var url = "http://localhost/game/submit_score.php"
        + "?username=" + url_encode(login_username)
        + "&score="    + string(global.score);

    login_status = "Sending score...";
    score_req_id = http_request(url, "GET", -1, "");
};

// ===== GET LEADERBOARD (GET) =====
get_leaderboard = function () {
    var url = "http://localhost/game/get_scores.php";

    login_status  = "Loading leaderboard...";
    leader_req_id = http_request(url, "GET", -1, "");
};
