export function checkLoginStatus(that) {
    if (that.$cookies.get("userid") != null) {
        that.isLogin = true;
    }
}

export function updateRole(that) {
    if (that.$cookies.get("role") == "管理员") {
        that.isManager = true;
    } else if (that.$cookies.get("role") == "警员") {
        that.isOfficer = true;
    }
}
