export function goToLogin(that) {
    that.$router.replace('/login');
}

export function goToReportCase(that) {
    console.log("go to report case");
    that.$router.replace('/report');
}

export function goToCaseInfoView(that, caseId) {
    console.log("go to case info view");
    that.$router.replace('/caseInfo/' + caseId);
}

export function goToStationInfoView(that, sid) {
    console.log("go to Station info view");
    that.$router.replace('/stationInfo/' + sid);
}

export function goToPerson(that) {
    that.$router.replace('/person');
}

export function goToManage(that) {
    that.$router.replace('/manage');
}

export function goToOpenInfo(that) {
    console.log("go to open info view");
    that.$router.replace('/openInfo');
}