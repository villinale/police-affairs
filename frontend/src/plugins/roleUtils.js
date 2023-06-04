export var isLogin = false;
export var isManager = false;
export var isOfficer = false;

export function checkLoginStatus(that) {
    if (that.$cookies.get("userid") != null) {
        isLogin = true;
    }
}

export function updateRole(that) {
    if (that.$cookies.get("role") == "管理员") {
        isManager = true;
    } else if (that.$cookies.get("role") == "警员") {
        isOfficer = true;
    }
}
