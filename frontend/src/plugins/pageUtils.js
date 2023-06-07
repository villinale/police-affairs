export function goToLogin(that) {
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
    that.$router.push('/person');
}

export function goToManage(that) {
    that.$router.push('/manage');
}

export function goToOpenInfo(that) {
    that.$router.push('/openInfo');
}