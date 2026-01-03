/// obj_login_controller Async - HTTP

var _id     = ds_map_find_value(async_load, "id");
var _status = ds_map_find_value(async_load, "status");

if (_status != 0) {
    login_status = "HTTP error";
    exit;
}

var _result = ds_map_find_value(async_load, "result");

// ===== LOGIN RESPONSE =====
if (_id == login_req_id) {
    if (_result == "OK") {
        login_status = "Success! Logged in.";
        logged_in    = true;
    } else if (_result == "ERROR_EMPTY") {
        login_status = "Type name and pass.";
        logged_in    = false;
    } else {
        // e.g. "ERROR" from PHP
        login_status = "Login failed: " + string(_result);
        logged_in    = false;
    }
}

// ===== REGISTER RESPONSE =====
if (_id == register_req_id) {
    if (_result == "OK") {
        login_status = "Registered! You can log in.";
    } else if (_result == "ERROR_TAKEN") {
        login_status = "Name already taken.";
    } else if (_result == "ERROR_EMPTY") {
        login_status = "Type name and pass.";
    } else {
        login_status = "Register failed: " + string(_result);
    }
}

// ===== SCORE RESPONSE =====
if (_id == score_req_id) {
    if (_result == "OK") {
        login_status = "Score submitted!";
    } else {
        login_status = "Score error: " + string(_result);
    }
}

// ===== LEADERBOARD RESPONSE =====
if (_id == leader_req_id) {
    leaderboard_data = _result;
    login_status     = "Leaderboard loaded.";
}
