export function goToLogin(that) {
    console.log("go to login view");
    that.$router.push('/login');
}

export function goToReportCase(that) {
    console.log("go to report case");
    that.$router.push('/report');
}

export function goToCaseInfoView(that, caseId) {
    console.log("go to case info view");
    that.$router.push('/caseInfo/' + caseId);
}

export function goToStationInfoView(that, sid) {
    console.log("go to Station info view");
    that.$router.push('/stationInfo/' + sid);
}

export function goToPerson(that) {
    console.log("go to goToPerson view");
    that.$router.push('/person');
}

export function goToManage(that) {
    console.log("go to goToManage view");
    that.$router.push('/manage');
}

export function goToOpenInfo(that) {
    console.log("go to open info view");
    that.$router.push('/openInfo');
}